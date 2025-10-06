---
command: import-commands
description: Intelligent YAML to .md converter that parses custom_commands.yaml and generates Roo Code slash command files
argument-hint: "[<yaml-path>] [--target <folder>] [--no-overwrite] [--dry-run]"
---

**INSTRUCTIONS:** When this command is run, parse the specified YAML file (or auto-detect .roo/custom_commands.yaml) and generate individual .md files for each command in the .roo/commands/ directory.

**YAML Structure Expected:**
```yaml
customCommands:
  - name: "Command Name"
    command: "/command-to-run"
    description: "What this command does"
```

**Processing Steps:**
1. **Locate YAML File**: Auto-detect .roo/custom_commands.yaml or use specified path
2. **Parse Commands**: Extract all command definitions from the YAML structure
3. **Validate Structure**: Ensure each command has name, command, and description fields
4. **Generate .md Files**: Create individual markdown files in Roo Code slash command format
5. **Report Results**: Show success/failure statistics and next steps

**Generated .md Format:**
Each command should create a file with this structure:
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

**Auto-Detection Priority:**
1. `.roo/custom_commands.yaml` (if exists)
2. Specified path via argument
3. Show clear error if file not found

**Error Handling:**
- Validate YAML syntax before processing
- Report missing or malformed command definitions
- Show specific file paths where issues occur
- Provide troubleshooting guidance for common problems

**Success Criteria:**
- All YAML commands parsed successfully
- Individual .md files created for each command
- Files follow proper Roo Code slash command format
- Clear summary provided with generation statistics

**YAML File Locations to Check:**
1. **Primary**: `.roo/custom_commands.yaml` (if it exists)
2. **Argument**: Use path specified in command arguments
3. **Error**: If neither exists, show clear error message with file path

**Command Processing Instructions:**
- Read the YAML file and parse the `customCommands` array
- For each command object in the array:
  - Extract `name`, `command`, and `description` fields
  - Validate all three fields are present and non-empty
  - Create safe filename from command name (replace special characters with underscores)
  - Generate .md file in `.roo/commands/` directory

**File Naming Convention:**
- Convert "🚀 Bootstrap Project" → "_Bootstrap_Project.md"
- Convert "✅ Check Tools" → "_Check_Tools.md"
- Replace all non-alphanumeric characters (except dash, dot, space) with underscores
- Remove consecutive underscores

**Progress Reporting:**
- Show which YAML file is being processed
- Display count of commands found in YAML
- Report each file as it's generated or updated
- Show summary with total processed, skipped, and success rate
- Provide next steps for reloading VS Code and verifying commands

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
- **"No YAML file found"**: Ensure `.roo/custom_commands.yaml` exists in your project root
- **"YAML parsing error"**: Check YAML syntax and ensure proper indentation under `customCommands`
- **"Permission denied"**: Check file write permissions in `.roo/commands/` directory
- **"No commands generated"**: Verify YAML contains valid command definitions with name, command, and description fields
- **"Command not appearing"**: Reload VS Code window after generation to see new slash commands

**What This Command Does:**
When you run `/import-commands`, Roo Code will:
1. Read the instructions in this .md file
2. Follow the step-by-step process to parse your YAML file
3. Generate individual .md files for each command
4. Create them in the `.roo/commands/` directory
5. Show you a summary of what was generated

**Expected Behavior:**
- YAML file is parsed and commands are extracted
- Individual .md files are created for each command
- Files follow Roo Code slash command format
- Commands become available in VS Code after reload
