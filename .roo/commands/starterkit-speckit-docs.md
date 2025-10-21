---
description: Generate comprehensive documentation using Spec Kit templates and automation for consistent technical documentation.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate documentation environment. All paths must be absolute.

2. **Parse documentation scope**:
   - Documentation types needed (API, user guides, technical docs)
   - Current project context and existing documentation
   - Target audience and documentation requirements
   - Integration points and cross-references needed

3. **Execute documentation workflow**:
   - **Content Extraction**: Automatically extract content from existing specs, plans, and code
   - **Template Application**: Use .specify/templates/ for consistent structure
   - **Cross-Reference Generation**: Create automatic links between related documents
   - **Multi-Format Output**: Generate documentation in multiple formats (md, txt, html)

4. **Apply documentation best practices**:
   - Generate feature documentation from spec-template.md with actual content
   - Create validation checklists using checklist-template.md for review processes
   - Update agent context files using agent-file-template.md structure
   - Maintain consistent formatting across all documentation types

5. **Template-driven generation**:
   - Generate feature documentation from spec-template.md with actual content
   - Create validation checklists using checklist-template.md for review processes
   - Update agent context files using agent-file-template.md structure
   - Maintain consistent formatting across all documentation types

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before documentation generation
   - Run `update-agent-context.ps1` after documentation updates
   - Validate documentation completeness and accuracy
   - Generate documentation indexes and cross-references automatically

7. **Generate documentation deliverables**:
   - **Feature Documentation**: Comprehensive guides for each feature
   - **API Documentation**: Auto-generated API references and examples
   - **Technical Documentation**: Architecture and implementation guides
   - **User Guides**: End-user documentation and tutorials
   - **Cross-References**: Automatic links between related documents

8. **Report**: Output documentation summary:
   - Generated documentation locations and purposes
   - Cross-references and navigation structure
   - Validation results and completeness assessment
   - Next steps for documentation maintenance

Context for documentation generation: $ARGUMENTS

## Integration Requirements

**COMPREHENSIVE DOCUMENTATION AUTOMATION**: Generate complete documentation suite:
- Feature documentation extracted from specifications and code
- API documentation generated from endpoint definitions
- Technical documentation derived from architecture decisions
- User guides created from acceptance criteria and workflows
- Cross-references and navigation automatically generated

**TEMPLATE CONSISTENCY**: Use Spec Kit documentation templates:
- `spec-template.md` for feature documentation structure
- `checklist-template.md` for validation and review documentation
- `agent-file-template.md` for context file documentation
- `plan-template.md` for technical documentation structure

**CONTENT EXTRACTION**: Automatically extract documentation content:
- Content from existing specs, plans, and implementation
- API documentation from code comments and specifications
- Architecture documentation from design decisions
- User guidance from acceptance criteria and workflows
- Cross-references from document relationships and dependencies

**SCRIPT AUTOMATION**: Use documentation automation scripts:
- `check-prerequisites.ps1` before documentation generation
- `update-agent-context.ps1` after documentation updates
- Generate documentation indexes and navigation automatically
- Validate documentation completeness and consistency