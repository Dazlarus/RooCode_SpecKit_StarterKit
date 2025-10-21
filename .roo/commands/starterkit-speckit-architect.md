---
description: Create technical designs, system architecture, and implementation plans using current best practices and Spec Kit automation.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate design environment. All paths must be absolute.

2. **Load current project context**:
   - Read existing spec.md, plan.md, and tasks.md from current branch
   - Understand current feature requirements and user stories
   - Analyze existing technical stack and architecture patterns
   - Review any existing data models or API contracts

3. **Execute architecture workflow**:
   - **Requirements Analysis**: Break down user requirements into technical components
   - **System Design**: Create high-level system architecture and component relationships
   - **Technology Selection**: Choose appropriate frameworks, libraries, and tools
   - **API Design**: Design RESTful APIs and data contracts (if applicable)
   - **Database Design**: Model data entities and relationships (if applicable)
   - **Security Architecture**: Design security measures and authentication flows
   - **Performance Planning**: Identify performance requirements and optimization strategies

4. **Apply Context7 MCP research**:
   - Research current best practices for chosen technologies
   - Validate architecture decisions against current documentation
   - Ensure implementation approaches use current patterns
   - Research security and performance best practices

5. **Generate technical documentation**:
   - **System Architecture**: Component diagrams and relationships
   - **API Specifications**: Endpoint definitions and data contracts
   - **Database Schema**: Entity models and relationships
   - **Security Design**: Authentication and authorization patterns
   - **Performance Strategy**: Optimization approaches and scaling plans
   - **Implementation Plan**: Detailed technical implementation steps

6. **Use template consistency**:
   - Apply `plan-template.md` structure for technical planning
   - Use `spec-template.md` for detailed specifications
   - Generate `tasks-template.md` for implementation breakdown
   - Create `checklist-template.md` for design validation

7. **Execute automation scripts**:
   - Run `setup-plan.ps1` to initialize technical planning
   - Run `update-agent-context.ps1` to sync design decisions
   - Run `check-prerequisites.ps1` to validate design readiness

8. **Report**: Output design deliverables:
   - Technical architecture and design decisions
   - API specifications and contracts
   - Database models and relationships
   - Security architecture and patterns
   - Performance optimization strategies
   - Implementation roadmap and task breakdown

Context for architecture design: $ARGUMENTS

## Integration Requirements

**CURRENT BEST PRACTICES**: Use Context7 MCP to research:
- Current framework and library best practices
- Latest API design patterns and standards
- Current security practices and patterns
- Performance optimization techniques
- Scalability and architecture patterns

**TEMPLATE CONSISTENCY**: All design documents must follow:
- `plan-template.md` for technical planning structure
- `spec-template.md` for detailed specifications
- `tasks-template.md` for implementation task organization
- `checklist-template.md` for design validation workflows

**SCRIPT AUTOMATION**: Execute these scripts at design stages:
- `check-prerequisites.ps1` before starting design work
- `setup-plan.ps1` when initializing technical planning
- `update-agent-context.ps1` after design completion
- Generate evidence logs for all design decisions

**DESIGN PRINCIPLES**: Apply current architecture principles:
- Microservices or modular architecture patterns
- RESTful API design principles
- Current security best practices
- Performance optimization strategies
- Scalability and maintainability patterns