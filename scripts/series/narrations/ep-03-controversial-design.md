---
episode_id: ep-03-controversial-design
title: "The Anti-Corporate Design: Triadic Sass, #color-proof & 2012 A11y"
format: "16:9"
privacy: private
voice_mode: synthetic
pronunciation:
  ccs: C-C-S
  Sass: Sass
  Formtastic: Form-tastic
  Haml: Hamil
  A11y: accessibility
  Modernizr: Modern-izer
---

<!-- cue:title-open -->
Episode Three: The design ethos of Chicago Code Camp 2012 — intentionally creative, deliberately non-corporate, and built with an early living style guide right inside the app.

<!-- cue:triadic-sass -->
In app/stylesheets/_colors.sass, the entire site is driven by a hand-tuned color triad: maroon #800000 as the primary gradient backdrop, paired with minus-120-degree blue #004080 and plus-120-degree green #00803F, each stepped into 33 and 66 percent tints. Written in indented Sass — not SCSS — with lowercase headings across h1 through h5, Open Sans from Google Web Fonts, and asymmetric rounded cards.

<!-- cue:color-proof -->
Run the app in development mode and you see something corporate templates never had: shared/color_proof renders the entire triadic swatch bar right below the footer so you can eyeball color harmony live in the browser. Add question-mark dss equals 1 to any URL, and ApplicationHelper injects diagnostic.css on demand.

<!-- cue:ie-and-js -->
This was 2012, before Rails 3.1's Sprockets asset pipeline. JavaScript lived in public/javascripts, loaded via javascript_expansions defaults: jQuery replacing Prototype, jQuery Validate, jQuery Placeholder, and Modernizr for HTML5 feature detection. And IE6 and IE7 still mattered enough to load formtastic_ie6.css, formtastic_ie7.css, and html5shiv from Google Code.

<!-- cue:a11y-2012 -->
Accessibility in 2012 lived in Formtastic's semantic fieldset, legend, and label tags — visible here on the call-for-papers form — inside a pre-ARIA layout of header, content, sidebar, and footer divs.

<!-- cue:outro -->
Next in Episode Four: under the hood with Sesja, database feature flags, ActiveAdmin 0.4.3, and the proto-observability already baked into ccs.
