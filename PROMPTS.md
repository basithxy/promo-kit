# PROMPTS - pick your input type, copy that ONE prompt, paste into Claude Code

> Faster option: type `/video-agent` in Claude Code instead and answer a short
> guided interview (video type, style, name, URL/screenshots/recording) - it
> builds the exact prompt below from your answers, no copy-paste needed. This
> file is still the canonical wording `/video-agent` reuses, and still works
> standalone if you'd rather paste by hand.

There are only 3 ways you give input. Each prompt below is COMPLETE -
cinematic animation, voice, music, and sound effects are all baked in.
Just change <PRODUCT>, <URL>/<NAME>, paste, and walk away.

Everything here is 100% Claude-only and $0 - no API keys, no other AI models.


===================================================================
## 1) FROM A URL   (your default - just give a link)
===================================================================
Change <PRODUCT>, <URL>, <NAME>. That's it.
```
You are producing a finished, launch-ready promo video. Work in
./videos/<NAME>/ and follow CLAUDE.md. Output ./videos/<NAME>/output.mp4.
Be fully autonomous: fix any lint/render errors yourself and keep going
until the MP4 exists and passes the quality pass below.

PRODUCT: <PRODUCT> - <URL>
Scrape the URL for the name, tagline, key features, screenshots, and brand
colors/fonts. Recreate the key UI as animated mockups (do not just paste
screenshots).

GOAL: a punchy, ≤30s conversion spot (not a brand film) that looks like a
top-tier SaaS launch (Apple / Linear / Vercel quality). No filler beat - every
second earns its place. (Want the fuller 45-90s feature tour instead? Say so
explicitly - this tight cut is the default.)

MOTION (free browser tech, use heavily):
- GSAP for all motion: spring/elastic easing, timelines, staggered reveals.
- Three.js/WebGL for depth: slow camera drift, a floating/rotating product
  mockup, parallax layers.
- A slow-moving particle or gradient-mesh background - never flat/static.
- UI as clean animated HTML/CSS mockups (device frame, moving cursor,
  elements appearing). Nothing static longer than ~1.5s.

STRUCTURE (strict, compressed 3-act, ≤30s total):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-6s: cinematic product-name reveal + one-line promise.
- 6-24s: ONE sharp demo beat - the single strongest feature/value-prop,
  shown live. Not a 3-feature tour - pick the one thing that sells it.
- 24-30s: strong CTA + URL + logo lockup - "Try it free" / "Buy now."

VOICE: warm, confident, mid-energy narrator. Unhurried, lets lines breathe,
neutral US accent. Energy arc: calm on the hook, lifts through the demo,
warm and inviting on the CTA. Script budget: ~70-75 words total for 30s at a
natural pace - don't cram more in, cut copy instead.

AUDIO: upbeat modern background music at ~0.15 volume, ducked under the
voice. Tasteful SFX (low in mix, full 21-sound library available - see
CLAUDE.md's cue-mapping table): soft whoosh on each transition, a gentle
click when the cursor taps a UI element, a light pop when an element
appears, a soft chime on the final CTA/logo.

QUALITY PASS: iterate at `--quality draft`; only render `standard`/`high`
once, after draft frames look right. Inspect 3-4 frames from that final
render. If any scene looks flat or slideshow-like, fix and re-render once
more. When done, tell me: output path, duration, render time, and the
single weakest scene.
```


===================================================================
## 2) FROM A SCREEN RECORDING   (show the product live)
===================================================================
First put your recording at ./videos/<NAME>/input/recording.mp4
(see RECORDING TIPS at the bottom). Then change <PRODUCT>, <NAME>.
```
You are producing a finished, launch-ready promo/tutorial video. Work in
./videos/<NAME>/ and follow CLAUDE.md. Output ./videos/<NAME>/output.mp4.
Be fully autonomous: fix any lint/render errors yourself until the MP4
exists and passes the quality pass below.

PRODUCT: <PRODUCT>
INPUT: a screen recording at ./videos/<NAME>/input/recording.mp4.
Use it as the real product footage. Extract keyframes at the moments the
UI changes, zoom/pan into the action area, and cut cleanly around clicks.

GOAL: a punchy, ≤30s conversion spot (not a raw screen capture, not a brand
film) that looks like a top-tier SaaS launch (Apple / Linear / Vercel
quality). Every second earns its place. (Want the fuller 45-75s walkthrough
instead? Say so explicitly - this tight cut is the default.)

MOTION (free browser tech, use heavily):
- GSAP for all overlay motion: spring easing, captions, highlights.
- Frame the recording in a clean device/browser mockup with soft shadow.
- Zoom into each click; highlight the cursor; add a subtle spotlight.
- Three.js/WebGL for intro/outro depth; slow-moving particle or gradient
  background on title cards - never flat/static.

STRUCTURE (strict, compressed 3-act, ≤30s total):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-6s: cinematic product-name reveal + one-line promise.
- 6-24s: walk the ONE strongest moment from the recording - zoom to the
  action, highlight the cursor. Not a multi-step tour - the single clearest
  proof this works.
- 24-30s: strong CTA + URL + logo lockup.

VOICE: warm, confident, mid-energy narrator. Unhurried, neutral US accent.
Calm on the hook, lifts through the demo, warm on the CTA. Script budget:
~70-75 words total for 30s - cut copy rather than cramming more in.

AUDIO: upbeat background music at ~0.15 volume, ducked under the voice.
Tasteful SFX (low in mix, full 21-sound library available - see CLAUDE.md's
cue-mapping table): soft whoosh on transitions, a gentle click each time the
cursor taps in the footage, a soft chime on the final CTA.

QUALITY PASS: iterate at `--quality draft`; only render `standard`/`high`
once, after draft frames look right. Inspect 3-4 frames from that final
render. Fix any flat or broken scene and re-render once more. When done,
tell me: output path, duration, render time, and the single weakest scene.
```


===================================================================
## 3) FROM SCREENSHOTS / PHOTOS   (a few images, no URL, no recording)
===================================================================
First drop your images in ./videos/<NAME>/input/  (PNG or JPG).
Then change <PRODUCT>, <NAME>, and the one-line description.
```
You are producing a finished, launch-ready promo video. Work in
./videos/<NAME>/ and follow CLAUDE.md. Output ./videos/<NAME>/output.mp4.
Be fully autonomous: fix any lint/render errors yourself until the MP4
exists and passes the quality pass below.

PRODUCT: <PRODUCT> - <one-line description>. Target audience: <who>.
INPUT: screenshots/photos in ./videos/<NAME>/input/.
Do NOT show them as flat static slides. Place each inside a clean device/
browser mockup, and add motion: slow zoom/pan (Ken Burns), parallax, and
animated captions/callouts pointing to key parts of each image.

GOAL: a punchy, ≤30s conversion spot (not a slideshow, not a brand film)
that looks like a top-tier SaaS launch (Apple / Linear / Vercel quality).
Every second earns its place. (Want the fuller 45-60s feature tour instead?
Say so explicitly - this tight cut is the default.)

MOTION (free browser tech, use heavily):
- GSAP for all motion: spring easing, staggered reveals, caption timing.
- Three.js/WebGL for depth on title cards: slow camera drift, parallax.
- A slow-moving particle or gradient-mesh background - never flat/static.
- Each image on screen animated (zoom/pan/tilt); nothing static > 1.5s.

STRUCTURE (strict, compressed 3-act, ≤30s total):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-6s: cinematic product-name reveal + one-line promise.
- 6-24s: ONE animated screenshot beat - the single strongest shot, with a
  callout on the key detail. Not a 3-shot tour - pick the one that sells it.
- 24-30s: strong CTA + URL + logo lockup.

VOICE: warm, confident, mid-energy narrator. Unhurried, neutral US accent.
Calm on the hook, lifts through the demo, warm on the CTA. Script budget:
~70-75 words total for 30s - cut copy rather than cramming more in.

AUDIO: upbeat background music at ~0.15 volume, ducked under the voice.
Tasteful SFX (low in mix, full 21-sound library available - see CLAUDE.md's
cue-mapping table): soft whoosh on each transition, a light pop when a
callout/card appears, a soft chime on the final CTA/logo.

QUALITY PASS: iterate at `--quality draft`; only render `standard`/`high`
once, after draft frames look right. Inspect 3-4 frames from that final
render. Fix any flat or broken scene and re-render once more. When done,
tell me: output path, duration, render time, and the single weakest scene.
```


===================================================================
## OPTIONAL: fuller 45-90s tour (instead of the default ≤30s cut)
===================================================================
Only use this if you explicitly want a longer feature-tour/brand piece -
otherwise the ≤30s STRUCTURE in each prompt above is the default. Swap in
this STRUCTURE (keep everything else - MOTION/VOICE/AUDIO/QUALITY PASS - the
same, adjusting the script-length budget upward accordingly):
```
STRUCTURE (strict, 45-90s total):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-8s: cinematic product-name reveal + one-line promise.
- 8-40s: 3 features/steps, each = animated demo beat + a 4-6 word caption.
- 40-55s: fast benefit montage cut to the music.
- last 5s: strong CTA + URL + logo lockup.
```


===================================================================
## CHANGE THINGS AFTER - tweak a finished video (fast, no full re-run)
===================================================================
```
Keep the current video in ./videos/<NAME>/ but change only:
- <e.g. rewrite scene 2 script, it's boring>
- <e.g. accent color to #FF5A1F>
- <e.g. swap voiceover to a calmer, deeper male voice>
- <e.g. add cursor-click + transition-whoosh SFX>
Re-render only what changed.
```

Voice swap-ins (drop into any prompt if you don't want the default):
- Premium/serious: "a deeper, calm male voice, slow and assured."
- Friendly/startup: "a warm mid-range female voice, upbeat but natural."
- Punchy/social ad: "energetic and snappy, quick pacing, youthful."
- Other language: "narrate in Tamil" / "in Sinhala" / "British accent."


===================================================================
## RECORDING TIPS (only for approach #2)
===================================================================
1. Record 1080p+ , 16:9, 30 or 60 fps. (Mac: Cmd+Shift+5)
2. Clean screen: full-screen the app, hide bookmarks, mute notifications,
   zoom UI up so text is large.
3. Move slowly; pause ~1s before/after each click so it can cut cleanly.
4. One clear flow per feature; 2-3 flows is plenty. Keep raw under ~3 min.
5. No need to talk - the AI voiceover replaces your audio. Silent is fine.


## HANDY
- One video per Claude session. Run /usage after to see % of window used.
- If a run stops midway: reopen claude here and say "Continue the render in
  ./videos/<NAME>/ - check state and finish it."
