---
name: ccs-archival-steward
description: Preserve Chicago Code Camp (ccs) historical lineage, operate the 2012 Colima oracle, and keep archival outputs grounded in primary sources.
---

# CCS Archival Steward

Use this skill when inspecting `just3ws/ccs` history, running the 2012 Ruby 1.9.3 reference oracle, or publishing retrospectives/media from the archive.

## Non-Negotiable Anchors
- `prod-2012-05` (`1b5f639`, May 15, 2012): Last known-good 2012 Chicago Code Camp production baseline.
- `main`: Active GNU AGPL v3 branch starting from `1b5f639`.
- `archive/master-2018` (`2438832`), `origin/2012-05`, `origin/2.0`, `origin/2025-12`: Historical branches—never rewrite or delete.

## Standard Commands
- Inspect status: `script/ccs-archive status`
- Boot 2012 oracle: `script/ccs-archive boot`
- Stop 2012 oracle: `script/ccs-archive down`
- Capture static mirror: `script/ccs-archive snapshot`
- Manpage: `man ./doc/man/ccs-archive.1`

## Provenance & Respect Rules
- Verify every route, sponsor, speaker, and date against `prod-2012-05`, the running oracle, or May 2012 Wayback Machine snapshots (`20120518214850`, `20120506020818`, `20120506022442`, `20120421092014`).
- Treat historical community figures (including Dave Bost) with respect.
- When publishing AI-assisted syntheses to `just3ws.github.io`, quarantine them under `/ai/` with `robots: noindex,follow`, `sitemap: false`, and an explicit provenance banner.
