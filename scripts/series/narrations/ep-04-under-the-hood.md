---
episode_id: ep-04-under-the-hood
title: "Under the Hood: Sesja, Feature Flags, ActiveAdmin & Proto-Observability"
format: "16:9"
privacy: private
voice_mode: synthetic
pronunciation:
  ccs: C-C-S
  Sesja: SESH-ya
  CanCan: Can-Can
  ActiveAdmin: Active Admin
  SimpleCov: Simple-Cov
  Rcov: R-cov
  Hoptoad: Hop-toad
  Heroku: heh-ROE-koo
---

<!-- cue:title-open -->
Episode Four: Under the hood of ccs — how visitors, speakers, and organizers each experienced the app, and the early tests and proto-observability already baked into this 2012 Rails 3 codebase.

<!-- cue:sesja-and-cfp -->
First, why is the talk model named Sesja? Because Session collides with Rails' HTTP session — so Sesja, Polish for session, avoided the clash while routing publicly at slash sessions. Meanwhile, VERSION_TAG in config/application.rb partitioned each year's talks via default_scope. And submitting a talk at slash submissions slash new automatically created a speaker account with a generated temporary password if no user existed for that email.

<!-- cue:speaker-and-auth -->
Access control ran on Devise 1, Devise Invitable, and CanCan's Ability class with a four-tier role hierarchy: guest, attendee, speaker, and admin. Speakers edited their own profiles and SpeakerRate links, and a custom EmailDomainValidator even ran live DNS MX record lookups on submitted email addresses.

<!-- cue:activeadmin-features -->
Organizers ran the entire conference from ActiveAdmin 0.4.3 at slash admin — managing 11 resources including live database feature flags via Feature.ok?. Preregistrations, image_logo, show_sponsors, and comments could all be flipped live without a Heroku redeploy.

<!-- cue:tests-and-observability -->
Long before OpenTelemetry or GitHub Actions, ccs already showed clear observability instincts: RSpec, Cucumber, and FactoryGirl for testing; SimpleCov configured with RcovFormatter to feed Hudson and Jenkins CI; Bullet wired in development.rb for N+1 query detection; HoptoadNotifier for exception tracking; and structured Rails.logger warnings on DNS and CSV export failures.

<!-- cue:outro -->
Next in Episode Five: why we switched main from GPL to GNU AGPLv3, how we preserved 16 years of git history, and the roadmap to a modern Rails 8 Code Camp Server on Railway.
