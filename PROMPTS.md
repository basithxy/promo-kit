# PROMPTS - pick your input type, copy that ONE prompt, paste into Claude Code

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

GOAL: a 45-60s video that looks like a top-tier SaaS launch (Apple /
Linear / Vercel quality). NOT a slideshow.

MOTION (free browser tech, use heavily):
- GSAP for all motion: spring/elastic easing, timelines, staggered reveals.
- Three.js/WebGL for depth: slow camera drift, a floating/rotating product
  mockup, parallax layers.
- A slow-moving particle or gradient-mesh background - never flat/static.
- UI as clean animated HTML/CSS mockups (device frame, moving cursor,
  elements appearing). Nothing static longer than ~1.5s.

STRUCTURE (strict):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-8s: cinematic product-name reveal + one-line promise.
- 8-40s: 3 features, each = animated UI demo beat + a 4-6 word caption.
- 40-55s: fast benefit montage cut to the music.
- last 5s: strong CTA + URL + logo lockup.

VOICE: warm, confident, mid-energy narrator. Unhurried, lets lines breathe,
neutral US accent. Energy arc: calm on the hook, lifts through the
features, warm and inviting on the CTA.

AUDIO: upbeat modern background music at ~0.15 volume, ducked under the
voice. Tasteful SFX (low in mix): soft whoosh on each transition, a gentle
click when the cursor taps a UI element, a light pop when a feature card
appears, a soft chime on the final CTA/logo.

QUALITY PASS: after rendering, inspect 5 frames. If any scene looks flat or
slideshow-like, improve it and re-render. When done, tell me: output path,
duration, render time, and the single weakest scene.
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

GOAL: a 45-75s video that looks like a top-tier SaaS launch (Apple /
Linear / Vercel quality). NOT a raw screen capture.

MOTION (free browser tech, use heavily):
- GSAP for all overlay motion: spring easing, captions, highlights.
- Frame the recording in a clean device/browser mockup with soft shadow.
- Zoom into each click; highlight the cursor; add a subtle spotlight.
- Three.js/WebGL for intro/outro depth; slow-moving particle or gradient
  background on title cards - never flat/static.

STRUCTURE (strict):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-8s: cinematic product-name reveal + one-line promise.
- 8-55s: walk the recorded flow as 2-4 feature/step beats, each with a
  4-6 word caption; zoom to the action for each.
- last 5s: strong CTA + URL + logo lockup.

VOICE: warm, confident, mid-energy narrator. Unhurried, neutral US accent.
Calm on the hook, lifts through the steps, warm on the CTA.

AUDIO: upbeat background music at ~0.15 volume, ducked under the voice.
Tasteful SFX (low in mix): soft whoosh on transitions, a gentle click each
time the cursor taps in the footage, a soft chime on the final CTA.

QUALITY PASS: after rendering, inspect 5 frames. Fix any flat or broken
scene and re-render. When done, tell me: output path, duration, render
time, and the single weakest scene.
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

GOAL: a 45-60s video that looks like a top-tier SaaS launch (Apple /
Linear / Vercel quality). NOT a slideshow.

MOTION (free browser tech, use heavily):
- GSAP for all motion: spring easing, staggered reveals, caption timing.
- Three.js/WebGL for depth on title cards: slow camera drift, parallax.
- A slow-moving particle or gradient-mesh background - never flat/static.
- Each image on screen animated (zoom/pan/tilt); nothing static > 1.5s.

STRUCTURE (strict):
- 0-3s: bold HOOK - the pain point in big kinetic type, no logo yet.
- 3-8s: cinematic product-name reveal + one-line promise.
- 8-40s: 3 features, each = one animated screenshot beat + 4-6 word caption.
- 40-55s: fast benefit montage cut to the music.
- last 5s: strong CTA + URL + logo lockup.

VOICE: warm, confident, mid-energy narrator. Unhurried, neutral US accent.
Calm on the hook, lifts through the features, warm on the CTA.

AUDIO: upbeat background music at ~0.15 volume, ducked under the voice.
Tasteful SFX (low in mix): soft whoosh on each transition, a light pop when
a callout/card appears, a soft chime on the final CTA/logo.

QUALITY PASS: after rendering, inspect 5 frames. Fix any flat or broken
scene and re-render. When done, tell me: output path, duration, render
time, and the single weakest scene.
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
