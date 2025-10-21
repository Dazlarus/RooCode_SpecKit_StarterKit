---
description: Create and implement a complete feature using the full Spec Kit development pipeline with automated workflow orchestration.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate current project state. All paths must be absolute.

2. **Parse feature requirements**: Extract and analyze the feature request:
   - Feature description and scope
   - User stories and acceptance criteria
   - Technical requirements and constraints
   - Priority and complexity assessment

3. **Execute complete development workflow**:
   - **Issue Writer**: Create structured issue with acceptance criteria
   - **Architect**: Design technical specifications and system architecture
   - **DevOps Engineer**: Set up infrastructure and deployment pipelines
   - **API Designer**: Design APIs and create specifications (if needed)
   - **Code**: Implement using current best practices and Context7 integration
   - **Performance Engineer**: Optimize performance and scalability
   - **Test Engineer**: Create comprehensive test suite
   - **Release Manager**: Package and prepare for deployment
   - **Verifier**: Validate all acceptance criteria are met
   - **Documentation Writer**: Generate comprehensive documentation

4. **Orchestrate workflow phases**:
   - **Phase 1**: Requirements analysis and structured issue creation
   - **Phase 2**: Technical design and architecture planning
   - **Phase 3**: Infrastructure setup and DevOps automation
   - **Phase 4**: API design and contract specifications (if applicable)
   - **Phase 5**: Implementation with current best practices
   - **Phase 6**: Performance optimization and scalability analysis
   - **Phase 7**: Testing and quality assurance
   - **Phase 8**: Release management and deployment preparation
   - **Phase 9**: Validation and acceptance criteria verification
   - **Phase 10**: Documentation and knowledge transfer

5. **Apply template consistency**:
   - Use `spec-template.md` for feature specifications
   - Use `plan-template.md` for technical planning
   - Use `tasks-template.md` for implementation breakdown
   - Use `checklist-template.md` for validation workflows
   - Use `agent-file-template.md` for context management

6. **Execute automation scripts**:
   - Run `create-new-feature.ps1` to bootstrap feature structure
   - Run `setup-plan.ps1` to initialize implementation planning
   - Run `update-agent-context.ps1` after each major phase
   - Run `check-prerequisites.ps1` before each workflow transition

7. **Generate deliverables**:
   - **spec.md**: Complete feature specification with user stories
   - **plan.md**: Technical implementation plan with architecture
   - **tasks.md**: Detailed task breakdown by user story
   - **checklist.md**: Validation checklist for acceptance criteria
   - **API specifications**: OpenAPI/Swagger documentation (if applicable)
   - **Test suite**: Comprehensive tests for all acceptance criteria
   - **Documentation**: User guides, API docs, and runbooks
   - **Deployment artifacts**: Packaged application ready for release

8. **Report**: Output comprehensive summary:
   - Complete feature implementation status
   - Generated documents and their purposes
   - Test results and validation status
   - Deployment readiness assessment
   - Next steps and maintenance requirements

Context for feature development: $ARGUMENTS

## Integration Requirements

**COMPLETE WORKFLOW AUTOMATION**: This command orchestrates the entire development lifecycle:
- Issue creation and requirements structuring
- Technical design and architecture planning
- Infrastructure setup and DevOps automation
- API design and contract specifications
- Implementation with current best practices
- Performance optimization and scalability
- Testing and quality assurance
- Release management and deployment
- Validation and acceptance criteria
- Documentation and knowledge transfer

**TEMPLATE CONSISTENCY**: All generated content must follow Spec Kit templates exactly:
- Feature specifications use `spec-template.md` structure
- Technical planning uses `plan-template.md` format
- Task organization uses `tasks-template.md` patterns
- Validation workflows use `checklist-template.md` format
- Context management uses `agent-file-template.md` structure

**SCRIPT AUTOMATION**: Execute these scripts at workflow stages:
- `check-prerequisites.ps1` before each phase transition
- `create-new-feature.ps1` when starting new features
- `setup-plan.ps1` when initializing implementation plans
- `update-agent-context.ps1` after each phase completion

**EVIDENCE-BASED COMPLETION**: Maintain strict completion criteria:
- Tests pass with evidence logs
- Documentation is complete and accurate
- All acceptance criteria are validated
- Deployment artifacts are ready
- Context is synchronized across all agents