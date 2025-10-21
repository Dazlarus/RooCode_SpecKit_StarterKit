---
description: Create and execute comprehensive tests using current testing best practices and Spec Kit validation workflows.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -RequireTasks -Json` from repo root and validate testing environment. All paths must be absolute.

2. **Parse testing requirements**:
   - Test scope and specific components to test
   - Testing approach (unit, integration, e2e)
   - Current branch TASKS.md for acceptance criteria
   - Existing test structure and frameworks

3. **Execute testing workflow**:
   - **Acceptance Criteria Analysis**: Extract testable requirements from TASKS.md
   - **Test Strategy Planning**: Design comprehensive test coverage
   - **Test Implementation**: Create tests following current best practices
   - **Test Execution**: Run tests and validate results
   - **Coverage Analysis**: Generate and analyze test coverage reports

4. **Apply current testing practices**:
   - Prefer fast unit tests for core functionality
   - Add integration tests for critical user flows
   - Generate coverage snapshots and track improvements
   - Scaffold test harness if missing or incomplete

5. **Template-driven testing**:
   - Use tasks-template.md for test implementation patterns
   - Follow checklist-template.md for test validation workflows
   - Generate test documentation using established template structures
   - Apply consistent test organization across all testing activities

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before test execution
   - Run `update-agent-context.ps1` after test creation
   - Validate test environment and dependencies
   - Generate comprehensive test reports and evidence

7. **Generate testing deliverables**:
   - **Unit Tests**: Fast, focused tests for individual components
   - **Integration Tests**: Tests for critical user journey flows
   - **Test Coverage**: Coverage reports and improvement tracking
   - **Test Documentation**: Test strategies and execution guidelines
   - **Evidence Logs**: Test execution results and validation evidence

8. **Report**: Output testing summary:
   - Test execution results and pass/fail status
   - Coverage deltas and improvement areas
   - Next best test recommendations
   - Validation evidence and quality metrics

Context for testing: $ARGUMENTS

## Integration Requirements

**TEST AUTOMATION**: Execute comprehensive testing workflows:
- Unit test creation and execution for individual components
- Integration test development for critical user flows
- Test coverage analysis and improvement tracking
- Test environment validation and setup automation

**TEMPLATE CONSISTENCY**: Apply Spec Kit testing patterns:
- Use tasks-template.md for test implementation organization
- Follow checklist-template.md for test validation workflows
- Generate test documentation using established structures
- Apply consistent test organization across all testing activities

**SCRIPT INTEGRATION**: Use automation scripts for testing:
- `check-prerequisites.ps1` before test environment setup
- `update-agent-context.ps1` after test creation and updates
- Generate evidence logs for all test activities
- Validate test results against acceptance criteria

**TESTING BEST PRACTICES**: Apply current testing methodologies:
- Test-driven development patterns and workflows
- Comprehensive coverage strategies and analysis
- Fast, reliable test execution and reporting
- Evidence-based test validation and quality assurance