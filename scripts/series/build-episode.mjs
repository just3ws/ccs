#!/usr/bin/env node
/**
 * scripts/series/build-episode.mjs
 *
 * Builds a narrated, EBU R128 loudness-normalized YouTube MP4 + WebVTT captions +
 * thumbnail PNG + chapters JSON from scripts/series/scenes/<ep-id>.json and
 * scripts/series/narrations/<ep-id>.md.
 *
 * Supports Option A (macOS `say` synthetic archival narrator) and Option C
 * (drop-in human voice recordings at artifacts/series/<ep-id>/voice/<cue>.{wav,m4a,mp3}).
 *
 * Usage:
 *   node scripts/series/build-episode.mjs <episode-id> [--voice "Zoe (Premium)"]
 */

import { execFile } from 'node:child_process';
import { existsSync } from 'node:fs';
import { mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { parseArgs, promisify } from 'node:util';

const exec = promisify(execFile);
const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../..');
const FFMPEG = '/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg';
const FFPROBE = '/opt/homebrew/opt/ffmpeg-full/bin/ffprobe';
const FONT_SANS = '/System/Library/Fonts/Supplemental/Arial.ttf';
const FONT_MONO = '/System/Library/Fonts/SFNSMono.ttf';

function escapeDrawtext(text) {
  return String(text ?? '')
    .replace(/\\/g, '\\\\')
    .replace(/:/g, '\\:')
    .replace(/'/g, "\\'")
    .replace(/%/g, '\\%');
}

function formatVttTime(seconds) {
  const ms = Math.max(0, Math.round(seconds * 1000));
  const hrs = Math.floor(ms / 3_600_000);
  const mins = Math.floor((ms % 3_600_000) / 60_000);
  const secs = Math.floor((ms % 60_000) / 1000);
  const rem = ms % 1000;
  return `${String(hrs).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}.${String(rem).padStart(3, '0')}`;
}

function formatChapterTime(seconds) {
  const s = Math.max(0, Math.floor(seconds));
  const mins = Math.floor(s / 60);
  const secs = s % 60;
  return `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
}

function parseNarrationMd(markdown) {
  const pronunciation = {};
  const meta = {};
  let body = markdown;
  const fmMatch = markdown.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/);
  if (fmMatch) {
    body = fmMatch[2];
    const fm = fmMatch[1];
    for (const line of fm.split('\n')) {
      const m = line.match(/^([a-z_]+):\s*"?([^"\n]+)"?\s*$/);
      if (m && m[1] !== 'pronunciation') meta[m[1]] = m[2].trim();
    }
    const pronMatch = fm.match(/pronunciation:\n((?:[ \t]+.+\n?)*)/);
    if (pronMatch) {
      for (const line of pronMatch[1].split('\n')) {
        const kv = line.match(/^\s+([^:]+):\s*(.+?)\s*$/);
        if (kv) pronunciation[kv[1].trim()] = kv[2].trim();
      }
    }
  }
  const cues = new Map();
  const parts = body.split(/<!--\s*cue:([a-z0-9-]+)\s*-->/i);
  for (let i = 1; i < parts.length; i += 2) {
    const id = parts[i].trim();
    const text = (parts[i + 1] ?? '').replace(/\s+/g, ' ').trim();
    if (id && text) cues.set(id, text);
  }
  return { meta, pronunciation, cues };
}

function applyPronunciation(text, map) {
  let out = text;
  for (const [term, spoken] of Object.entries(map)) {
    const escaped = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    out = out.replace(new RegExp(`\\b${escaped}\\b`, 'g'), spoken);
  }
  return out;
}

async function probeDuration(filePath) {
  const { stdout } = await exec(FFPROBE, [
    '-v', 'error',
    '-show_entries', 'format=duration',
    '-of', 'default=noprint_wrappers=1:nokey=1',
    filePath,
  ]);
  const parsed = Number.parseFloat(stdout.trim());
  return Number.isFinite(parsed) ? parsed : 0;
}

async function prepareAudio(cueId, spokenText, voice, humanDir, outWavPath) {
  for (const ext of ['wav', 'm4a', 'mp3', 'aiff']) {
    const candidate = join(humanDir, `${cueId}.${ext}`);
    if (existsSync(candidate)) {
      await exec(FFMPEG, ['-y', '-i', candidate, '-ar', '48000', '-ac', '2', outWavPath]);
      return { synthetic: false, source: candidate };
    }
  }
  const aiffPath = `${outWavPath}.aiff`;
  try {
    await exec('say', ['-v', voice, '-o', aiffPath, spokenText]);
  } catch {
    await exec('say', ['-o', aiffPath, spokenText]);
  }
  await exec(FFMPEG, ['-y', '-i', aiffPath, '-ar', '48000', '-ac', '2', outWavPath]);
  await rm(aiffPath, { force: true });
  return { synthetic: true, source: `say:${voice}` };
}

async function renderBeat(beat, assetsDir, wavPath, durSec, leadSec, W, H, FPS, segPath) {
  const af = `adelay=${Math.round(leadSec * 1000)}|${Math.round(leadSec * 1000)},apad=whole_dur=${durSec.toFixed(3)}`;
  const commonOut = [
    '-t', durSec.toFixed(3),
    '-r', String(FPS),
    '-c:v', 'libx264', '-preset', 'veryfast', '-crf', '20', '-pix_fmt', 'yuv420p',
    '-c:a', 'aac', '-b:a', '192k', '-ar', '48000', '-ac', '2',
    segPath,
  ];

  if (beat.kind === 'card') {
    const bg = beat.bgColor || '#16161d';
    const headline = escapeDrawtext(beat.headline || beat.label);
    const sub = escapeDrawtext(beat.subheadline || '');
    const cap = escapeDrawtext(beat.caption || '');
    const headSize = W < 1200 ? 38 : 54;
    const subSize = W < 1200 ? 26 : 34;
    const capSize = W < 1200 ? 18 : 22;
    const vf = [
      `drawbox=x=0:y=${H - 92}:w=${W}:h=92:color=black@0.45:t=fill`,
      `drawtext=fontfile='${FONT_SANS}':text='${headline}':fontcolor=white:fontsize=${headSize}:x=(w-text_w)/2:y=(h/2)-80`,
      sub ? `drawtext=fontfile='${FONT_SANS}':text='${sub}':fontcolor=#e6c384:fontsize=${subSize}:x=(w-text_w)/2:y=(h/2)+10` : null,
      cap ? `drawtext=fontfile='${FONT_MONO}':text='${cap}':fontcolor=#dcd7ba:fontsize=${capSize}:x=(w-text_w)/2:y=${H - 58}` : null,
    ].filter(Boolean).join(',');

    await exec(FFMPEG, [
      '-y',
      '-f', 'lavfi', '-i', `color=c=${bg}:s=${W}x${H}:d=${durSec.toFixed(3)}:r=${FPS}`,
      '-i', wavPath,
      '-vf', vf,
      '-af', af,
      ...commonOut,
    ]);
    return;
  }

  if (beat.kind === 'pan') {
    const imgPath = join(assetsDir, beat.image);
    const cit = escapeDrawtext(beat.citation || beat.label);
    const vf = [
      `scale=${W}:-2`,
      `pad=${W}:max(ih\\,${H}):0:(oh-ih)/2:color=#16161d`,
      `crop=${W}:${H}:0:'(ih-${H})*t/${durSec.toFixed(3)}'`,
      `drawbox=x=0:y=${H - 64}:w=${W}:h=64:color=black@0.72:t=fill`,
      `drawtext=fontfile='${FONT_MONO}':text='${cit}':fontcolor=#f5f5f5:fontsize=22:x=36:y=${H - 42}`,
    ].join(',');

    await exec(FFMPEG, [
      '-y',
      '-loop', '1', '-t', durSec.toFixed(3), '-i', imgPath,
      '-i', wavPath,
      '-vf', vf,
      '-af', af,
      ...commonOut,
    ]);
    return;
  }

  if (beat.kind === 'split') {
    const leftImg = join(assetsDir, beat.leftImage);
    const rightImg = join(assetsDir, beat.rightImage);
    const halfW = Math.floor(W / 2);
    const leftLbl = escapeDrawtext(beat.leftLabel || 'LOCAL');
    const rightLbl = escapeDrawtext(beat.rightLabel || 'WAYBACK');
    const cit = escapeDrawtext(beat.citation || beat.label);
    const filterComplex = [
      `[0:v]scale=${halfW}:-2,pad=${halfW}:max(ih\\,${H}):0:(oh-ih)/2:color=#16161d,crop=${halfW}:${H}:0:'(ih-${H})*t/${durSec.toFixed(3)}'[L]`,
      `[1:v]scale=${halfW}:-2,pad=${halfW}:max(ih\\,${H}):0:(oh-ih)/2:color=#16161d,crop=${halfW}:${H}:0:'min(ih-${H}\\,1800)*t/${durSec.toFixed(3)}'[R]`,
      `[L][R]hstack=inputs=2,` +
        `drawbox=x=${halfW - 2}:y=0:w=4:h=${H}:color=#e6c384@0.9:t=fill,` +
        `drawbox=x=0:y=0:w=${W}:h=56:color=black@0.72:t=fill,` +
        `drawtext=fontfile='${FONT_MONO}':text='${leftLbl}':fontcolor=#e6c384:fontsize=22:x=28:y=18,` +
        `drawtext=fontfile='${FONT_MONO}':text='${rightLbl}':fontcolor=#98bb6c:fontsize=22:x=${halfW + 28}:y=18,` +
        `drawbox=x=0:y=${H - 64}:w=${W}:h=64:color=black@0.76:t=fill,` +
        `drawtext=fontfile='${FONT_MONO}':text='${cit}':fontcolor=#f5f5f5:fontsize=22:x=36:y=${H - 42}[V]`,
      `[2:a]${af}[A]`,
    ].join(';');

    await exec(FFMPEG, [
      '-y',
      '-loop', '1', '-t', durSec.toFixed(3), '-i', leftImg,
      '-loop', '1', '-t', durSec.toFixed(3), '-i', rightImg,
      '-i', wavPath,
      '-filter_complex', filterComplex,
      '-map', '[V]', '-map', '[A]',
      ...commonOut,
    ]);
    return;
  }

  throw new Error(`Unsupported beat kind: ${beat.kind}`);
}

async function main() {
  const { values, positionals } = parseArgs({
    args: process.argv.slice(2),
    allowPositionals: true,
    options: {
      voice: { type: 'string', default: process.env.CCS_SERIES_VOICE ?? 'Zoe (Premium)' },
      help: { type: 'boolean', default: false },
    },
  });

  const episodeId = positionals[0];
  if (values.help || !episodeId) {
    console.log('Usage: node scripts/series/build-episode.mjs <episode-id> [--voice "Zoe (Premium)"]');
    process.exit(episodeId ? 0 : 1);
  }

  const manifest = JSON.parse(await readFile(join(here, 'manifest.json'), 'utf8'));
  const ep = manifest.episodes.find((e) => e.id === episodeId);
  if (!ep) throw new Error(`Episode ${episodeId} not found in manifest.json`);

  const scene = JSON.parse(await readFile(resolve(repoRoot, ep.scenePath), 'utf8'));
  const narration = parseNarrationMd(await readFile(resolve(repoRoot, ep.narrationPath), 'utf8'));

  const W = scene.format === '9:16' ? 1080 : 1920;
  const H = scene.format === '9:16' ? 1920 : 1080;
  const FPS = scene.fps ?? 30;
  const LEAD_SEC = 0.35;
  const TAIL_SEC = 0.65;

  const epDir = resolve(repoRoot, 'artifacts/series', episodeId);
  const workDir = join(epDir, 'work');
  const humanDir = join(epDir, 'voice');
  await rm(workDir, { recursive: true, force: true });
  await mkdir(workDir, { recursive: true });
  await mkdir(humanDir, { recursive: true });

  const segPaths = [];
  const vttLines = ['WEBVTT', ''];
  const chapters = [];
  let timeline = 0;
  let usedSynthetic = false;

  for (let i = 0; i < scene.beats.length; i++) {
    const beat = scene.beats[i];
    const tag = String(i).padStart(2, '0');
    const rawText = narration.cues.get(beat.id);
    if (!rawText) throw new Error(`Missing cue <!-- cue:${beat.id} --> in ${ep.narrationPath}`);
    const spoken = applyPronunciation(rawText, narration.pronunciation);

    const wavPath = join(workDir, `speech-${tag}.wav`);
    const audioInfo = await prepareAudio(beat.id, spoken, values.voice, humanDir, wavPath);
    if (audioInfo.synthetic) usedSynthetic = true;

    const speechSec = await probeDuration(wavPath);
    const durSec = Math.max(4.0, LEAD_SEC + speechSec + TAIL_SEC);
    const segPath = join(workDir, `seg-${tag}.mp4`);

    console.log(`[${tag}] ${beat.id} (${beat.kind}, ${durSec.toFixed(1)}s, ${audioInfo.source})`);
    await renderBeat(beat, manifest.assetsDir, wavPath, durSec, LEAD_SEC, W, H, FPS, segPath);

    chapters.push({ timestamp: formatChapterTime(timeline), label: beat.label });
    segPaths.push(segPath);
    vttLines.push(
      String(i + 1),
      `${formatVttTime(timeline + LEAD_SEC)} --> ${formatVttTime(timeline + LEAD_SEC + speechSec)}`,
      rawText,
      '',
    );
    timeline += durSec;
  }

  const concatList = join(workDir, 'concat.txt');
  await writeFile(concatList, segPaths.map((p) => `file '${p.replace(/'/g, "'\\''")}'`).join('\n') + '\n');

  const rawConcat = join(workDir, 'concat.mp4');
  await exec(FFMPEG, ['-y', '-f', 'concat', '-safe', '0', '-i', concatList, '-c', 'copy', rawConcat]);

  const finalMp4 = join(epDir, `${episodeId}.mp4`);
  const finalVtt = join(epDir, `${episodeId}.vtt`);
  const finalPng = join(epDir, `${episodeId}.png`);
  const buildInfoPath = join(epDir, 'build-info.json');

  await exec(FFMPEG, [
    '-y', '-i', rawConcat,
    '-c:v', 'copy',
    '-af', 'loudnorm=I=-16:TP=-1.5:LRA=11',
    '-c:a', 'aac', '-b:a', '192k', '-movflags', '+faststart',
    finalMp4,
  ]);

  // Thumbnail from the first title card frame
  await exec(FFMPEG, ['-y', '-ss', '0.5', '-i', segPaths[0], '-vframes', '1', finalPng]);

  await writeFile(finalVtt, vttLines.join('\n'));
  const finalDur = await probeDuration(finalMp4);
  await writeFile(buildInfoPath, JSON.stringify({
    episodeId,
    durationSec: Number(finalDur.toFixed(2)),
    width: W,
    height: H,
    fps: FPS,
    syntheticNarration: usedSynthetic,
    voice: usedSynthetic ? values.voice : 'human',
    chapters,
  }, null, 2) + '\n');

  console.log(`Built ${episodeId}: ${finalMp4} (${W}x${H}, ${finalDur.toFixed(1)}s, synthetic=${usedSynthetic})`);
}

await main();
