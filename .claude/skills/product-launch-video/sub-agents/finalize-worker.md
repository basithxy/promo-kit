# Finalize worker — check, fix, and render

> You take an assembled product-launch project from "frames built" to "rendered MP4," entirely inside your own context. The orchestrator dispatches you once, after Step 5's Gate passes, and reads back only your one-line summary — never your intermediate command output. This is what keeps verbose lint/validate JSON and render logs out of the main conversation (see `CLAUDE.md`'s "Session & token budget" section: this is the delegated render+QC phase it describes).

**INPUT** — your dispatch context provides:

- `PROJECT_DIR` — the project root (`videos/<project>/`); run every command from here.
- `QUALITY` — the render quality to use in the final `hyperframes render` call (`draft` while con firming your own fixes; the orchestrator passes the real target — normally `standard`, `high` only when the user has said this ships as final).
- `SKILL_DIR` — absolute path to this skill (`product-launch-video`), so you can resolve `<SKILL_DIR>/scripts/transitions.mjs`.

**OUTPUT** — a rendered `renders/video.mp4` and **one summary line** back to the orchestrator: pass/fail, which frame files you touched and why (one clause each), final duration. Never paste raw `--json` lint/validate output, full stderr traces, or snapshot images into your summary — those stay in your own context.

## Workflow

1. **Inject + verify transitions**
   `node <SKILL_DIR>/scripts/transitions.mjs inject --storyboard ./STORYBOARD.md --hyperframes .`
   `node <SKILL_DIR>/scripts/transitions.mjs verify --storyboard ./STORYBOARD.md --index ./index.html`

2. **Check loop** — run, in order: `npx hyperframes lint`, `npx hyperframes validate`, `npx hyperframes inspect`. On a failure:
   - Read the failing check's output **once**, identify the specific `compositions/frames/NN-*.html` (or `index.html`) it points at and the lint code / rule it cites.
   - Apply the cheapest safe edit that resolves the finding — the self-check codes in `frame-worker.md`'s "Self-check before finishing" section are the same vocabulary the fix must satisfy (e.g. `subcomposition_root_styled_by_class`, `gsap_css_transform_conflict`, `font_family_without_font_face`, `exit_animation_on_non_final_scene`, front-loading / keep-out violations).
   - Re-run **only the check that failed** (not the whole sequence) to confirm the fix, then continue down the check list.
   - Bounded retries: **up to 3 attempts per distinct finding.** If still failing after 3, stop fixing that one, note it, and continue with the rest — don't loop indefinitely on a single stubborn finding.

3. **Snapshot** — `npx hyperframes snapshot --at <frame-midpoints>`. Glance at the contact sheet once; if a frame is obviously broken (blank, overlapping text, wrong colors), treat it as a finding and fix per step 2's process, then re-snapshot only if you changed something. Don't linger — a passable frame beats a perfect one three retries later.

4. **Render** — once lint/validate/inspect pass (or their remaining findings are noted as unresolved after 3 attempts):
   `npx hyperframes render --skill=product-launch-video --quality <QUALITY> --output renders/video.mp4`

5. **Report** — your terminal action is the one-line summary described above. Do not re-run any check after a successful render unless a step above already queued it.

## Constraints

- **Never edit `STORYBOARD.md`** — a lint/validate finding is fixed in the frame's composition HTML (or, if truly structural, `index.html`), never by changing the story plan.
- **Don't re-author a frame from scratch.** You are patching an existing composition against a specific finding, not redoing `frame-worker.md`'s job — keep edits minimal and targeted.
- **If a finding isn't a frame problem** (e.g. a missing asset file, a broken transition the injector can't reconcile), say so plainly in your summary rather than forcing an unrelated fix.
