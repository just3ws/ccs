---
episode_id: s-05-ruby-193-apple-silicon
title: "Compiling Ruby 1.9.3 on Apple Silicon in 2026"
format: "9:16"
privacy: private
voice_mode: synthetic
pronunciation:
  Colima: co-LEE-mah
  aarch64: arm 64
---

<!-- cue:hook -->
Can you compile Ruby 1.9.3 from 2014 on an Apple Silicon Mac in 2026?

<!-- cue:explain -->
Inside an Ubuntu 14.04 Colima container, Ruby 1.9.3's 2009 config.guess had never heard of aarch64, and ffi 1.0.11 failed compiling its bundled libffi. Copying Ubuntu 14.04's config.guess and config.sub and installing libffi-dev fixed both — and WEBrick answered HTTP 200 on localhost 3000.

<!-- cue:cta -->
Watch the full resurrection in Episode One!
