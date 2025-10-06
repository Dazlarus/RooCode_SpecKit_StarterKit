---
command: import-commands
description: Self-contained intelligent import system that parses YAML and generates .md files using Roo Code's built-in capabilities
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--auto] [--dry-run]"
---

**Self-Contained Execution:** This command works entirely within Roo Code without requiring external script execution.

**How It Works:**
1. **Auto-Detects YAML**: Finds `.roo/custom_commands.yaml` or specified file
2. **Parses YAML Structure**: Uses built-in YAML parsing to extract command definitions
3. **Generates .md Files**: Creates properly formatted slash command files
4. **No External Dependencies**: Works in any environment without PowerShell or bash scripts

**Smart Features:**
- **Auto-Discovery**: Finds YAML files in standard locations
- **Self-Contained**: No external scripts or PowerShell dependencies required
- **Intelligent Parsing**: Handles actual YAML structure with validation
- **Fresh Environment Ready**: Works when `.roo/` is copied to new projects
- **Built-in Execution**: Uses Roo Code's native file system capabilities

**Detection Priority:**
1. `.roo/custom_commands.yaml` (primary location)
2. `custom_commands.yaml` (project root fallback)

**Execution Flow:**
```
1. Auto-detects YAML file location
2. Parses YAML structure using built-in capabilities
3. Validates command definitions (name, command, description)
4. Generates .md files in Roo Code slash command format
5. Reports success/failure with detailed statistics
```

**Usage Examples:**
```roo
# Auto-detect and import (recommended)
import-commands

# Preview what would be generated (safe)
import-commands --dry-run

# Conservative mode (don't overwrite existing)
import-commands --no-overwrite

# Full manual control
import-commands .roo/custom_commands.yaml --target .roo/commands
```

**Generated Output:**
```
Searching for YAML files...
✓ Found: C:\Projects\MyProject\.roo\custom_commands.yaml
✓ Parsed 25 commands from YAML
Generated: 🚀 Bootstrap Project -> _Bootstrap_Project.md
Generated: ✅ Check Tools -> _Check_Tools.md
... (25 total commands)

Import Summary:
  Processed: 25 commands
  Success rate: 100%
```

**Troubleshooting:**
- **"No YAML file found"**: Ensure `.roo/custom_commands.yaml` exists in your project
- **"YAML parsing error"**: Check YAML syntax and ensure proper indentation
- **"Permission denied"**: Check file write permissions in `.roo/commands/` directory
- **"No commands generated"**: Verify YAML contains valid command definitions with name, command, and description fields
- **Fresh environment**: Works perfectly when `.roo/` is copied to new projects (no external dependencies)

**Compatibility:**
- **Universal**: Works in any environment with Roo Code (Windows, macOS, Linux)
- **No Dependencies**: Requires no external tools, PowerShell, or shell scripts
- **Self-Contained**: Uses only Roo Code's built-in file system and parsing capabilities
