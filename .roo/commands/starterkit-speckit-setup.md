---
description: Complete automated setup that installs/updates Spec Kit, initializes the project, and configures your development team with interactive prompts.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Set up a complete Spec Kit development environment with Roo Code integration by:
1. Installing or updating Spec Kit CLI
2. Initializing a new Spec Kit project
3. Guiding the user through team configuration selection
4. Importing the selected team configuration to .roomodes
5. Validating the complete setup

## Operating Constraints

**FULLY AUTOMATED**: Execute all installation, initialization, and configuration steps automatically without requiring user intervention for technical details.

**NON-DESTRUCTIVE**: Preserve any existing .roomodes configuration and merge new team modes without overwriting existing custom modes.

**USER-FRIENDLY**: Provide clear progress indicators, explanations, and troubleshooting guidance throughout the process.

**ROBUST ERROR HANDLING**: Gracefully handle installation failures, network issues, and configuration conflicts with clear recovery instructions.

## Execution Steps

### 1. Environment Assessment

Check current system state and gather requirements:

- Verify internet connectivity for downloading dependencies
- Check if uv package manager is available (install if missing)
- Determine if this is a fresh setup or existing project
- Parse any user input for project name or team preferences

### 2. Spec Kit Installation/Update

Execute the appropriate installation workflow:

**If Spec Kit not installed:**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

**If Spec Kit already installed:**
```bash
uv tool install specify-cli --force --from git+https://github.com/github/spec-kit.git
```

**Verification:**
```bash
specify --version
specify --help
```

Abort with clear error message if installation fails, providing troubleshooting steps.

### 3. Project Initialization

Initialize the Spec Kit project structure:

```bash
specify init "Complete project setup with Spec Kit and Roo Code integration"
```

Verify successful initialization by checking:
- .specify/ directory created
- Basic project templates available
- Configuration files in place

### 4. Interactive Constitution Creation

Guide the user through creating the initial project constitution:

**Load Constitution Template:**
- Read `.specify/memory/constitution.md` to understand required placeholders
- Identify tokens like `[PROJECT_NAME]`, `[PRINCIPLE_1_NAME]`, `[RATIFICATION_DATE]`, etc.

**Interactive Value Collection:**
- **Project Identity:** Ask for project name, description, and main objectives
- **Core Principles:** Help user define fundamental development principles:
  - Quality Assurance (testing, validation, acceptance criteria)
  - Security (vulnerability management, secure coding practices)
  - Performance (optimization, monitoring, scalability requirements)
  - Documentation (README, API docs, inline comments)
  - Collaboration (code review, communication, knowledge sharing)

**Constitution Structure:**
- Project overview and mission statement
- Non-negotiable MUST requirements for each principle
- SHOULD recommendations for best practices
- Governance procedures (amendment process, version management)
- Compliance and review expectations

**Template Integration:**
- Update plan-template.md with constitution references
- Update spec-template.md with principle alignment
- Update tasks-template.md with governance requirements
- Ensure all templates reflect the established principles

**Version Management:**
- Set initial version as 1.0.0
- Use today's date for ratification
- Create sync impact report documenting all changes

### 5. Interactive Team Selection

Present team configuration options and get user preference:

**Display Options:**
- **🐣 Beginner (7 modes)**: Architect, Ask, Code, Debug, Documentation Writer, Taskmaster, Verifier
- **🏗️ Foundation (10 modes)**: All Beginner modes + Issue Writer, Repository Cleanup, Project Research
- **🚀 Enterprise (17 modes)**: All Foundation modes + API Designer, DevOps Engineer, Jest Test Engineer, Performance Engineer, Release Manager, Research Updater, Security Reviewer

**Get Selection:**
Ask user: "Which team configuration best fits your project needs? (beginner/foundation/enterprise)"

**Default:** If no clear preference, recommend Foundation as the balanced middle ground.

### 5. Project Constitution Creation

Create the initial project constitution to establish governance principles:

**Load Constitution Template:**
- Read `.specify/memory/constitution.md` template
- Identify all placeholder tokens in format `[ALL_CAPS_IDENTIFIER]`
- Parse existing project context for default values

**Interactive Constitution Setup:**
- **Project Identity:** Collect project name, description, and purpose
- **Core Principles:** Establish fundamental development principles (Quality, Security, Performance, Documentation, Testing)
- **Governance Rules:** Define decision-making processes and amendment procedures
- **Version Management:** Set initial constitution version (1.0.0) and ratification date

**Constitution Content Structure:**
- Project overview and objectives
- Non-negotiable development principles (MUST requirements)
- Recommended practices (SHOULD guidance)
- Amendment and governance procedures
- Version tracking and compliance requirements

**Template Synchronization:**
- Update `.specify/templates/plan-template.md` with constitution references
- Update `.specify/templates/spec-template.md` with principle alignment
- Update `.specify/templates/tasks-template.md` with governance requirements
- Ensure all templates reflect constitution principles

**Generate Sync Impact Report:**
- Document version changes and rationale
- List all modified templates and files
- Create follow-up TODOs for manual adjustments
- Provide commit message suggestions

### 6. Team Configuration Import

Import the selected team configuration to .roomodes:

**Read existing configuration:**
- Load current .roomodes file (create if doesn't exist)
- Parse existing customModes array
- Preserve any existing configurations

**Convert and merge team configuration:**
- Read the selected team YAML file from Teams/ directory
- Convert YAML team configuration to JSON format
- Add all team modes to customModes array
- Maintain proper JSON structure and formatting

**Write updated configuration:**
- Save merged configuration back to .roomodes
- Validate JSON syntax and structure
- Ensure no data loss or corruption

### 7. Setup Validation

Verify complete setup functionality:

**Spec Kit Validation:**
```bash
specify status
specify validate
```

**Constitution Validation:**
- Verify `.specify/memory/constitution.md` exists and is complete
- Check that no placeholder tokens remain unresolved
- Validate constitution version and dates
- Confirm template synchronization

**Configuration Validation:**
- Verify .roomodes file exists and contains valid JSON
- Confirm team modes are properly imported
- Check that mode count matches selection (7, 10, or 17 modes)

**Integration Testing:**
- Test that specify commands work correctly
- Verify project structure is complete
- Check for any permission or path issues

### 8. Completion and Guidance

Provide comprehensive setup summary and next steps:

**Success Confirmation:**
- Display which team configuration was installed
- Show number of modes imported
- Confirm Spec Kit functionality
- Verify constitution creation and template sync

**Project Foundation Summary:**
- ✅ Project constitution v1.0.0 created with core governance principles
- ✅ Team configuration imported and active ([7|10|17] modes based on selection)
- ✅ Spec Kit project structure initialized with synchronized templates
- ✅ All templates aligned with constitution requirements and governance

**Constitution Highlights:**
- **Quality Assurance:** Testing, validation, and acceptance criteria standards established
- **Security:** Vulnerability management and secure coding practices defined
- **Performance:** Optimization goals and monitoring requirements set
- **Documentation:** README, API docs, and commenting standards specified
- **Collaboration:** Code review and communication processes outlined

**Next Steps:**
1. **Restart Roo Code** to load the new team configuration and constitution-aligned modes
2. **Review Constitution** at `.specify/memory/constitution.md` to understand project governance
3. **Create First Feature:** `specify init "Add user authentication system"`
4. **Use Team Modes:** Leverage imported modes for development tasks following constitution principles
5. **Explore Commands:** Use Spec Kit commands and team workflows for structured development

**Available Commands:**
- `/starterkit-speckit-spec-init` - Create structured project specifications (constitution-aligned)
- `/starterkit-speckit-status` - Check current project status and compliance
- `/starterkit-speckit-validate` - Validate Spec Kit setup and constitution adherence
- `/starterkit-speckit-constitution` - Update constitution for future governance changes

**Constitution-Driven Development:**
- All development activities now follow the established principles
- Team modes are configured to enforce constitution requirements
- Templates include governance checkpoints and compliance validation
- Project structure supports principle-based decision making

## Team Configuration Details

### Beginner Configuration (7 modes)
**Purpose:** Getting started with Spec Kit and structured development
**Modes:** Architect, Ask, Code, Debug, Documentation Writer, Taskmaster, Verifier
**Use Case:** Learning Spec Kit, small personal projects, simple applications
**Scope:** Core development workflow with basic project management

### Foundation Configuration (10 modes)
**Purpose:** Solid development workflows with enhanced project management
**Modes:** All Beginner modes + Issue Writer, Repository Cleanup, Project Research
**Use Case:** Growing teams, medium complexity projects, professional development
**Scope:** Enhanced project management and code quality workflows

### Enterprise Configuration (17 modes)
**Purpose:** Complete development lifecycle with specialized roles
**Modes:** All Foundation modes + API Designer, DevOps Engineer, Jest Test Engineer, Performance Engineer, Release Manager, Research Updater, Security Reviewer
**Use Case:** Large teams, complex applications, enterprise development
**Scope:** Full development lifecycle with specialized technical roles

## Error Handling and Recovery

**Installation Failures:**
- Check internet connectivity
- Verify uv installation and PATH configuration
- Provide manual installation commands as fallback
- Suggest checking firewall and security settings

**Project Initialization Issues:**
- Verify git installation and configuration
- Check repository permissions and access
- Provide manual initialization commands
- Suggest checking disk space and permissions

**Configuration Import Problems:**
- Validate YAML team file integrity
- Check JSON conversion process
- Verify .roomodes file permissions
- Provide manual merge instructions if needed

**Validation Failures:**
- Test each component individually
- Provide specific error messages and solutions
- Suggest restarting Roo Code
- Offer rollback procedures if needed

## Context

$ARGUMENTS

## Constitution Creation Details

### Interactive Constitution Process

**Project Identity Collection:**
- Project name and description from user input or repository context
- Main objectives and success criteria
- Target audience and use cases

**Core Principles Definition:**
- **Quality Assurance:** Testing requirements, validation processes, acceptance criteria standards
- **Security:** Vulnerability management, secure coding practices, compliance requirements
- **Performance:** Optimization goals, monitoring requirements, scalability expectations
- **Documentation:** README standards, API documentation, inline code documentation
- **Collaboration:** Code review processes, communication standards, knowledge sharing

**Governance Framework:**
- Amendment procedures for constitution updates
- Version management and semantic versioning policy
- Compliance review and validation processes
- Decision-making authority and escalation paths

**Template Synchronization:**
- Update plan-template.md with constitution principle references
- Update spec-template.md with governance requirements
- Update tasks-template.md with compliance task types
- Ensure all templates align with established principles

### Constitution File Structure

**.specify/memory/constitution.md format:**
```markdown
# Project Constitution

## Project Identity
- **Project Name:** [PROJECT_NAME]
- **Description:** [PROJECT_DESCRIPTION]
- **Ratification Date:** [RATIFICATION_DATE]
- **Version:** [CONSTITUTION_VERSION]

## Core Principles

### 1. Quality Assurance
**MUST:** [PRINCIPLE_1_MUST]
**Rationale:** [PRINCIPLE_1_RATIONALE]

### 2. Security
**MUST:** [PRINCIPLE_2_MUST]
**Rationale:** [PRINCIPLE_2_RATIONALE]

## Governance

### Amendment Process
- Constitution changes require [AMENDMENT_PROCESS]
- Version bumps follow [VERSIONING_POLICY]
- Compliance reviews occur [REVIEW_FREQUENCY]

## Compliance
- All project activities must align with established principles
- Deviations require documented rationale and approval
- Regular constitution reviews ensure continued relevance
```

## Success Criteria

✅ Spec Kit CLI installed and accessible via `specify` command
✅ Project successfully initialized with `specify init`
✅ Project constitution created at `.specify/memory/constitution.md`
✅ All constitution placeholders resolved with concrete values
✅ Template synchronization completed across all Spec Kit templates
✅ Team configuration imported to .roomodes without data loss
✅ JSON structure valid and Roo Code compatible
✅ All validation commands execute successfully
✅ User provided with clear next steps and governance guidance
✅ Complete setup ready for principle-driven development workflow