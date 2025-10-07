---
command: import-commands
description: Intelligent YAML parser that reads custom_commands.yaml and creates individual slash command .md files.
---

**INSTRUCTIONS:** When this command is run, intelligently parse the custom_commands.yaml file and generate individual .md slash command files. Auto-detect the YAML file, validate the structure, create properly named .md files in .roo/commands/, check if content would be identical before writing to avoid unnecessary overwrites, and report the results.

**Usage:**
```
/import-commands
```

**Category:** Workspace Commands