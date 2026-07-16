# Runs a command with Windows sleep/display-sleep prevention held for its
# duration, and (optionally) records the command's wall-clock time as JSON.
#
# Why: a long unattended `hyperframes capture` / `hyperframes render` can get
# killed mid-job if the laptop goes to sleep. This wraps the one command that
# actually needs to keep running, holds the OS awake only while it runs, then
# releases the hold immediately after - it does not change any power-plan
# setting and does not keep the machine awake between video sessions.
#
# No formal param() block on purpose: the wrapped command routinely contains
# its own dash-flags (e.g. --quality standard), and PowerShell's parameter
# binder tries to match every "-xxx" / "--" token against this script's own
# declared parameters first, which breaks pass-through. Reading $args raw
# sidesteps that entirely.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File scripts/keep-awake.ps1 `
#     [-LogPath <path>] [--] <command> [args...]
#
# Example:
#   powershell -ExecutionPolicy Bypass -File scripts/keep-awake.ps1 `
#     -LogPath videos/acme/renders/render_time.json -- `
#     npx hyperframes render --quality standard --output renders/video.mp4

$logPath = ""
$rest = $args

if ($rest.Length -ge 2 -and $rest[0] -eq "-LogPath") {
    $logPath = $rest[1]
    $rest = $rest[2..($rest.Length - 1)]
}
if ($rest.Length -gt 0 -and $rest[0] -eq "--") {
    $rest = $rest[1..($rest.Length - 1)]
}
if ($rest.Length -eq 0) {
    Write-Error "keep-awake: no command given"
    exit 1
}

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class HfKeepAwake {
    [FlagsAttribute]
    public enum EXECUTION_STATE : uint {
        ES_CONTINUOUS = 0x80000000,
        ES_DISPLAY_REQUIRED = 0x00000002,
        ES_SYSTEM_REQUIRED = 0x00000001
    }
    [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern EXECUTION_STATE SetThreadExecutionState(EXECUTION_STATE esFlags);
}
"@

$holdFlags = [HfKeepAwake+EXECUTION_STATE]::ES_CONTINUOUS -bor `
             [HfKeepAwake+EXECUTION_STATE]::ES_SYSTEM_REQUIRED -bor `
             [HfKeepAwake+EXECUTION_STATE]::ES_DISPLAY_REQUIRED
[HfKeepAwake]::SetThreadExecutionState($holdFlags) | Out-Null

$start = Get-Date
$exitCode = 0
try {
    $exe = $rest[0]
    if ($rest.Length -gt 1) {
        $cmdArgs = $rest[1..($rest.Length - 1)]
        & $exe @cmdArgs
    } else {
        & $exe
    }
    $exitCode = $LASTEXITCODE
    if ($null -eq $exitCode) { $exitCode = 0 }
} finally {
    # Release the hold - restores normal system/display sleep behavior.
    [HfKeepAwake]::SetThreadExecutionState([HfKeepAwake+EXECUTION_STATE]::ES_CONTINUOUS) | Out-Null
}
$elapsedSeconds = [math]::Round(((Get-Date) - $start).TotalSeconds, 1)

if ($logPath -ne "") {
    $dir = Split-Path -Parent $logPath
    if ($dir -and -not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    $record = [ordered]@{
        command    = ($rest -join " ")
        seconds    = $elapsedSeconds
        exitCode   = $exitCode
        finishedAt = (Get-Date).ToUniversalTime().ToString("o")
    }
    $record | ConvertTo-Json | Set-Content -Path $logPath -Encoding utf8
}

exit $exitCode
