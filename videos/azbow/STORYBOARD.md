---
format: 1920x1080
message: "Azbow builds custom software, apps, and marketing engineered around your business — not off the shelf."
arc: PAS (compressed) — hook/contrast -> product intro -> proof/demo -> CTA
audience: small-to-midsize business owners/decision-makers evaluating a custom software, app, or digital-marketing partner
mode: autonomous
music: confident modern tech underscore, moderate-upbeat energy, lifts slightly into the demo beat
---

## Video direction

**Palette system** (from `frame.md`, blue-professional preset remixed onto Azbow brand): warm cream `bg` is the ground on every frame; `primary` (deep navy, standing in the preset's single-accent "cobalt" role) is the ONE accent — carries every eyebrow, numeral, CTA, accent-line, and progress bar; `text` is the near-black headline ink; `text-muted` is body copy; cards use the tinted `card-bg` (4% fill / 20% border / 10-14px radius, never a shadow). No second accent color anywhere.

**Motion grammar + reveal model**: long-tail `power3` settle by default everywhere — this is a restrained, consulting-grade register, so overshoot/bounce/`back.out`/`elastic.out` are never used, not even on the hook. Every frame reveals paced to its voiceover cue — nothing appears before the VO says it; the opening beat of each frame carries only what the VO is saying at t=0. During any hold, the only sanctioned aliveness is a subtle low-amplitude jitter (`sine-wave-loop`) — no breathing, no back-half pan/push.

**Rhythm / held-frame allocation**: Frames 1-2 stay fast, cut-driven (kinetic-type hard cuts) to establish energy inside their short windows (~4-4.6s each, real synced voice duration). Frame 3 is the video's development beat — it earns its ~12.7s by building through six VO-paced scenes rather than holding early. Frame 3's final screen (Scene 6) and Frame 4's final press-state (Scene 4) are the two deliberate held/breather beats — content resolves and stays static so the proof and the CTA both land and read, rather than the whole video staying busy end to end.

**Negative list**: no bounce/overshoot as a default entrance; no lazy breathing or circular pulse "aliveness"; no slow pan/push in any scene's back half; no floating bokeh or purple-blue "AI" gradient; no browser chrome or real cursor except the one sanctioned aimed cursor in Frame 4's `cta-morph-press`; no square corners anywhere except the progress bar (system is pill/soft-radius only); no second accent color; no drop shadows on content (the tinted cards are shadow-free by design).

## Frame 1 — Hook

- scene: Big kinetic type states the contrast — generic software vs. a business built different. No logo yet.
- voiceover: "Your business isn't off-the-shelf. Your software shouldn't be either."
- duration: 3.968s
- transition_in: cut
- status: animated
- src: compositions/frames/01-hook.html
- type: hook
- persuasion: Negative contrast
- beat: tension -> clarity
- blueprint: kinetic-type-beats (Adapt) — hook-kinetic-type-escalation, compressed to 2 beats instead of a 3-beat climb
- focal: (typography only — no asset)
- roles: (no asset candidates for this frame)
- sfx: impact-bass-1
- asset_candidates:

Adapt: keep the signature move (each full-screen beat hard-cuts to the next, its own entrance, no lingering) but drop the escalation to a payoff element — this hook resolves on held text, not a spring-pop object, since the video has no logo yet.

Scene 1 (0.0–2.0s): solid warm-cream field; `[text]`-colored headline "Your business isn't off-the-shelf." arrives dead-center as an oversized word that smoothly scales down to settle centered — long-tail `power3`, no overshoot. Centered template, ~45% of frame, single depth layer.
Scene 2 (2.0–3.968s): as the VO reaches the second clause, the first line hard-cuts (no fade/roll) to "Your software shouldn't be either." — same center anchor, same size class; the word "software" carries a drawn-on `primary`-accent underline that draws left→right on landing. Holds to the cut — settle-and-hold, no further motion.

narrativeRole: Opens on the viewer's own frustration with generic, off-the-shelf tools — no brand yet, no pitch, just the contrast that makes the rest of the video necessary.
keyMessage: Generic software doesn't fit a specific business.

## Frame 2 — Name reveal

- scene: The contrast resolves into the Azbow name and one-line promise, logo lands.
- voiceover: "Introducing Azbow — custom software, apps, and marketing that deliver."
- duration: 4.587s
- transition_in: zoom-through
- status: animated
- src: compositions/frames/02-intro.html
- type: product_intro
- persuasion: Authority by association
- beat: curiosity -> trust
- blueprint: kinetic-type-beats (Reproduce) — product-intro-kinetic-type-namedrop
- focal: assets/azbow.png
- roles: assets/azbow.png = cutout (the mark itself is the subject, centered)
- sfx: pop, whoosh-short
- asset_candidates: assets/azbow.png — Azbow logo mark

Scene 1 (0.0–2.3s): as the VO opens on "Introducing", the word enters centered with a typographic accent — a `primary`-accent selection-box frames it — then hard-cuts through into the Azbow wordmark/logo (`assets/azbow.png`), which pops in centered via a smooth `spring-pop-entrance` settle (no overshoot, critically-damped). Centered template, ~40% of frame.
Scene 2 (2.3–4.587s): as the VO names the offer, a one-line tagline "custom software, apps, and marketing that deliver" reveals beneath the mark via per-word staggered reveal, each word landing on its own beat as the VO says it. Holds once resolved — settle, subtle jitter only.

narrativeRole: Pays off the hook by naming who solves the problem and what they deliver, landing the video's promise by beat 2 per the reverse-iceberg rule.
keyMessage: Azbow is a custom software, app, and marketing partner.

## Frame 3 — Proof: real work, real results

- scene: The single strongest showcase beat — Azbow's award-winning UI/UX and real client work (Mosam mobile app, Net2Go platform, Porto) proving the promise, inside a clean device surface.
- voiceover: "Ten years. A hundred-plus clients. A thousand projects shipped. Award-winning UI and UX — real apps like Mosam and Net2Go, real architecture behind every one."
- duration: 12.715s
- transition_in: blur-crossfade
- status: animated
- src: compositions/frames/03-proof.html
- type: feature_showcase
- persuasion: Show-don't-tell proof / Statistical proof
- beat: intrigue -> confidence
- blueprint: device-surface-showcase (Adapt) — key-feature-device-screen-tour (static-tour variant)
- focal: assets/mobile-mock-mosam.png
- roles: assets/award-winning-uiux-architecture.png = background (title-card dissolve backdrop, dim ~30%); assets/mobile-mock-mosam.png = cutout (device hero, screen 1); assets/net2go.png = cutout (device hero, screen 2); assets/porto.png = supporting (device hero, screen 3 — silent closing proof, no name-drop)
- sfx: ping, click, whoosh
- asset_candidates: assets/award-winning-uiux-architecture.png — "Award Winning UI/UX & Architecture" section art; assets/mobile-mock-mosam.png — Mosam mobile app UI mockup; assets/net2go.png — Net2Go platform UI mockup; assets/porto.png — Porto portfolio UI mockup

Adapt: the base blueprint runs 5-9.6s with 2-4 screen beats and no camera move; this beat is the video's ONE demo beat per the brief and needs to fill its full duration, so it's extended with a three-stat count-up lead-in (not in the base blueprint) before the device-tour signature takes over. The signature move — the device surface as persistent hero, screens advancing on discrete swaps synced to the VO, camera fully static — is kept intact through Scenes 4-6; nothing is front-loaded, each screen change lands on its own VO cue. (Scene windows below are rescaled to the real synced voice duration of 12.715s — proportionally shorter than first drafted since Kokoro's actual reading pace came in faster than the 18s estimate.)

Scene 1 (0.0–1.4s): as the VO opens on "Ten years", a warm-cream field carries one `metric-card` (tinted, no shadow) dead-center: a `primary`-colored value-scaled counter climbs 0→10 as its "years" label sits beneath. Centered template, ~35% of frame, single layer.
Scene 2 (1.4–2.8s): as the VO says "A hundred-plus clients", the first card scale-swaps (shared transform-origin) into a second metric card reading "100+ clients"; a loose ring of small dot-markers (standing in for client logos, undetailed) drifts in behind at low opacity as supporting texture. Centered, ~40% of frame, 2 depth layers.
Scene 3 (2.8–4.6s): as the VO says "A thousand projects shipped", a velocity-matched zoom-through cut pushes past the second card into a third metric card — "1,000+ projects" — landing centered; the persistent progress-bar strip along the bottom edge grows to reflect this third beat.
Scene 4 (4.6–6.7s): as the VO reaches "Award-winning UI and UX", the stat card clears (scale-swap out) and the frame dissolves to a full-frame title-card moment: `assets/award-winning-uiux-architecture.png` fills the backdrop dimmed to ~30%, with an eyebrow label "Award-Winning UI/UX & Architecture" (accent-line above, `primary` uppercase 0.08em) drawing in centered. Camera static.
Scene 5 (6.7–10.2s): as the VO names "real apps like Mosam and Net2Go", the title card dissolves to the device-tour surface — a phone-style device mockup slides in from off-screen and settles (long-tail ease, no camera move for the remainder), showing `assets/mobile-mock-mosam.png` on its face with a side headline "Mosam" swapping in beside it; a tap-compress triggers the screen to push out and `assets/net2go.png` pulls in as the side headline swaps to "Net2Go", synced exactly to the VO naming each app. Asymmetric 60/40, device left-of-center, headline right.
Scene 6 (10.2–12.715s): as the VO closes on "real architecture behind every one", the device advances once more (silent screen swap, no new name-drop) to `assets/porto.png` as the closing proof screen, then HOLDS — settle only, at most subtle jitter, no continuing push. This is one of the video's two deliberate held beats.

narrativeRole: The evidence beat — proves the promise with real numbers (10+ years, 100+ clients, 1000+ projects) and real, credible product visuals rather than stock imagery or generic feature icons. This is the ONE demo beat per the brief; it develops across its full 12.715s as a time-coded shot sequence (stats build, device surface opens, screens cycle) rather than freezing after entrance.
keyMessage: Azbow's work is proven, credible, and award-winning.

## Frame 4 — CTA

- scene: Azbow lockup condenses to the call to action and URL.
- voiceover: "Ready for software built around you? Azbow — let's build it. azbow.com"
- duration: 4.821s
- transition_in: crossfade
- status: animated
- src: compositions/frames/04-cta.html
- type: cta
- persuasion: Risk reversal / direct CTA
- beat: motivation -> urgency-to-act
- blueprint: cta-morph-press (Reproduce)
- focal: assets/azbow.png
- roles: assets/azbow.png = cutout (the resting hero mark that morphs into the CTA)
- sfx: click-soft, chime
- asset_candidates: assets/azbow.png — Azbow logo mark

Scene 1 (0.0–1.1s): as the VO asks "Ready for software built around you?", the Azbow wordmark (`assets/azbow.png`) holds dead-center, alive but resting — only a faint rotational breath on the mark itself, camera static. Centered, ~40% of frame.
Scene 2 (1.1–1.9s): as the VO lands "Azbow —", the mark condenses at the same screen center into a smaller, brighter `primary`-filled CTA pill reading "Let's build it" — shrink-fade out / scale-up in, one shared transform-origin so it reads as one element transforming.
Scene 3 (1.9–2.7s): as the VO says "let's build it", a cursor arrives from off-stage on a decelerating path and lands a few px off the CTA's geometric center — a human aim, not a scripted one.
Scene 4 (2.7–4.821s): as the VO lands "azbow.com", the cursor presses — cursor and CTA compress together in lockstep, release with a soft glow bloom, and the URL "azbow.com" resolves beneath the pill. Holds on the clicked state — the video's second deliberate held beat, dead static to the end.

narrativeRole: Closes on the single action the video wants — visit azbow.com — landing on the logo and URL for recall.
keyMessage: Go to azbow.com.
