# Roo Code + Spec Kit Starter Kit

Development environment that integrates Roo Code's AI-powered workflow system with Spec Kit's specification-driven development methodology.

## Overview

This starter kit provides tools for spec-driven development with Roo Code:

- **Bootstrap Pipeline** - Complete project initialization with tool validation and setup
- **Guard Management** - Protection system with flexible configuration
- **Snapshot Management** - Full snapshot lifecycle with rollback capabilities
- **Documentation Tools** - Self-maintaining docs with TOC generation and validation
- **Consolidated Commands** - 11 commands with multiple operations via flags
- **YAML Workflow** - Maintain all commands in one file with import/export

## What's Included

```
.roo/
├── commands/                    # 11 consolidated slash commands (auto-generated)
│   ├── bootstrap.md            # Complete project initialization pipeline
│   ├── guard.md                # WRITE-GUARD configuration management
│   ├── snapshot.md             # Comprehensive snapshot lifecycle
│   ├── docs.md                 # Documentation management (TOC, validation)
│   ├── job.md                  # Development workflow (tasks, milestones)
│   ├── research.md             # Research management (surveys, clarifications)
│   └── ...                     # All workspace commands
├── custom_commands.yaml        # Master command definitions with argument hints
├── dev_team.yaml              # 11 specialized AI modes with descriptions
├── guard.json                 # WRITE-GUARD protection configuration
├── local-history/             # Automatic snapshots (pre-edit backups)
└── runs/                      # Evidence directory for reports & outputs
    ├── evidence/              # Command execution logs & results
    └── tests/                 # Test outputs & coverage reports
```

Copy `.roo/` to your project root, import modes and commands, and begin development.

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
   - Roo Code sidebar → **Modes → Import**
   - Select `.roo/dev_team.yaml`
   - Verify all 11 modes appear in your mode list

3. **⚡ Import Commands**
   ```bash
   # Auto-detect and import all commands
   /import-commands
   ```
   - Reload VS Code window
   - Commands appear in **Settings → Slash Commands → Workspace Commands**

4. **Enable Protection** (recommended)
    ```bash
    # Activate WRITE-GUARD with pre-configured thresholds
    /guard --enable
    ```

5. **Bootstrap Project**
    - Switch to **🏗️ Architect** mode
    - Run `/bootstrap 'MyProject' --interactive`
    - Complete guided pipeline creates everything automatically

Start with `/bootstrap` and follow the development workflow.

## Available Commands

**11 consolidated commands** with 50+ operations via intelligent flag-based interfaces:

### Core Workflow Commands
| Command | Primary Operations | Description |
|---------|-------------------|-------------|
| **🚀 /bootstrap** | `--interactive`, `--check-only`, `--auto-approve` | Complete guided project initialization pipeline |
| **🔧 /job** | `--implement`, `--verify`, `--milestone`, `--list`, `--progress` | Development workflow management and task operations |
| **📚 /docs** | `--generate-toc`, `--validate`, `--list`, `--stats` | Documentation lifecycle management with intelligent defaults |
| **🔎 /research** | `--survey`, `--clarify`, `--sources`, `--compare`, `--update` | Research management and analysis capabilities |

### System Management Commands
| Command | Primary Operations | Description |
|---------|-------------------|-------------|
| **🛡️ /guard** | `--enable/--disable`, `--delete-threshold`, `--shrink-threshold`, `--status` | WRITE-GUARD protection system configuration |
| **📸 /snapshot** | `--create`, `--list`, `--rollback-file`, `--rollback-batch`, `--info` | Comprehensive snapshot lifecycle management |

### Import/Export System
| Command | Operations | Description |
|---------|-----------|-------------|
| **📥 /import-commands** | Auto-detection, validation, overwrite protection | Intelligent YAML → .md conversion with optimization |
| **📤 /export-commands** | Directory scanning, content bundling | .md → YAML consolidation with validation |

### Spec Kit Integration
| Command | Arguments | Description |
|---------|-----------|-------------|
| **♻️ /refresh-plan** | `<target-file> <comparison-branch>` | Sync documentation with current code state |
| **🧱 /adr** | `<decision-title> <status>` | Create Architecture Decision Record |
| **🧹 /refactor-plan** | `<scope> <max-changes> <output-file>` | Generate safe refactoring plan |
| **🧩 /cleanup-batch** | `<batch-number> <test-command>` | Apply refactoring batch with tests |
| **🧪 /test-scope** | `<task-range> <test-type>` | Generate tests from acceptance criteria |
| **📈 /coverage-snapshot** | `<comparison-ref> <output-format>` | Generate code coverage report |
| **🪄 /scaffold-tauri** | `<app-name> <template-type>` | Create Tauri application shell |
| **🧰 /scaffold-python-svc** | `<service-name> <port> <template-type>` | Create FastAPI backend service |

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

Development workflow with consolidated command management:

1. **Bootstrap** → `/bootstrap 'MyProject' --interactive` (complete guided setup pipeline)
2. **Implement** → Switch to Taskmaster mode → `/job --implement <start> <end>` (dependency-aware execution)
3. **Document** → Auto-maintained with `/docs --generate-toc` and `/docs --validate`
4. **Refactor** → `/refactor-plan` → `/cleanup-batch` (safe, stepwise improvements)
5. **Verify** → `/job --verify <task-id>` or `/job --milestone <name> <range>` (validation gates)

Use `/snapshot --create` before major changes, `/snapshot --rollback-file` for quick fixes, and `/refresh-plan` to keep documentation synchronized.

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

`/import-commands` + VS Code reload solves most setup issues.

Support & Customization
-----------------------
- To add new commands, edit `.roo/custom_commands.yaml` and re-run `/import-commands`.
- To modify behavior, update `.roo/dev_team.yaml` and re-import modes.
- Version control the `.roo/` folder to share setup across machines or teams.

Credits
-------
Developed by Darien Hardin for Roo Code + Spec Kit integration.
Maintained and enhanced by the Roo Code community.
