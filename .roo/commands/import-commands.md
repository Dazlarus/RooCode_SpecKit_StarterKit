---
command: import-commands
description: Import or refresh all slash commands from .roo/custom_commands.yaml (auto-detects path and generates Roo slash commands)
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--auto]"
---

Import a YAML bundle of commands into `.roo/commands/` and generate functional Roo slash commands.

**Smart Detection:**
- Automatically finds `.roo/custom_commands.yaml` if no path provided
- Detects PowerShell environment and uses `.roo/scripts/import-commands.ps1`
- Creates functional `.md` files in Roo Code slash command format

**Default behavior:**
- Overwrites existing `.md` files in the target directory.
- Use `--no-overwrite` to skip overwriting existing files.

```roo
# Auto-detect and import (recommended)
import-commands

# Specify custom path
import-commands .roo/custom_commands.yaml --target .roo/commands

# Safe mode (don't overwrite existing)
import-commands --no-overwrite
```

**What it generates:**
- Creates `.md` files for each command in `.roo/commands/`
- Each file follows Roo Code slash command format with frontmatter
- Commands become available in VS Code command palette after reload

**Usage**
- Run this command to generate functional `.md` command files.
- The command will auto-detect your `.roo/custom_commands.yaml` file.
- Reload VS Code window after import to see new commands.
- Commands appear in: Settings → Slash Commands → Workspace Commands
