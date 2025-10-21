---
description: Initialize a new Spec Kit project with feature specifications, technical planning, and complete development workflow automation.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute.

2. **Load existing documents**: Read from current branch:
   - **Required**: plan.md (tech stack, libraries, structure), spec.md (user stories with priorities)
   - **Optional**: data-model.md (entities), contracts/ (API endpoints), research.md (decisions), quickstart.md (test scenarios)
   - Note: Not all projects have all documents. Generate based on what's available.

3. **Execute initialization workflow**:
   - **Spec Kit Environment Setup**: Validate and initialize Spec Kit environment
   - **Feature Analysis**: Analyze user requirements and break down into structured specifications
   - **Template Application**: Use .specify/templates/ for consistent document structure
   - **Script Integration**: Run appropriate PowerShell scripts for automation

4. **Generate core documents** using `.specify/templates/` as structure:
   - **spec.md**: Feature specification with user stories and acceptance criteria
   - **plan.md**: Technical implementation plan with architecture decisions
   - **tasks.md**: Detailed task breakdown organized by user story
   - **checklist.md**: Validation checklist for the feature
   - **agent-context.md**: Context file for all agents

5. **Initialize development workflow**:
   - Run `create-new-feature.ps1` to bootstrap the feature structure
   - Run `setup-plan.ps1` to initialize implementation planning
   - Run `update-agent-context.ps1` to sync all agent files
   - Validate all generated documents follow template structures

6. **Report**: Output paths to generated documents and summary:
   - Generated document locations and purposes
   - Next steps for development team
   - Validation checklist for immediate review
   - Suggested starting point for implementation

Context for initialization: $ARGUMENTS

## Integration Requirements

**CRITICAL**: All generated documents MUST use the corresponding templates from `.specify/templates/`:
- `spec-template.md` for feature specifications
- `plan-template.md` for technical planning
- `tasks-template.md` for task organization
- `checklist-template.md` for validation workflows
- `agent-file-template.md` for context files

**AUTOMATION**: Run these scripts at appropriate workflow stages:
- `check-prerequisites.ps1` before starting any work
- `create-new-feature.ps1` when bootstrapping new features
- `setup-plan.ps1` when initializing implementation plans
- `update-agent-context.ps1` after document updates

**TEMPLATE CONSISTENCY**: Ensure all generated content follows the exact structure and formatting of the corresponding templates.