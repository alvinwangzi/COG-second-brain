# Windows Install Notes

This file records the local Windows setup for this COG second brain vault.

## Installed Components

- COG vault: `F:\AIWorkplace\2brain`
- Obsidian app: `F:\software\Obsidian\Obsidian.exe`
- Codex CLI: available as `codex`
- Git Bash: `C:\Program Files\Git\bin\bash.exe`
- Python launcher: available as `py`

## What Was Configured

1. The project was cloned to `F:\AIWorkplace\2brain`.
2. The packaged agent surface was fixed and validated as 18 skills.
3. `scripts/validate-agent-surface.sh` was made Windows-compatible:
   - Uses `python3` when available.
   - Falls back to Windows `py`.
   - Handles CRLF output from Windows Python.
4. Obsidian was registered to the current executable path:
   - `F:\software\Obsidian\Obsidian.exe`
5. This vault was added to Obsidian's vault list:
   - `F:\AIWorkplace\2brain`
6. Obsidian Tasks plugin was installed for this vault:
   - Plugin id: `obsidian-tasks-plugin`
   - Version installed: `8.1.0`
7. Desktop shortcuts were created:
   - `COG Second Brain Vault.lnk`
   - `Start COG Codex.lnk`

## Validation

Run this from the project root:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -lc "./cog-update.sh --validate"
```

Expected result:

```text
Validation passed with 0 warning(s)
Packaging validation passed
```

You can also use the Windows launcher without starting Codex:

```powershell
.\start-cog.ps1 -NoCodex
```

## Install Or Repair Steps

If the machine needs to be set up again:

1. Install Obsidian.
2. Install Git for Windows.
3. Install Codex CLI.
4. Open PowerShell in `F:\AIWorkplace\2brain`.
5. Run:

```powershell
.\start-cog.ps1 -NoCodex
```

6. Open Obsidian and choose this folder as the vault:

```text
F:\AIWorkplace\2brain
```

## Obsidian Tasks Plugin

COG writes tasks in Obsidian Tasks emoji format:

```markdown
- [ ] Example task 📅 2026-06-10
```

The plugin files are stored under `.obsidian/plugins/obsidian-tasks-plugin/`.
The `.obsidian` directory is local machine state and is ignored by Git.

## Notes

- `validate-agent-surface.sh` is a validation script, not an upgrade script.
- `cog-update.sh` is the update script.
- `cog-update.sh --validate` runs validation only.
- `cog-update.sh --check` checks for upstream updates.
- `cog-update.sh` runs the interactive update flow.

