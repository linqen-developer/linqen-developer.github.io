$ErrorActionPreference='Stop'
Write-Host 'OpenClaw home laptop bootstrap' -ForegroundColor Cyan
$ts="$env:ProgramFiles\Tailscale\tailscale.exe"
if(!(Test-Path $ts)){
  winget install --id Tailscale.Tailscale -e --accept-package-agreements --accept-source-agreements
}
$ts="$env:ProgramFiles\Tailscale\tailscale.exe"
if(!(Test-Path $ts)){throw 'Tailscale not found after install. Reopen PowerShell and run this command again.'}
& $ts up
irm http://100.82.187.108:18888/setup.ps1 | iex
