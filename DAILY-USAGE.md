# Daily Usage

This is the day-to-day operating guide for this COG second brain vault on Windows.

## Startup Order

Use this order for normal daily work:

1. Open Obsidian vault.
2. Start COG/Codex from the project root.
3. Use Codex to run COG skills.
4. Review and edit generated notes in Obsidian.
5. Commit and push changes when you want backup/history.

## Fast Start

Double-click these desktop shortcuts:

1. `COG Second Brain Vault.lnk`
2. `Start COG Codex.lnk`

Or run from PowerShell:

```powershell
cd F:\AIWorkplace\2brain
.\start-cog.ps1
```

`start-cog.ps1` validates the COG package first, then starts Codex.

## Faster Start Without Validation

Use this when you just want to get into Codex quickly:

```powershell
cd F:\AIWorkplace\2brain
.\start-cog.ps1 -SkipValidate
```

## Validation Only

Use this after editing framework files, skills, docs, or manifests:

```powershell
cd F:\AIWorkplace\2brain
.\start-cog.ps1 -NoCodex
```

Equivalent direct command:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -lc "./cog-update.sh --validate"
```

## Updating COG

Check for updates:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -lc "./cog-update.sh --check"
```

Preview updates:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -lc "./cog-update.sh --dry-run"
```

Run the interactive update:

```powershell
.\start-cog.ps1 -Update
```

## First-Time COG Setup

In Codex, ask:

```text
Run onboarding
```

Onboarding creates your personal COG files:

- `00-inbox/MY-PROFILE.md`
- `00-inbox/MY-INTERESTS.md`
- `00-inbox/MY-INTEGRATIONS.md`
- Optional project folders under `04-projects/`

## Common Daily Commands

Use these in Codex:

```text
Run onboarding
I need to braindump
Give me my daily brief
Save this URL
Scout this
Weekly review
Consolidate my knowledge
Update COG
```

## Recommended Daily Routine

Morning:

- Open Obsidian.
- Start Codex with `.\start-cog.ps1`.
- Ask for `daily brief`.

During the day:

- Use `braindump` whenever you want to capture raw thoughts.
- Use `url-dump` for links you definitely want to save.
- Use `scout` when you want COG to judge whether something is worth saving.

End of week:

- Run `weekly review`.
- Review notes in `01-daily/checkins/`.

Monthly or when notes feel scattered:

- Run `knowledge-consolidation`.
- Review generated frameworks in `05-knowledge/consolidated/`.

## Where Notes Go

- `00-inbox/`: profile, integrations, temporary capture
- `01-daily/briefs/`: daily brief files
- `01-daily/checkins/`: weekly review files
- `02-personal/braindumps/`: personal notes
- `03-professional/braindumps/`: work notes
- `04-projects/`: project-specific notes
- `05-knowledge/`: consolidated knowledge, patterns, people profiles
- `06-templates/`: reusable templates

## Git Backup

After important note changes:

```powershell
git status
git add .
git commit -m "Update COG notes"
git push
```

Be careful with personal content. This repository can track your notes unless you intentionally ignore personal folders in `.gitignore`.

## Troubleshooting

If validation fails:

```powershell
.\start-cog.ps1 -NoCodex
```

If Obsidian does not open the vault:

```powershell
Start-Process "F:\software\Obsidian\Obsidian.exe" -ArgumentList "F:\AIWorkplace\2brain"
```

If Codex does not start:

```powershell
Get-Command codex
```

If Git Bash is not found, install Git for Windows or fix this path:

```text
C:\Program Files\Git\bin\bash.exe
```

