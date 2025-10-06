---
command: import-commands
description: Smart import system that auto-detects YAML files, parses content, and generates functional Roo slash commands
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--auto] [--dry-run]"
---

Intelligent command import system that automatically discovers, parses, and generates Roo Code slash commands from YAML configuration files.

**Smart Features:**
- **Auto-Discovery**: Finds YAML files in `.roo/`, root, or commands directory
- **Multi-Format Support**: Handles various YAML structures and command formats
- **Path Intelligence**: Resolves relative paths and workspace locations
- **Safe Operations**: Validates files and provides detailed feedback
- **Self-Contained**: No external dependencies required

**Detection Priority:**
1. `.roo/custom_commands.yaml` (primary location)
2. `custom_commands.yaml` (project root)
3. `.roo/commands/custom_commands.yaml` (fallback)

**Default behavior:**
- Overwrites existing `.md` files in the target directory
- Use `--no-overwrite` to skip existing files
- Use `--dry-run` to preview without creating files

```roo
# Auto-detect and import (smart mode)
import-commands

# Specify custom path with validation
import-commands .roo/custom_commands.yaml --target .roo/commands

# Safe mode - preview first
import-commands --dry-run

# Conservative mode - don't overwrite existing
import-commands --no-overwrite

# Full control
import-commands ./custom.yaml --target ./output --no-overwrite
```

**Generated Format:**
Each command creates a properly formatted `.md` file:
```markdown
---
command: Command Name
description: Command description
---

Command description

**Usage:**
```
command syntax
```

**Category:** Workspace Commands
```

**YAML Compatibility:**
- Supports `customCommands` array format
- Handles quoted and unquoted values
- Preserves emoji and special characters
- Validates command structure before generation

**Error Handling:**
- Validates YAML syntax before processing
- Reports missing files with suggestions
- Shows detailed progress for each command
- Provides clear next steps after completion
