---
description: Update all agent context files with latest project changes and ensure synchronization across all Spec Kit modes.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate context update environment. All paths must be absolute.

2. **Parse context update scope**:
   - Current branch and project changes
   - Documents that have been modified or created
   - Agent context files that need synchronization
   - Context drift detection and remediation requirements

3. **Execute context synchronization workflow**:
   - **Change Detection**: Identify documents and files that have changed
   - **Context Analysis**: Analyze changes for context relevance
   - **Agent Impact Assessment**: Determine which agents need context updates
   - **Synchronization Planning**: Plan context updates across all affected agents

4. **Apply context update strategies**:
   - Update agent context files with latest project information
   - Synchronize context across all Spec Kit modes
   - Validate context consistency and accuracy
   - Generate context update evidence and tracking

5. **Template-driven context management**:
   - Use agent-file-template.md for context file structure
   - Follow checklist-template.md for context validation workflows
   - Generate context documentation using established template structures
   - Apply consistent context formatting across all agent files

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before context updates
   - Run `update-agent-context.ps1` for comprehensive synchronization
   - Validate context consistency across all agents
   - Generate context update reports and evidence

7. **Generate context deliverables**:
   - **Updated Context Files**: Synchronized agent context across all modes
   - **Change Summary**: Documentation of what was updated and why
   - **Synchronization Report**: Context consistency validation results
   - **Evidence Logs**: Context update activities and validation evidence

8. **Report**: Output context update summary:
   - Context files updated and synchronization status
   - Changes incorporated into agent context
   - Validation results and consistency checks
   - Next steps for continuing development

Context for context update: $ARGUMENTS

## Integration Requirements

**COMPREHENSIVE CONTEXT SYNCHRONIZATION**: Update context across all agents:
- Analyze recent changes and their context implications
- Update all relevant agent context files with current information
- Validate context consistency across all Spec Kit modes
- Generate evidence of context synchronization activities

**CHANGE DETECTION**: Identify all relevant changes:
- Document modifications and their context significance
- Code changes and their architectural implications
- Specification updates and requirement modifications
- Test additions and quality assurance changes
- Documentation updates and knowledge base modifications

**SCRIPT AUTOMATION**: Use context management scripts:
- `check-prerequisites.ps1` before context synchronization
- `update-agent-context.ps1` for comprehensive context updates
- Template validation for context file consistency
- Evidence collection for context tracking

**CONTEXT QUALITY ASSURANCE**: Ensure context accuracy:
- Validate context file completeness and accuracy
- Check context consistency across all agents
- Verify context synchronization timing and completeness
- Generate context validation reports and evidence