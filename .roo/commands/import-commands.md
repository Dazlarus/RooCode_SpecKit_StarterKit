---
command: import-commands
description: Cross-platform intelligent import system that executes PowerShell script to generate functional Roo slash commands
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--auto] [--dry-run]"
---

**How It Works:**
1. **Runs Cross-Platform Shim**: Executes `.roo/scripts/import-commands.sh` (bash script)
2. **Auto-Detects PowerShell**: Finds and invokes `pwsh` or `powershell` on any OS
3. **Executes Smart Script**: Runs `.roo/scripts/import-commands.ps1` with proper execution policy
4. **Generates Commands**: Creates functional `.md` files in `.roo/commands/`

**Smart Features:**
- **Auto-Discovery**: Finds YAML files in 8 standard locations across platforms
- **Cross-Platform**: Works on Windows, macOS, and Linux with PowerShell installed
- **Intelligent Parsing**: Handles actual YAML structure with validation
- **Fresh Environment Ready**: Works when `.roo/` is copied to new projects
- **Comprehensive Error Handling**: Provides specific troubleshooting guidance

**Detection Priority (8 locations):**
1. `.roo/custom_commands.yaml` (primary)
2. `custom_commands.yaml` (root)
3. `.roo/commands/custom_commands.yaml`
4. `.roo/commands.yaml`
5. `.roo/config/commands.yaml`
6. `config/custom_commands.yaml`
7. `tools/commands.yaml`

**Execution Flow:**
```bash
# What happens when you run this command:
bash .roo/scripts/import-commands.sh     # Cross-platform shim
  → pwsh -NoProfile -ExecutionPolicy Bypass -File .roo/scripts/import-commands.ps1
    → Auto-detects YAML file location
    → Parses 25 commands from YAML
    → Generates .md files in .roo/commands/
    → Returns success/failure with statistics
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
- **"No YAML file found"**: Ensure `.roo/custom_commands.yaml` exists
- **"PowerShell not found"**: Install PowerShell 7+ (`pwsh`) on your system
- **Permission denied**: Check file permissions in `.roo/` directory
- **Fresh environment**: Works perfectly when `.roo/` is copied to new projects

**Cross-Platform Compatibility:**
- **Windows**: Uses `pwsh` or `powershell` with execution policy bypass
- **macOS/Linux**: Uses `pwsh` if available, falls back to `powershell`
- **Error Handling**: Detects missing PowerShell and provides installation guidance
