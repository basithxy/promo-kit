---
format: 1920x1080
message: "Turn any idea into a published video — instantly, in your own voice."
arc: Pain (kinetic-type-beats) -> Product intro (kinetic-type-beats) -> Demo: idea-to-script (cursor-ui-demo) -> Demo: video+publish (device-surface-showcase) -> CTA (logo-assemble-lockup)
audience: solo creators, faceless-content channels, and small marketing teams making short-form social video
---

## Video direction

- **Palette** (from `frame.md`, blue-professional remixed onto Syllaby brand): white `bg` canvas throughout; `#6638D9` (`primary`) is the SOLE accent — every glow, underline, pill, cursor, and progress cue; near-black `text` for headlines; `text-muted` `#6B6B6B` for secondary copy. No second accent color anywhere (Frame 4's platform icons are generic rounded glyphs, not real brand colors/logos).
- **Type** — Mulish throughout, by role: `h1`/wordmark = display weight 700–800; body/secondary lines = 400–500; nothing below the frame's 1.4cqw legibility floor.
- **Motion grammar** — `power3` long-tail settle is the default for every entrance; no bounce/overshoot except the single sanctioned spring-pop payoffs named per-frame below (Frame 2's promise-line snap, Frame 5's button rise). VO-paced reveal model: at each frame's t=0 only what the voiceover is saying enters; every further piece (a card, a pill, a line) reveals on its own spoken cue, weighted into the back ~50% of the frame — never dumped at once.
- **Depth** — Frames 1–2 and 5 (the type-led / lockup beats) carry a slow-drifting Three.js/WebGL gradient-mesh field at low opacity behind the type for depth, per CLAUDE.md's motion-quality bar; Frames 3–4 (the UI demo) use CSS-3D tilts/parallax on the reconstructed surface instead — a webpage/app card genuinely floating in depth, not a flat screenshot.
- **Rhythm / held-frame allocation** — Frame 2 ends on a deliberate held breather (the brand promise, settled) before the demo gets busy; Frames 3–4 stay continuously revealing (the proof section, paced tightly to VO cues); Frame 5 is the closing held read — dead-static once the lockup completes.
- **Negative list** — no pasted screenshots anywhere (asset-descriptions.md couldn't confirm a real logo without a vision pass, so the brand mark is a typographic Mulish wordmark throughout, never a guessed logo file); no nav bars / scrollbars / real browser chrome beyond the intentional macOS-style window chrome in Frame 4; no lazy breathing; no slow pan/push in any frame's back half; no bouncy `back.out`/`elastic.out` outside the two named exceptions above; no floating decorative "AI" gradient blobs except the sanctioned Three.js field named above.

## Frame 1 — Hook

- scene: Bare canvas, big kinetic type stacks the pain line by line, no logo yet
- voiceover: "Coming up with video ideas — and actually making them — takes forever."
- duration: 4.053s
- transition_in: cut
- status: animated
- src: compositions/frames/01-hook.html
- type: hook
- persuasion: Pain agitation
- beat: frustration
- blueprint: kinetic-type-beats (Adapt)
- asset_candidates:

Adapt: keep the escalating-beat hard-cut signature, compressed from the blueprint's usual 7-12s Problem duration into 3 fast beats matched to the real 4.053s voice line.
Scene 1 (0.0–1.3s): solid white canvas; bold near-black type flashes in dead-center via hard-cut (no fade) — "Coming up with video ideas" — Centered, type-only, camera locked.
Scene 2 (1.3–2.6s): as the VO continues, the line hard-cuts in place to "…and actually making them" — same centered anchor, instant swap, no roll.
Scene 3 (2.6–4.053s): final beat lands — "takes forever" — scales slightly larger than the prior two beats (weight escalation) on a smooth `power3` settle, then HOLDS to the frame's end; at most subtle jitter.

narrativeRole: Opens on the shared frustration of every creator — ideas are easy to want, hard to ship. No brand yet.
keyMessage: Making video content consistently is exhausting.

## Frame 2 — Meet Syllaby

- scene: Brand name assembles center-frame over a slow-drifting gradient-mesh field; one-line promise types in beneath
- voiceover: "Meet Syllaby — turn any idea into a finished video, instantly."
- duration: 3.712s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-intro.html
- type: product_intro
- persuasion: Friction reduction
- beat: relief + curiosity
- blueprint: kinetic-type-beats (Adapt)
- asset_candidates:

Adapt: keep the Product_Intro "Introducing…" hard-cut namedrop signature, but resolve onto a typed promise + Mulish wordmark lockup instead of a logo mark (no confirmed real logo asset). A low-opacity Three.js gradient-mesh field drifts slowly behind the type for depth (per Video direction). Timing matched to the real 3.712s voice line.
Scene 1 (0.0–1.1s): canvas crossfades from Frame 1's flat white into the drifting gradient-mesh field (`primary` tint, low opacity); "Syllaby" wordmark hard-cut FLASHES in dead-center, bold display weight — Centered, ~35% of frame.
Scene 2 (1.1–2.5s): as the VO says "turn any idea into a finished video," a one-line promise types on beneath the wordmark with a trailing caret — Centered, wordmark dominant (3:1 size over the promise line), promise line secondary.
Scene 3 (2.5–3.712s): "instantly" lands — the promise's final word gets a `primary`-color underline sweep (drawn left→right) as a punctuation snap; the whole lockup settles on `power3` and HOLDS (deliberate breather per Video direction) — subtle jitter only, gradient field keeps its slow drift.

narrativeRole: Names the product and states its whole thesis in one breath, resolving the pain just named.
keyMessage: Syllaby turns ideas into finished videos, instantly.

## Frame 3 — Idea to script

- scene: Animated browser/app mockup — cursor types a topic into an idea-finder field, trending searches populate, a script drafts itself line by line
- voiceover: "Type an idea. Syllaby finds what people are searching — and writes the script."
- duration: 4.651s
- transition_in: crossfade
- status: animated
- src: compositions/frames/03-demo-script.html
- type: feature_showcase
- persuasion: Show-don't-tell proof
- beat: clarity + control
- blueprint: cursor-ui-demo (Adapt)
- asset_candidates:
- focal: reconstructed idea-finder + script-draft surface (animated HTML/CSS mockup — no captured screenshot; recreates the real "keyword research" / script-generation flow from visible-text.txt)
- sfx: key-press, pop, click, typing

Adapt: keep the cursor-drives-live-UI-response + camera-chase signature; adapt the surface and beats to Syllaby's real idea-to-script feature instead of a generic dashboard. Timing matched to the real 4.651s voice line.
Scene 1 (0.0–1.3s): a rounded, tinted-card app surface (per frame.md's card system) is already present, asymmetric 60/40 (surface left-weighted); the `primary`-accented custom cursor enters and types a topic into a search field character-by-character as the VO says "Type an idea" — camera holds static.
Scene 2 (1.3–2.8s): as the VO names "Syllaby finds what people are searching," the field's live response fires — a column of trending-topic pill cards springs into a staggered vertical cascade beside the field, each with a small search-volume figure counting up; camera pushes in slightly to chase the populating list — asymmetric 60/40, list fills the right two-thirds.
Scene 3 (2.8–4.651s): cursor clicks the top pill (press + ripple); the surface state swaps to a script panel sliding up from the bottom, and script lines type on one by one as the VO lands "and writes the script" — camera settles static on the script close-up as the final line lands, then HOLDS — subtle jitter only.

narrativeRole: First half of the single strongest demo beat — proves the product starts from a bare idea, not a blank page.
keyMessage: One typed idea becomes a researched, written script automatically.

## Frame 4 — Video, voice, and published

- scene: The script surface morphs into a video-editor/avatar mockup rendering the clip with a cloned voice waveform, then a content-calendar surface auto-fills with scheduled posts across platform icons
- voiceover: "Then it builds the video — your voice, your look — and publishes it everywhere."
- duration: 4.267s
- transition_in: push-slide LEFT
- status: animated
- src: compositions/frames/04-demo-publish.html
- type: benefit_highlight
- persuasion: Feature-to-benefit translation
- beat: ease + confidence
- blueprint: device-surface-showcase (Adapt, floating-window variant)
- asset_candidates:
- focal: reconstructed video-editor/avatar preview + content-calendar surface (animated HTML/CSS mockup — no captured screenshot)
- sfx: chime, whoosh, pop

Adapt: keep the push-in -> zoom-out arc and the screen-cycle-via-scroll signature; adapt the two screens to Syllaby's real flow (voice/avatar preview, then auto-scheduled calendar) instead of a generic sidebar list. Timing matched to the real 4.267s voice line.
Scene 1 (0.0–1.0s): Frame 3's script panel card-morphs into a floating macOS-style editor window (traffic lights + tabs, tinted chrome) on a soft `primary`-tinted gradient backdrop; the first screen — a video preview frame with a talking-avatar placeholder + a voice waveform beneath — is visible as the VO says "Then it builds the video" — camera pushes in slightly; Centered, ~55% of frame.
Scene 2 (1.0–2.4s): as the VO names "your voice, your look," the waveform bars pulse in a deterministic pattern beside an avatar-style thumbnail that scale-swaps between two style options, with a brief `primary` glow on a "your voice" label — camera holds, continuing its slow push.
Scene 3 (2.4–4.267s): the window transitions (old screen pushes out, new pulls up) to a content-calendar surface — a weekly grid where rounded platform-glyph cards pop into their scheduled slots in a staggered cascade as the VO lands "and publishes it everywhere"; camera zooms back out to frame the full calendar; HOLDS on the completed, fully-scheduled calendar — subtle jitter only.

narrativeRole: Second half of the same demo flow — the script becomes a finished, on-brand, published video with zero manual editing.
keyMessage: Syllaby finishes the job end to end: video, voice, and distribution.

## Frame 5 — CTA

- scene: Product mockups clear off all four edges; the Syllaby wordmark draws itself in center-frame, CTA and URL lock up beneath
- voiceover: "Start your free trial — free for seven days, at syllaby dot io."
- duration: 4.053s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/05-cta.html
- type: cta
- persuasion: Risk reversal
- beat: motivation + urgency-to-act
- blueprint: logo-assemble-lockup (Adapt, CTA button-build variant)
- asset_candidates:
- focal: typographic Mulish wordmark lockup (no captured logo asset used — asset-descriptions.md couldn't confirm a real logo without a vision pass)
- sfx: whoosh, pop, chime

Adapt: keep the draw-on stroke + letter-by-letter wordmark-build signature; the opening clear-the-stage beat is Frame 4's calendar dispersing (continuity) rather than a generic headline clearing off-top. A low-opacity Three.js gradient-mesh field carries over from Frame 2 for depth. Timing matched to the real 4.053s voice line.
Scene 1 (0.0–1.1s): Frame 4's calendar cards slide outward and clear off all four edges onto the clean gradient-mesh canvas as the VO begins "Start your free trial" — a rounded `primary` CTA-pill button rises/scales into center, its border drawing on as a glowing outline stroke; Centered, ~40% of frame, generous negative space.
Scene 2 (1.1–2.3s): as the VO says "free for seven days," a small "7-day free trial" badge springs in just above the button and settles; the button's fill pulses once with a soft glow underlining the offer — camera locked, no push.
Scene 3 (2.3–4.053s): the "Syllaby" wordmark builds in letter-by-letter beneath the button as the VO lands "at syllaby dot io," completing the lockup; the full lockup settles on `power3` and HOLDS to the frame's end — subtle jitter only, dead-static final read.

narrativeRole: Closes on a low-risk, immediate action with the brand mark as the last thing on screen.
keyMessage: Try Syllaby free for 7 days at syllaby.io.
