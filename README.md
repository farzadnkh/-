# Portfolio workspace

This repository used to bundle several projects in one folder. **Each project now has its own GitHub repository** (same history for that folder via `git subtree split`).

| Project | Repository |
|--------|------------|
| Robot Framework – payment API | [farzadnkh/payment-api-robot](https://github.com/farzadnkh/payment-api-robot) |
| .NET samples | [farzadnkh/dotnet-test](https://github.com/farzadnkh/dotnet-test) |
| Playwright E2E | [farzadnkh/playwright-e2e-tests](https://github.com/farzadnkh/playwright-e2e-tests) |
| UI automation sample | [farzadnkh/automation-test](https://github.com/farzadnkh/automation-test) |
| Aparat Playwright | [farzadnkh/aparat-automation](https://github.com/farzadnkh/aparat-automation) |
| Stress test configs | [farzadnkh/stress-test](https://github.com/farzadnkh/stress-test) |

## Reproduce the split from this monorepo

1. Create **empty** repositories under `farzadnkh` with the names above (no README).
2. From this directory, run:

```powershell
.\scripts\split-repos.ps1
```

Use SSH remotes if you prefer:

```powershell
.\scripts\split-repos.ps1 -RemoteBase "git@github.com:farzadnkh"
```

3. If `git subtree split` is slow on large folders (e.g. `dotnet-test`), let it finish; only network/auth errors need a retry after fixing credentials.
