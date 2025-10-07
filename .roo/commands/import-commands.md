---
command: import-commands
description: Intelligent YAML parser that reads custom_commands.yaml and creates individual slash command .md files.
---

**INSTRUCTIONS:** When this command is run, intelligently parse the custom_commands.yaml file and generate individual .md slash command files. Auto-detect the YAML file, validate the structure, create properly named .md files in .roo/commands/, and report the results.

**YAML Structure Expected:**
```yaml
customCommands:
  - name: "📥 Import Commands"
    command: "/import-commands"
    description: "Intelligent YAML parser that reads custom_commands.yaml and creates individual slash command .md files."
    instructions: "INSTRUCTIONS: When this command is run, execute the intelligent YAML parser..."
```

**Processing Steps:**
1. **Auto-detect YAML file**: Look for `.roo/custom_commands.yaml` in the workspace root
2. **Parse YAML structure**: Extract all command definitions from the `customCommands` array
3. **Validate each command**: Ensure required fields (name, command, description) are present and non-empty
4. **Generate .md files**: Create individual markdown files using the exact command name as filename
5. **Report results**: Show detailed summary with generation statistics and troubleshooting guidance

**Generated .md Format:**
Each command creates a file with this structure:
```markdown
---
command: import-commands
description: Intelligent YAML parser that reads custom_commands.yaml and creates individual slash command .md files.
---

INSTRUCTIONS: [Detailed instructions for what Roo Code should do when this command is executed]

**Usage:**
```
/import-commands
```

**Category:** Workspace Commands
```

**Command Processing Instructions:**
1. **File Detection**:
   - Primary: Check for `.roo/custom_commands.yaml` in workspace root
   - Fallback: Use path specified in command arguments
   - Error: Show clear message if no YAML file found

2. **YAML Parsing**:
   - Parse the `customCommands` array from the YAML file
   - Extract these fields for each command:
     - `name`: Display name with emoji (e.g., "📥 Import Commands")
     - `command`: Slash command (e.g., "/import-commands")
     - `description`: Brief description for command menu
     - `argument-hint`: Optional argument hints (e.g., "<arg1> <arg2>")
     - `instructions`: Detailed execution instructions

3. **File Generation**:
   - **CRITICAL**: Use command field directly for filename generation
   - Extract filename: Remove leading slash from command and add .md extension
   - Example: "/import-commands" → "import-commands.md"
   - **ALWAYS overwrite existing files** (unless --no-overwrite flag specified)
   - Create files in `.roo/commands/` directory

4. **Content Structure**:
   - Add YAML frontmatter with command, description, and argument-hint
   - Include the full instructions field as the main content
   - Add standard sections: Usage, Category
   - Preserve all formatting and structure from the original

**File Naming Convention:**
- **CRITICAL**: Use command field directly for exact Roo Code compatibility
- "/import-commands" → "import-commands.md"
- "/bootstrap-project" → "bootstrap-project.md"
- "/check-tools" → "check-tools.md"
- This ensures commands appear in VS Code slash command menu

**Overwrite Behavior:**
- **Default**: Overwrite all existing .md files (including this one)
- **Conservative**: Use --no-overwrite flag to skip existing files
- **Purpose**: Enables single-file YAML maintenance for entire command set

**Progress Reporting:**
- Display YAML file being processed
- Show count of commands found and parsed
- Report each file as it's generated (name → filename)
- Provide summary with success rate and statistics
- Include troubleshooting guidance for any failures

**Usage Examples:**
```roo
# Auto-detect and import with overwrite (recommended)
import-commands

# Preview what would be generated (dry run)
import-commands --dry-run

# Conservative mode (don't overwrite existing files)
import-commands --no-overwrite

# Specify custom YAML file location
import-commands /path/to/custom/commands.yaml
```

**Generated Output Example:**
```
🔍 Searching for YAML files...
✓ Found: .roo/custom_commands.yaml
✓ Parsed 25 commands from YAML

📥 Import Commands -> import-commands.md
📤 Export Commands -> export-commands.md
🚀 Bootstrap Project -> bootstrap-project.md
✅ Check Tools -> check-tools.md
... (25 total commands processed)

📊 Import Summary:
   Processed: 25 commands
   Generated: 25 files
   Success rate: 100%
   Location: .roo/commands/

✅ Import completed successfully!
💡 Tip: Reload VS Code window to see new slash commands in the / menu
```

**Error Handling:**
- **YAML parsing errors**: Show specific line numbers and syntax issues
- **Missing fields**: Report which commands have incomplete definitions
- **File permission errors**: Provide guidance for fixing write permissions
- **Invalid structure**: Explain expected YAML format with examples

**Success Criteria:**
- All commands from YAML successfully parsed
- Individual .md files created for each command
- Files follow proper Roo Code slash command format
- Commands appear in VS Code command menu after reload
- Clear summary provided with actionable next steps

**Troubleshooting:**
- **"No YAML file found"**: Ensure `.roo/custom_commands.yaml` exists in your project root
- **"YAML parsing error"**: Check indentation and syntax in the `customCommands` section
- **"Permission denied"**: Verify write permissions in `.roo/commands/` directory
- **"Commands not appearing"**: Reload VS Code window (Ctrl+Shift+P → Developer: Reload Window)
- **"Wrong filenames"**: Ensure YAML uses correct command field format (e.g., "/command-name")

**What This Command Does:**
When you run `/import-commands`, Roo Code will:
1. Auto-detect your `.roo/custom_commands.yaml` file
2. Parse all command definitions from the `customCommands` array
3. Generate individual .md files for each command in `.roo/commands/`
4. Use exact command names for filenames (e.g., "/import-commands" → "import-commands.md")
5. Overwrite existing files to ensure updates are applied
6. Provide detailed feedback on what was generated

**Expected Behavior:**
- Single YAML file maintains all workspace commands
- Import process updates all command files from YAML source
- Overwrite ensures changes propagate to all command files
- Commands become immediately available in VS Code slash command menu
- Enables easy sharing and maintenance of command collections

**Category:** Workspace Commands