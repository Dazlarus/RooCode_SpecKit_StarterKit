---
command: import-commands
description: Import or refresh all slash commands from .roo/custom_commands.yaml (overwrite by default)
argument-hint: "<yaml-path> [--target <folder>] [--no-overwrite]"
---

Import a YAML bundle of commands into `.roo/commands/`.

**Default behavior:**
- Overwrites existing `.md` files in the target directory.  
- Use `--no-overwrite` to skip overwriting existing files.

```roo
/import-commands .roo/custom_commands.yaml --target .roo/commands
```

**Usage**
- First, make sure `.roo/custom_commands.yaml` exists.  
- Run this command once to generate `.md` command files.  
- Reload Roo or run `/reimport` if you modify the YAML later.
