---
description: Debug and troubleshoot issues using current best practices with Context7 MCP integration and comprehensive failure analysis.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate debugging environment. All paths must be absolute.

2. **Parse debugging requirements**:
   - Issue description and symptoms
   - Error messages and stack traces
   - Expected vs actual behavior
   - Environment and configuration details

3. **Execute debugging workflow**:
   - **Issue Reproduction**: Systematically reproduce the reported issue
   - **Root Cause Analysis**: Identify the underlying cause using current debugging practices
   - **Context7 MCP Research**: Use resolve-library-id and get-library-docs for current solutions
   - **Current Debugging Practices**: Apply latest debugging techniques and patterns

4. **Apply systematic debugging approach**:
   - First reproduce the issue with detailed steps and evidence
   - Save reproduction steps and logs to runs/evidence/
   - Add failing test case to capture the issue
   - Research current solutions using Context7 MCP
   - Implement targeted fix using current best practices

5. **Template-driven debugging**:
   - Use checklist-template.md for systematic debugging workflows
   - Follow tasks-template.md patterns for fix implementation
   - Document debugging process using established template structures
   - Generate evidence logs for all debugging activities

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before debugging activities
   - Run `update-agent-context.ps1` after applying fixes
   - Validate fixes against established patterns
   - Generate comprehensive debugging reports

7. **Generate debugging deliverables**:
   - **Reproduction Steps**: Detailed steps to reproduce the issue
   - **Root Cause Analysis**: Identified cause and contributing factors
   - **Fix Implementation**: Targeted solution using current best practices
   - **Test Validation**: Tests confirming the fix works correctly
   - **Evidence Logs**: Complete debugging evidence and research findings

8. **Report**: Output debugging summary:
   - Reproduction steps and evidence
   - Root cause analysis and findings
   - Applied fix with implementation details
   - Validation results and test outcomes
   - Context7 research logs and current solutions

Context for debugging: $ARGUMENTS

## Integration Requirements

**CONTEXT7 MCP DEBUGGING**: Before troubleshooting framework/library issues:
- Use resolve-library-id and get-library-docs for current debugging documentation
- Apply current debugging patterns and solutions from Context7
- Research current error handling and debugging approaches
- Validate debugging techniques against current best practices

**EVIDENCE-BASED DEBUGGING**: Maintain comprehensive evidence:
- Reproduction steps with exact commands and outputs
- Error logs and stack traces with timestamps
- Test cases that demonstrate the issue and fix
- Context7 research findings and applied solutions
- Before/after comparisons showing issue resolution

**SCRIPT AUTOMATION**: Execute these scripts during debugging:
- `check-prerequisites.ps1` before starting debugging work
- `update-agent-context.ps1` after applying fixes
- Generate evidence logs for all debugging activities
- Validate fixes against acceptance criteria

**DEBUGGING METHODOLOGY**: Apply current debugging best practices:
- Systematic reproduction with minimal test cases
- Root cause analysis using current diagnostic techniques
- Evidence-based fix validation and testing
- Comprehensive documentation of findings and solutions