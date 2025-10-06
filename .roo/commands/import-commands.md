---
command: import-commands
description: Import or refresh all slash commands from .roo/custom_commands.yaml (auto-detects path and creates PowerShell script)
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--auto]"
---

Import a YAML bundle of commands into `.roo/commands/`.

**Smart Detection:**
- Automatically finds `.roo/custom_commands.yaml` if no path provided
- Detects PowerShell environment and creates `.roo/scripts/import-commands.ps1`
- Creates platform-appropriate import script

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

**Environment Setup:**
- **PowerShell**: Creates `.roo/scripts/import-commands.ps1` for automation
- **Cross-platform**: Generates appropriate script for your environment

**Usage**
- Run this command once to generate `.md` command files.
- The command will auto-detect your `.roo/custom_commands.yaml` file.
- Reload VS Code or run `/reimport` if you modify the YAML later.
- Use the generated PowerShell script for automated imports.
