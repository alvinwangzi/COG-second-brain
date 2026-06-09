param(
    [Alias("NoValidate")]
    [switch]$SkipValidate,

    [switch]$Update,

    [switch]$NoCodex
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ScriptDir) {
    $ScriptDir = (Get-Location).Path
}

function Get-CogGitBash {
    $preferredBash = "C:\Program Files\Git\bin\bash.exe"
    if (Test-Path -LiteralPath $preferredBash) {
        return $preferredBash
    }

    $bashCommand = Get-Command bash -ErrorAction SilentlyContinue
    if ($bashCommand) {
        $bashPath = $bashCommand.Source
        if ($bashPath -and ($bashPath -notlike "*\System32\bash.exe")) {
            return $bashPath
        }
    }

    throw "Git Bash was not found. Install Git for Windows, then retry."
}

function Invoke-CogBash {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command
    )

    $bashPath = Get-CogGitBash
    Write-Output "[INFO] Running: $Command"
    & $bashPath -lc $Command

    if ($LASTEXITCODE -ne 0) {
        throw "Command failed with exit code ${LASTEXITCODE}: $Command"
    }
}

try {
    Set-Location -LiteralPath $ScriptDir
    Write-Output "[INFO] COG root: $ScriptDir"

    if (-not $SkipValidate) {
        Invoke-CogBash "./cog-update.sh --validate"
    }

    if ($Update) {
        Invoke-CogBash "./cog-update.sh"
    }

    if ($NoCodex) {
        Write-Output "[OK] Done. Codex launch skipped."
        exit 0
    }

    $codexCommand = Get-Command codex -ErrorAction SilentlyContinue
    if (-not $codexCommand) {
        throw "Codex CLI was not found on PATH. Install or open Codex, then run from this folder."
    }

    Write-Output "[INFO] Starting Codex. Try: Run onboarding"
    & $codexCommand.Source
    exit $LASTEXITCODE
}
catch {
    Write-Warning $_.Exception.Message
    exit 1
}
