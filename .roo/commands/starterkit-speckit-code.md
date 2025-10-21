---
description: Implement features using current best practices with Context7 MCP integration and comprehensive Spec Kit automation.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -RequireTasks -Json` from repo root and validate implementation environment. All paths must be absolute.

2. **Load implementation context**:
   - Read current branch PLAN.md for Dev Notes and implementation guidance
   - Load TASKS.md for specific implementation tasks and acceptance criteria
   - Review existing code structure and patterns
   - Check for existing tests and documentation requirements

3. **Execute implementation workflow**:
   - **Context7 MCP Research**: Use resolve-library-id and get-library-docs for current best practices
   - **Current Framework Research**: Research latest patterns for chosen technologies
   - **API Validation**: Verify implementation against current documentation
   - **Pattern Application**: Apply current coding patterns and idioms from Context7

4. **Apply implementation best practices**:
   - Follow Dev Notes from current branch PLAN.md precisely
   - Implement only current task scope (no scope creep)
   - Create/update minimal tests alongside code
   - Use current library versions and approaches
   - Apply Context7 current API patterns and coding standards

5. **Template-driven development**:
   - Reference tasks-template.md for implementation patterns
   - Use checklist-template.md for validation workflows
   - Generate task-specific documentation from templates
   - Apply context-aware code generation using current branch information

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before starting implementation
   - Run `update-agent-context.ps1` after code changes
   - Validate implementation matches spec-template.md requirements
   - Generate evidence logs for all implementation activities

7. **Generate implementation deliverables**:
   - **Feature Implementation**: Code following current best practices
   - **Tests**: Minimal tests created alongside implementation
   - **Documentation**: Code comments and API documentation
   - **Context Updates**: Updated agent context files
   - **Evidence Logs**: Script execution and Context7 research logs

8. **Report**: Output implementation summary:
   - Files changed and implementation details
   - Tests added and validation results
   - Context7 research logs and findings
   - Next steps for continuing development

Context for implementation: $ARGUMENTS

## Integration Requirements

**CONTEXT7 MCP INTEGRATION**: Before implementing any library or framework:
- Use resolve-library-id to identify correct library IDs
- Use get-library-docs for current documentation and patterns
- Apply current API patterns and coding standards from Context7
- Validate implementation approaches against current library documentation

**SPEC KIT AUTOMATION**: Execute these scripts at workflow stages:
- `check-prerequisites.ps1` before starting implementation
- `update-agent-context.ps1` after code changes
- Template validation to ensure implementation matches specifications

**CURRENT BEST PRACTICES ENFORCEMENT**:
- Research current framework best practices before implementation
- Verify API usage against current documentation from Context7
- Apply current coding patterns and idioms from Context7 examples
- Ensure implementation uses current library versions and approaches

**EVIDENCE COLLECTION**: Document all implementation activities:
- Context7 MCP research logs and findings
- Script execution evidence and validation results
- Test creation and execution logs
- Template utilization and validation reports