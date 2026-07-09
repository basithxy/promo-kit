# ==============================================
#  PromoKit - one-time setup (PowerShell / VS Code terminal)
#  Usage:  powershell -ExecutionPolicy Bypass -File .\setup.ps1
# ==============================================

Write-Host ""
Write-Host "[1/5] Removing any API key vars (subscription-only guarantee)..." -ForegroundColor Cyan
[Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $null, "User")
try { [Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $null, "Machine") } catch {}
[Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", $null, "User")
$env:ANTHROPIC_API_KEY = $null
$env:ANTHROPIC_BASE_URL = $null
Write-Host "      Done. Claude Code can only bill your Pro subscription now."

Write-Host ""
Write-Host "[2/5] Installing prerequisites via winget (skips if present)..." -ForegroundColor Cyan
winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
winget install --id Gyan.FFmpeg -e --accept-package-agreements
winget install --id Git.Git -e --accept-package-agreements

Write-Host ""
Write-Host "[3/5] Refreshing PATH for this session..." -ForegroundColor Cyan
$machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = $machinePath + ";" + $userPath

Write-Host ""
Write-Host "[4/5] Verifying tools..." -ForegroundColor Cyan
foreach ($t in @("node", "ffmpeg", "git")) {
    $cmd = Get-Command $t -ErrorAction SilentlyContinue
    if ($cmd) {
        Write-Host ("      OK       {0}  ->  {1}" -f $t, $cmd.Source)
    } else {
        Write-Host ("      MISSING  {0}  (close VS Code fully, reopen, re-run setup.ps1)" -f $t) -ForegroundColor Yellow
    }
}
$nodeMajor = 0
try { $nodeMajor = [int]((node -v).TrimStart("v").Split(".")[0]) } catch {}
if ($nodeMajor -lt 22) {
    Write-Host ("      WARNING  Node 22+ required for HyperFrames (found v{0})" -f $nodeMajor) -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[5/5] Installing Claude Code + HyperFrames skills..." -ForegroundColor Cyan
npm install -g @anthropic-ai/claude-code
npx --yes skills add heygen-com/hyperframes --all

Write-Host ""
Write-Host "================ SETUP COMPLETE ================" -ForegroundColor Green
Write-Host " Next:"
Write-Host "   1. Type:  claude"
Write-Host "   2. Log in with your CLAUDE ACCOUNT (subscription), NOT an API key"
Write-Host "   3. Run /status  ->  must show Pro plan, not API"
Write-Host "   4. Open PROMPTS.md, copy a prompt, paste it into Claude"
Write-Host "================================================"
