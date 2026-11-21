#!/usr/bin/env node
import { existsSync } from 'node:fs';
import { readFile } from 'node:fs/promises';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../..');

const manifest = JSON.parse(await readFile(join(here, 'manifest.json'), 'utf8'));
const ledger = JSON.parse(await readFile(join(here, 'evidence-ledger.json'), 'utf8'));

let errors = 0;
for (const [id, src] of Object.entries(ledger.sources)) {
  if (src.file) {
    const p = join(manifest.assetsDir, src.file);
    if (!existsSync(p)) {
      console.error(`MISSING asset for ledger ${id}: ${p}`);
      errors++;
    }
  }
}

for (const ep of manifest.episodes.filter((e) => e.status === 'active')) {
  const scene = JSON.parse(await readFile(resolve(repoRoot, ep.scenePath), 'utf8'));
  const md = await readFile(resolve(repoRoot, ep.narrationPath), 'utf8');
  const cueIds = new Set([...md.matchAll(/<!--\s*cue:([a-z0-9-]+)\s*-->/gi)].map((m) => m[1]));

  for (const beat of scene.beats) {
    if (!cueIds.has(beat.id)) {
      console.error(`${ep.id}: missing narration cue for beat ${beat.id}`);
      errors++;
    }
    for (const imgField of ['image', 'leftImage', 'rightImage']) {
      if (beat[imgField]) {
        const p = join(manifest.assetsDir, beat[imgField]);
        if (!existsSync(p)) {
          console.error(`${ep.id}: missing ${imgField} ${p}`);
          errors++;
        }
      }
    }
  }
}

if (errors > 0) {
  console.error(`Validation failed with ${errors} error(s).`);
  process.exit(1);
}
console.log(`Validation passed (${manifest.episodes.length} episodes in catalog, ${Object.keys(ledger.sources).length} ledger sources).`);
