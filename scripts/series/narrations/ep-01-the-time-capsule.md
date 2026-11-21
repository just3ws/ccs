---
episode_id: ep-01-the-time-capsule
title: "The Time Capsule: Booting 2012 Chicago Code Camp on Apple Silicon"
format: "16:9"
privacy: private
voice_mode: synthetic
pronunciation:
  ccs: C-C-S
  Sesja: SESH-ya
  RVM: R-V-M
  Colima: co-LEE-mah
  aarch64: arm 64
  AGPLv3: A-G-P-L version 3
  Heroku: heh-ROE-koo
  Wayback: Way-back
  Formtastic: Form-tastic
  Haml: Hamil
---

<!-- cue:title-open -->
Fourteen years is an eternity in web software. This is Episode One of Chicago Code Camp to Code Camp Server: resurrecting the May 2012 Rails 3 production app on Apple Silicon, and matching it one-to-one against the Internet Archive.

<!-- cue:provenance-git -->
The story starts in git on January 23, 2010, with commit a8f4b11. Across three consecutive May conferences and 796 commits, ccs grew from a weekend Rails 2.3 site into a Rails 3.0.11 conference platform deployed on Heroku at chicagocodecamp.com. Its last 2012 commit, tagged prod-2012-05, landed on May 15, 2012 — four days before the camp.

<!-- cue:colima-boot -->
To see what it actually looked like without installing ancient Rubies on macOS, we booted the 2025-12 Docker oracle inside Colima. On Apple Silicon, Ruby 1.9.3's 2009 config.guess didn't recognize aarch64, and ffi 1.0.11 needed Ubuntu 14.04's system libffi. Two small Dockerfile fixes later, WEBrick on Ruby 1.9.3 answered HTTP 200 on localhost 3000 — complete with Jane Ashley's logo, lowercase headings, and the dev-mode color-proof swatch bar.

<!-- cue:split-home-compare -->
Place the local Colima boot side-by-side with the Internet Archive's May 18, 2012 capture — taken one day before the conference — and it's a one-to-one match: the same maroon triadic gradient, the same navigation pills, and the same speaker login card, now filled with the real May 2012 session lineup.

<!-- cue:wayback-sponsors -->
Because the local dev database only holds seed rows, the Wayback Machine fills in the living history: twelve sponsors on May 6, 2012 — Microsoft at Platinum, Platinum Consulting Services at Gold, 8th Light, Centare, Groupon, LogicNP, Telerik, ThoughtWorks, and Twilio at Silver, plus GitHub, JetBrains, and Neudesic at Bronze.

<!-- cue:community-lineage -->
And thirty-two speakers on the May 2012 roster, built by a community that showed up year after year — with contributions in git from Mike Hall, Sergio Pereira, Adam Walters, and Dustin Updyke, and early speaker archives preserving the memory of community friends including Dave Bost.

<!-- cue:outro-next -->
We've anchored prod-2012-05, archived the old master branch, and moved main to GNU AGPLv3. Next in Episode Two, we dig into the design ethos, ActiveAdmin, feature flags, and the proto-observability already baked into this 2012 codebase. Check the companion series on just3ws.com.
