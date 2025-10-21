---
description: Validate current project state, run prerequisite checks, and ensure all Spec Kit components are properly configured and ready for development.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate current project state. All paths must be absolute.

2. **Parse validation scope**: Determine what to validate:
   - Project structure and Spec Kit setup
   - Current branch documents (spec.md, plan.md, tasks.md)
   - Template availability and consistency
   - Script availability and functionality
   - Agent context synchronization
   - Development environment readiness

3. **Execute comprehensive validation**:
   - **Environment Validation**: Check Spec Kit environment setup
   - **Document Validation**: Verify all required documents exist and are valid
   - **Template Validation**: Ensure all templates are available and accessible
   - **Script Validation**: Verify all PowerShell scripts are functional
   - **Context Validation**: Check agent context synchronization
   - **Dependency Validation**: Verify project dependencies and requirements

4. **Run prerequisite checks**:
   - Execute `check-prerequisites.ps1` with appropriate flags
   - Parse and analyze prerequisite check results
   - Identify any missing components or configuration issues
   - Generate remediation steps for any issues found

5. **Validate template consistency**:
   - Check that all documents follow template structures
   - Verify template availability in `.specify/templates/`
   - Validate document formatting and organization
   - Ensure consistent metadata and structure

6. **Test script functionality**:
   - Test execution of key PowerShell scripts
   - Verify script permissions and dependencies
   - Check for script errors or missing components
   - Validate script output and logging

7. **Generate validation report**:
   - **Environment Status**: Spec Kit setup and configuration
   - **Document Status**: Required documents and their validity
   - **Template Status**: Template availability and usage
   - **Script Status**: PowerShell script functionality
   - **Context Status**: Agent context synchronization
   - **Issues Found**: Any problems or missing components
   - **Remediation Steps**: Actions needed to fix any issues

8. **Report**: Output validation results:
   - Overall project health assessment
   - Specific issues found and their severity
   - Remediation steps for any problems
   - Next steps for continuing development
   - Evidence of validation activities

Context for validation: $ARGUMENTS

## Integration Requirements

**COMPREHENSIVE VALIDATION**: Check all aspects of Spec Kit setup:
- Environment configuration and dependencies
- Document structure and template compliance
- Script availability and functionality
- Agent context synchronization
- Project state and readiness for development

**AUTOMATION INTEGRATION**: Use Spec Kit scripts for validation:
- `check-prerequisites.ps1` for environment and state validation
- `update-agent-context.ps1` for context synchronization
- Template validation for document consistency
- Script execution testing for functionality verification

**EVIDENCE COLLECTION**: Document all validation activities:
- Prerequisite check results and outputs
- Template validation findings
- Script execution logs and results
- Context synchronization status
- Issue identification and remediation steps

**REMEDIATION GUIDANCE**: Provide clear next steps:
- Specific commands to fix identified issues
- Missing component installation or setup
- Configuration changes needed
- Development workflow continuation guidance