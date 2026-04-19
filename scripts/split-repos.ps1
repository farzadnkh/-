# Split monorepo subfolders into standalone Git histories and push to GitHub.
#
# Prerequisites:
#   1. Create EMPTY repositories on GitHub (no README/license) for each name below.
#   2. Authenticate: `gh auth login` or Git credential manager for HTTPS.
#
# Usage (from repo root: Desktop/Desktop):
#   .\scripts\split-repos.ps1
#   .\scripts\split-repos.ps1 -RemoteBase "git@github.com:farzadnkh"
#
# After a successful split+push, each GitHub repo has `main` containing only that folder's files
# at the repository root (history preserved for that path).
#
# Optional: slim this umbrella repo to README-only by deleting local project folders and pushing,
# or keep the monorepo as a mirror until you are confident the splits are correct.

param(
    [string]$RemoteBase = "https://github.com/farzadnkh"
)

$ErrorActionPreference = "Stop"

$projects = @(
    @{ Prefix = "payment-api-robot";    Repo = "payment-api-robot" }
    @{ Prefix = "dotnet-test";          Repo = "dotnet-test" }
    @{ Prefix = "playwright-e2e-tests"; Repo = "playwright-e2e-tests" }
    @{ Prefix = "automation-test";      Repo = "automation-test" }
    @{ Prefix = "test/aparat-automation"; Repo = "aparat-automation" }
    @{ Prefix = "stress-test";          Repo = "stress-test" }
)

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

foreach ($p in $projects) {
    $branch = "split/$($p.Repo)"
    Write-Host ""
    Write-Host "=== $($p.Prefix) -> $branch ===" -ForegroundColor Cyan
    git subtree split -P $p.Prefix -b $branch
    $url = "$RemoteBase/$($p.Repo).git"
    Write-Host "Pushing to $url (branch main)..." -ForegroundColor Green
    git push $url "${branch}:main"
}

Write-Host ""
Write-Host "Done. Verify each repo on GitHub, then optionally delete split/* branches locally:" -ForegroundColor Yellow
Write-Host "  git branch | Select-String split/ | ForEach-Object { git branch -D `$_.Line.Trim() }"
