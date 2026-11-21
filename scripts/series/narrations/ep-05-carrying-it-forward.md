---
episode_id: ep-05-carrying-it-forward
title: "From Chicago Code Camp to AGPLv3 Code Camp Server"
format: "16:9"
privacy: private
voice_mode: synthetic
pronunciation:
  ccs: C-C-S
  AGPLv3: A-G-P-L version 3
  GPL: G-P-L
  Colima: co-LEE-mah
---

<!-- cue:title-open -->
Episode Five: Carrying Chicago Code Camp forward — preserving 16 years of git history, switching main to GNU AGPLv3, and charting the Rails 8 and Railway roadmap for Code Camp Server.

<!-- cue:lineage -->
We didn't want to throw away the past or start a disconnected repo. So we tagged the last known-good 2012 production commit as prod-2012-05, archived the 2018 master branch as archive/master-2018, preserved the 2025-12 Colima oracle untouched, and branched a fresh main directly from 2012 production.

<!-- cue:agpl -->
From April 2010 onward, ccs was licensed under GPL v2 because the intent was always a community-run, share-alike conference server. For a hosted web app, GPL leaves a network loophole. Moving main to GNU AGPLv3 closes that gap and honors the original spirit of contributing improvements back to the community.

<!-- cue:roadmap -->
With the static HTML mirror, 23 screenshots, and this series preserving the 2012 Chicago Code Camp site permanently, the path forward is clean: port the 19-table schema and 17 models onto current Ruby and Rails 8 right inside main, extract Chicago-specific settings into event configuration, and deploy a modern, reusable Code Camp Server on Railway — keeping the Colima 2012 container beside us as the behavioral oracle.

<!-- cue:outro -->
Thank you for walking down memory lane with Chicago Code Camp. Follow the code at github.com/just3ws/ccs and the companion series on just3ws.com.
