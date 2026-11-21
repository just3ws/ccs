#!/usr/bin/env node
/**
 * scripts/series/stage-episode.mjs
 *
 * Packages and stages a 6-file media-pipeline cue bundle (.mp4, .vtt, .png, .yml,
 * .metadata.json, .manifest.json) into ~/ai/media-pipeline/whoistechcmty/chicago-code-camp/staged/.
 *
 * Usage:
 *   node scripts/series/stage-episode.mjs <episode-id> --dry-run
 *   node scripts/series/stage-episode.mjs <episode-id> --stage
 */

import { createHash } from 'node:crypto';
import { existsSync } from 'node:fs';
import { copyFile, mkdir, readFile, writeFile } from 'node:fs/promises';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { parseArgs } from 'node:util';

const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../..');

async function sha256File(filePath) {
  const buf = await readFile(filePath);
  return createHash('sha256').update(buf).digest('hex');
}

async function main() {
  const { values, positionals } = parseArgs({
    args: process.argv.slice(2),
    allowPositionals: true,
    options: {
      'dry-run': { type: 'boolean', default: false },
      stage: { type: 'boolean', default: false },
      help: { type: 'boolean', default: false },
    },
  });

  const episodeId = positionals[0];
  if (values.help || !episodeId || (!values['dry-run'] && !values.stage)) {
    console.log('Usage: node scripts/series/stage-episode.mjs <episode-id> (--dry-run | --stage)');
    process.exit(values.help ? 0 : 1);
  }

  const manifest = JSON.parse(await readFile(join(here, 'manifest.json'), 'utf8'));
  const ep = manifest.episodes.find((e) => e.id === episodeId);
  if (!ep) throw new Error(`Episode ${episodeId} not found in manifest.json`);

  const epDir = resolve(repoRoot, 'artifacts/series', episodeId);
  const mp4Path = join(epDir, `${episodeId}.mp4`);
  const vttPath = join(epDir, `${episodeId}.vtt`);
  const pngPath = join(epDir, `${episodeId}.png`);
  const buildInfo = JSON.parse(await readFile(join(epDir, 'build-info.json'), 'utf8'));

  for (const f of [mp4Path, vttPath, pngPath]) {
    if (!existsSync(f)) throw new Error(`Missing build output: ${f} — run build-episode.mjs first`);
  }

  const companionUrl = ep.companionPath
    ? `${manifest.companionBaseUrl}${ep.companionPath}`
    : `${manifest.companionBaseUrl}/`;

  const chapterBlock = buildInfo.chapters.map((c) => `${c.timestamp} ${c.label}`).join('\n');
  const disclosure = buildInfo.syntheticNarration
    ? `Narration disclosure: Voiceover generated with macOS text-to-speech (${buildInfo.voice}) from source-grounded scripts; all screenshots, dates, and code citations come directly from github.com/just3ws/ccs (prod-2012-05 / 1b5f639) and May 2012 Internet Archive captures.`
    : `Narration recorded directly by Mike Hall from source-grounded archival scripts.`;

  const description = [
    `${ep.title}`,
    '',
    `Companion essay & 1:1 archival gallery: ${companionUrl}`,
    `Repository (GNU AGPL v3): https://github.com/just3ws/ccs`,
    `Series Playlist: https://www.youtube.com/playlist?list=${manifest.playlistId}`,
    '',
    'Chapters:',
    chapterBlock,
    '',
    disclosure,
  ].join('\n');

  const tags = [
    'Chicago Code Camp',
    'Code Camp Server',
    'Ruby on Rails',
    'Software Archaeology',
    'Software Craftsmanship',
    'Chicago Tech',
  ];

  const mp4Sha = await sha256File(mp4Path);
  const vttSha = await sha256File(vttPath);
  const pngSha = await sha256File(pngPath);

  const ymlContent = [
    `title: ${JSON.stringify(ep.title)}`,
    `privacy: "private"`,
    `tags:`,
    ...tags.map((t) => `  - ${JSON.stringify(t)}`),
    `description: ${JSON.stringify(description)}`,
    `episode_release:`,
    `  episode_id: ${JSON.stringify(episodeId)}`,
    `  format: ${JSON.stringify(ep.renderFormat)}`,
    `  playlist_id: ${JSON.stringify(manifest.playlistId)}`,
    `  synthetic_narration: ${buildInfo.syntheticNarration}`,
    `  video_sha256: ${JSON.stringify(mp4Sha)}`,
    `  captions_sha256: ${JSON.stringify(vttSha)}`,
    '',
  ].join('\n');

  const ymlPath = join(epDir, `${episodeId}.yml`);
  await writeFile(ymlPath, ymlContent);
  const ymlSha = await sha256File(ymlPath);

  const metadataPath = join(epDir, `${episodeId}.metadata.json`);
  await writeFile(metadataPath, JSON.stringify({
    title: ep.title,
    description,
    tags,
    privacy: 'private',
    episode_id: episodeId,
    format: ep.format,
    render_format: ep.renderFormat,
    playlist_id: manifest.playlistId,
    synthetic_narration: buildInfo.syntheticNarration,
  }, null, 2) + '\n');

  const bundleManifestPath = join(epDir, `${episodeId}.manifest.json`);
  await writeFile(bundleManifestPath, JSON.stringify({
    schema_version: '1.0',
    episode_id: episodeId,
    render_format: ep.renderFormat,
    playlist_id: manifest.playlistId,
    outputs: {
      [`${episodeId}.mp4`]: mp4Sha,
      [`${episodeId}.vtt`]: vttSha,
      [`${episodeId}.png`]: pngSha,
      [`${episodeId}.yml`]: ymlSha,
    },
  }, null, 2) + '\n');

  const files = [
    `${episodeId}.mp4`,
    `${episodeId}.vtt`,
    `${episodeId}.png`,
    `${episodeId}.yml`,
    `${episodeId}.metadata.json`,
    `${episodeId}.manifest.json`,
  ];

  const targetDir = process.env.CCS_MEDIA_PIPELINE_STAGED_DIR || manifest.defaultStagedDir;
  if (values['dry-run']) {
    console.log(`DRY-RUN: would stage 6 files to ${targetDir}:`);
    for (const f of files) console.log(`  - ${f}`);
    return;
  }

  await mkdir(targetDir, { recursive: true });
  for (const f of files) {
    await copyFile(join(epDir, f), join(targetDir, f));
  }
  console.log(`Staged 6-file cue bundle to ${targetDir}`);
}

await main();
