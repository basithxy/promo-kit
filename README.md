# PromoKit

Turn any product (URL / screenshots / screen recording) into a promo video,
tutorial, or pitch deck - using Claude Code (Pro subscription, $0 API cost)
+ HyperFrames (open source, $0 render cost).

## First time (once per machine)

### Windows
1. Unzip somewhere like `C:\dev\promo-kit`
2. Open the folder in VS Code -> Terminal -> New Terminal (PowerShell)
3. Run:  `powershell -ExecutionPolicy Bypass -File .\setup.ps1`
4. If npm warns about scripts:  `npm approve-scripts --allow-scripts-pending`

### Mac / Linux
1. Unzip somewhere like `~/promo-kit`
2. Open the folder in VS Code -> Terminal (or use Terminal.app, `cd` into it)
3. Run:  `bash setup.sh`   (installs Homebrew automatically if missing)

### Both, after setup
4. Run:  `claude` -> log in with your Claude account (subscription), NOT API
5. Inside Claude:  `/status`  -> must show your Pro plan

Use setup.ps1 on Windows OR setup.sh on Mac/Linux - pick the one for your OS.
The scripts do the same thing; only the installer (winget vs brew) differs.

## Every video after that
1. Open this folder in VS Code, open terminal, type `claude`
2. Copy a prompt from PROMPTS.md, edit the product details, paste
3. Walk away 20-45 min -> `./videos/<name>/output.mp4`

## Folder layout
```
promo-kit/
  setup.ps1      one-time installer + API-key remover
  CLAUDE.md      mission rules Claude Code auto-reads every session
  PROMPTS.md     copy-paste prompts (promo / tutorial / deck)
  .claude/skills/  HyperFrames skills (created by setup)
  videos/        one subfolder per video (created as you go)
```

## Zero-cost guarantees
- setup.ps1 deletes ANTHROPIC_API_KEY / ANTHROPIC_BASE_URL vars
- Log in with subscription only; if Claude ever offers "continue with
  API credits", decline - just wait for the 5-hour window to reset
- HyperFrames is Apache 2.0: no per-render fees, renders on your laptop
