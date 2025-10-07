# Roo Code + Spec Kit Starter Kit

**Complete development environment** that integrates Roo Code's AI-powered workflow system with Spec Kit's specification-driven development methodology.

## Overview

This starter kit provides everything needed for **spec-driven development** with Roo Code:

- **🏗️ Spec-Driven Architecture** - Bootstrap projects with Constitution, Spec, Plan, and Tasks
- **🛡️ WRITE-GUARD Protection** - Advanced snapshot system with configurable diff thresholds
- **🧩 Intelligent Task Management** - Dependency-aware task execution with progress tracking
- **📚 Automated Documentation** - Self-maintaining docs with TOC generation and validation
- **🔧 Professional Commands** - 25+ specialized slash commands for every development phase

## What's Included

```
.roo/
├── commands/                    # 25+ slash command definitions (auto-generated)
│   ├── import-commands.md      # Intelligent YAML → .md converter
│   ├── _Bootstrap_Project.md   # Project initialization command
│   ├── _Check_Tools.md         # Tool validation command
│   └── ...                     # All workspace commands
├── custom_commands.yaml        # Master command definitions with argument hints
├── dev_team.yaml              # 11 specialized AI modes with descriptions
├── guard.json                 # WRITE-GUARD protection configuration
├── local-history/             # Automatic snapshots (pre-edit backups)
└── runs/                      # Evidence directory for reports & outputs
    ├── evidence/              # Command execution logs & results
    └── tests/                 # Test outputs & coverage reports
```

**Quick Start**: Copy `.roo/` to your project root, import modes and commands, and begin spec-driven development.

Requirements
-----------
**Before you begin, install:**
1. **VS Code** (latest version)
2. **Roo Code Extension** – Install from the VS Code Marketplace.
3. **Git** – Required for diffing, local version history, and guard commits.
4. **Spec Kit CLI** – Required for `/specify`, `/plan`, `/tasks`, and `/verify` commands.
   - Installation: Refer to [Spec Kit Documentation](https://docs.roocode.com) or use `npm install -g speckit` if available.
   - Verify with: `spec-kit --help`

VS Code Settings (for WRITE-GUARD & Local History)
-------------------------------------------------
Add the following to your **`.vscode/settings.json`** to enable granular recovery and align with the WRITE-GUARD system:
```json
{
  "files.autoSave": "onFocusChange",
  "workbench.localHistory.enabled": true,
  "workbench.localHistory.maxFileSize": 10485760,
  "workbench.localHistory.maxFileEntries": 2048,
  "workbench.localHistory.saveDelay": 2
}
```
These settings ensure VS Code’s built-in Timeline and Roo’s WRITE-GUARD snapshots both capture file states before every major edit.

## Quick Setup

**5-minute installation** for immediate productivity:

1. **📁 Copy Files**
   ```bash
   # Copy .roo/ folder to your project root
   cp -r .roo/ your-project/
   cd your-project
   ```

2. **🤖 Import Modes**
   - Roo Code sidebar → **Modes → ⋮ → Import**
   - Select `.roo/dev_team.yaml`
   - Verify all 11 modes appear in your mode list

3. **⚡ Import Commands**
   ```bash
   # Auto-detect and import all commands
   /import-commands
   ```
   - Reload VS Code window
   - Commands appear in **Settings → Slash Commands → Workspace Commands**

4. **🛡️ Enable Protection** (recommended)
   ```bash
   # Activate WRITE-GUARD with pre-configured thresholds
   /guard-on
   ```

5. **🚀 Bootstrap Project**
   - Switch to **🏗️ Architect** mode
   - Run `/bootstrap-project <name> <template>`
   - Creates Constitution, Spec, Plan, and Tasks automatically

**✨ You're ready!** Start with `/bootstrap-project` and follow the spec-driven workflow.

## Available Commands

**25 specialized slash commands** with intelligent argument hints and detailed instructions:

| Command | Arguments | Description |
|---------|-----------|-------------|
| **🚀 Bootstrap Project** | `<project-name> <template-type>` | Initialize a new Spec Kit project with standard template structure |
| **✅ Check Tools** | `<tool-type> <environment>` | Validate all required development tools are installed |
| **🔧 Implement Range** | `<start-task> <end-task>` | Execute contiguous task slice with dependency management |
| **✅ Verify Task** | `<task-id>` | Validate single task against acceptance criteria |
| **🏁 Milestone Check** | `<milestone-name> <task-range>` | Record milestone and verify task completion |
| **❓ Clarify Spec** | `<question> <answer>` | Add Q&A clarification to SPEC.md |
| **♻️ Refresh Plan** | `<target-file> <comparison-branch>` | Sync documentation with current code state |
| **🧱 ADR Template** | `<decision-title> <status>` | Create Architecture Decision Record |
| **📚 Docs TOC** | `<root-dir> <output-file>` | Generate documentation table of contents |
| **🔍 Docs Validate** | `<target-dir> <output-file>` | Lint markdown and validate links |
| **🧹 Refactor Plan** | `<scope> <max-changes> <output-file>` | Generate safe refactoring plan |
| **🧩 Cleanup Batch** | `<batch-number> <test-command>` | Apply refactoring batch with tests |
| **🧪 Test Scope** | `<task-range> <test-type>` | Generate tests from acceptance criteria |
| **📈 Coverage Snapshot** | `<comparison-ref> <output-format>` | Generate code coverage report |
| **🔎 Survey Options** | `<topic> <criteria>` | Research and compare alternatives |
| **🪄 Scaffold Tauri** | `<app-name> <template-type>` | Create Tauri application shell |
| **🧰 Scaffold Python Service** | `<service-name> <port> <template-type>` | Create FastAPI backend service |
| **🛡️ Guard On** | | Enable WRITE-GUARD protection system |
| **🛑 Guard Off** | | Disable WRITE-GUARD protection |
| **📸 Snapshot Now** | `<note>` | Create workspace snapshot |
| **↩️ Rollback File** | `<file-path>` | Restore single file from snapshot |
| **⏪ Rollback Last** | | Restore entire workspace snapshot |
| **📥 Import Commands** | | Convert YAML commands to .md files |
| **📤 Export Commands** | | Bundle .md commands into YAML |
| **🔁 Reimport Commands** | | Refresh workspace commands from YAML |

## AI Modes & Roles

**11 specialized modes** with clear descriptions and detailed role definitions:

| Mode | Description |
|------|-------------|
| **🏗️ Architect** | System designer for technical designs and project bootstrapping |
| **🧩 Taskmaster** | Project supervisor for task orchestration and dependency management |
| **✅ Verifier** | Quality assurance specialist for validation and acceptance criteria |
| **🔎 Project Research** | Research specialist for technology investigation and analysis |
| **📝 Documentation Writer** | Technical writer for project documentation and ADRs |
| **🧹 Repository Cleanup** | Code quality specialist for refactoring and maintenance |
| **💻 Code** | Software engineer for feature implementation and development |
| **🧪 Jest Test Engineer** | Testing specialist for test creation and coverage |
| **🐞 Debug** | Troubleshooting expert for issue resolution and fixes |
| **💬 Ask** | Q&A specialist for explanations and guidance |
| **📖 User Story Creator** | Product owner for story creation and requirements |

## Recommended Workflow

**Spec-driven development** with intelligent task management:

1. **🏗️ Bootstrap** → `/bootstrap-project <name> <template>` (creates Constitution, Spec, Plan, Tasks)
2. **🧩 Implement** → Switch to Taskmaster mode → `/implement-range <start> <end>` (dependency-aware execution)
3. **📝 Document** → Docs auto-update as modes progress with `/docs-toc` and `/docs-validate`
4. **🧹 Refactor** → `/refactor-plan` → `/cleanup-batch` (safe, stepwise improvements)
5. **✅ Verify** → `/verify-task <id>` or `/milestone <name> <range>` (validation gates)

**Advanced Pattern**: Use `/snapshot-now` before major changes, `/rollback-file` for quick fixes, and `/refresh-plan` to keep documentation synchronized.

Advanced Features
-----------------
- **WRITE-GUARD:** Advanced protection system that prevents destructive edits using configurable thresholds in `.roo/guard.json`:
  - `enabled`: Toggle the entire system on/off
  - `deleteThresholdPct`: Maximum percentage of lines that can be deleted (default: 25%)
  - `shrinkThresholdPct`: Maximum percentage a file can shrink (default: 20%)
  - `snapshotDir`: Directory for storing snapshots (default: `.roo/local-history`)
- **Snapshots:** All major changes backed up to `.roo/local-history/` with timestamps.
- **Command Importer:** `/import-commands` rebuilds `.roo/commands/` automatically from YAML.
- **Spec Kit Integration:** Full integration with Spec Kit CLI for `/specify`, `/plan`, `/tasks`, and `/verify` commands.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| **Commands not visible** | Run `/import-commands` and reload VS Code window |
| **Spec Kit CLI missing** | Install per [Spec Kit docs](https://docs.roocode.com) |
| **Modes not available** | Import `.roo/dev_team.yaml` via **Modes → ⋮ → Import** |
| **WRITE-GUARD too strict** | Edit `.roo/guard.json` thresholds or run `/guard-off` |
| **Snapshots not working** | Ensure `.roo/local-history/` exists and is writable |
| **Restore lost file** | Use `/rollback-file <path>` or `/rollback-last` |
| **Commands need updating** | Run `/reimport` to refresh from YAML configuration |

**Quick Fix**: `/import-commands` + VS Code reload solves 90% of setup issues.

Support & Customization
-----------------------
- To add new commands, edit `.roo/custom_commands.yaml` and re-run `/import-commands`.
- To modify behavior, update `.roo/dev_team.yaml` and re-import modes.
- Version control the `.roo/` folder to share setup across machines or teams.

Credits
-------
Developed by Darien Hardin for seamless Roo Code + Spec Kit integration.
Maintained and enhanced by the Roo Code community.
