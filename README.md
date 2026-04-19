# Portfolio Projects

This repository is now only an index for the standalone project repositories under `farzadnkh`.

## Repositories

- [payment-api-robot](https://github.com/farzadnkh/payment-api-robot)
- [dotnet-test](https://github.com/farzadnkh/dotnet-test)
- [playwright-e2e-tests](https://github.com/farzadnkh/playwright-e2e-tests)
- [automation-test](https://github.com/farzadnkh/automation-test)
- [aparat-automation](https://github.com/farzadnkh/aparat-automation)
- [stress-test](https://github.com/farzadnkh/stress-test)

The source folders were removed from this umbrella repo to avoid duplication and reduce the chance of leaking old project files.
# Portfolio workspace (umbrella monorepo)

This repo (`farzadnkh/-`) still contains **all projects in one tree**. Separated **standalone Git repositories** (one folder = one `.git`) live next to this folder:

**`..\portfolio-repos\`** — open that path for six independent repos, each on branch `main`, with **no `origin` remote** until you add GitHub.

| Project | Folder under `portfolio-repos` | Target GitHub repo (create empty, then push) |
|--------|----------------------------------|-----------------------------------------------|
| Robot Framework – payment API | `payment-api-robot` | [farzadnkh/payment-api-robot](https://github.com/farzadnkh/payment-api-robot) |
| .NET samples | `dotnet-test` | [farzadnkh/dotnet-test](https://github.com/farzadnkh/dotnet-test) |
| Playwright E2E | `playwright-e2e-tests` | [farzadnkh/playwright-e2e-tests](https://github.com/farzadnkh/playwright-e2e-tests) |
| UI automation sample | `automation-test` | [farzadnkh/automation-test](https://github.com/farzadnkh/automation-test) |
| Aparat Playwright | `aparat-automation` | [farzadnkh/aparat-automation](https://github.com/farzadnkh/aparat-automation) |
| Stress test configs | `stress-test` | [farzadnkh/stress-test](https://github.com/farzadnkh/stress-test) |

## Push separated repos to GitHub

1. Create the **empty** repositories on GitHub (same names as the folders).
2. In each folder under `portfolio-repos`, run `git remote add origin <url>` and `git push -u origin main` (see `portfolio-repos\README.md`).

## Re-split from this monorepo later

From this directory:

```powershell
.\scripts\split-repos.ps1
```

Or rebuild standalone folders with `git subtree split -P <path> -b split/<name>` and `git clone -b split/<name> --single-branch . ..\portfolio-repos\<name>`.
