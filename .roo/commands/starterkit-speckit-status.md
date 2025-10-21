---
description: Get current project status, active tasks, and progress summary for workflow coordination and decision making.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and gather current project state. All paths must be absolute.

2. **Parse status scope**:
   - Current branch and project context
   - Active tasks and workflow phase
   - Document status and completion tracking
   - Agent context and synchronization state

3. **Execute status assessment workflow**:
   - **Project State Analysis**: Evaluate current branch documents and status
   - **Task Progress Tracking**: Review active tasks and completion status
   - **Document Validation**: Check document completeness and consistency
   - **Context Synchronization**: Verify agent context is up to date

4. **Gather comprehensive status information**:
   - Current branch SPEC.md, PLAN.md, TASKS.md status
   - Active workflow phase and task progress
   - Generated documents and their completion status
   - Script execution history and evidence logs
   - Agent context synchronization status

5. **Template-driven status reporting**:
   - Use checklist-template.md for status validation workflows
   - Follow tasks-template.md patterns for progress tracking
   - Generate status documentation using established template structures
   - Apply consistent status reporting across all project phases

6. **Execute validation scripts**:
   - Run `check-prerequisites.ps1` to validate current state
   - Run `update-agent-context.ps1` if context drift detected
   - Validate document consistency and template compliance
   - Generate status evidence and progress tracking

7. **Generate status deliverables**:
   - **Project Health Assessment**: Overall project status and health
   - **Active Task Summary**: Currently active tasks and progress
   - **Document Status**: Completion status of all required documents
   - **Workflow Progress**: Current phase and next steps
   - **Evidence Summary**: Recent activities and validation results

8. **Report**: Output comprehensive status summary:
   - Current project phase and active tasks
   - Document completion status and gaps
   - Next steps and priority actions
   - Validation results and health indicators
   - Workflow coordination guidance

Context for status assessment: $ARGUMENTS

## Integration Requirements

**COMPREHENSIVE STATUS GATHERING**: Collect all relevant status information:
- Current branch document status and completion tracking
- Active task progress and workflow phase identification
- Agent context synchronization and drift detection
- Script execution history and evidence availability
- Template compliance and document consistency validation

**WORKFLOW COORDINATION**: Provide status for workflow orchestration:
- Current phase identification for proper task delegation
- Active task tracking for progress monitoring
- Document status for prerequisite validation
- Context synchronization for agent coordination
- Evidence availability for completion validation

**SCRIPT AUTOMATION**: Use status validation scripts:
- `check-prerequisites.ps1` for current state validation
- `update-agent-context.ps1` for context synchronization
- Template validation for document consistency
- Evidence collection for status tracking

**STATUS REPORTING**: Generate actionable status information:
- Clear identification of current workflow phase
- Specific next steps and priority actions
- Document gaps and completion requirements
- Validation issues and remediation guidance
- Progress tracking and milestone identification