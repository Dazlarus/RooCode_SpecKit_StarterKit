---
description: Update existing research documents with current best practices, techniques, and information using Context7 MCP and comprehensive research capabilities.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate research environment. All paths must be absolute.

2. **Parse user input**: Extract research document path and specific topic (if provided):
   - Document path: Required - path to research document to update
   - Research topic: Optional - specific area to focus research on
   - Update scope: Determine if full document update or targeted section update

3. **Load and analyze existing research**:
   - Read the specified research document
   - Identify outdated information, techniques, or practices
   - Extract current frameworks, libraries, and methodologies mentioned
   - Note any specific areas requiring current information

4. **Execute research update workflow**:
   - **Context7 MCP Research**: Use resolve-library-id and get-library-docs for current documentation
   - **Current Best Practices**: Research latest techniques and patterns for mentioned technologies
   - **Framework Updates**: Check for newer versions and updated approaches
   - **Security Research**: Update security practices and vulnerability information
   - **Performance Research**: Update performance optimization techniques

5. **Generate external AI prompts** (when Context7 needs supplementation):
   - Create optimized prompts for ChatGPT, Gemini, and other AI services
   - Include specific research objectives and current context
   - Structure prompts for comprehensive, cited research
   - Provide fallback research strategies

6. **Update research document**:
   - Apply current findings to existing research structure
   - Update outdated sections with current best practices
   - Add new sections for recently developed techniques
   - Maintain original document organization and flow
   - Add citations and references for updated information

7. **Validate and sync changes**:
   - Run `update-agent-context.ps1` to sync all agent files
   - Validate updated research follows template structures
   - Generate research summary and evidence trails
   - Update related documentation if needed

8. **Report**: Output update summary:
   - Sections updated with current information
   - New techniques and practices incorporated
   - External AI prompts generated (if any)
   - Validation results and next steps
   - Evidence of script executions and research logs

Context for research update: $ARGUMENTS

## Integration Requirements

**CONTEXT7 MCP RESEARCH**: Before updating any research:
- Use resolve-library-id to identify correct library IDs
- Use get-library-docs for current documentation and patterns
- Apply current API patterns and coding standards from Context7
- Validate approaches against current library documentation

**TEMPLATE CONSISTENCY**: Ensure updated research maintains:
- Original document structure and organization
- Consistent formatting with existing content
- Proper citations for new information
- Integration with Spec Kit documentation patterns

**SCRIPT AUTOMATION**: Run these scripts at appropriate stages:
- `check-prerequisites.ps1` before starting research updates
- `update-agent-context.ps1` after completing research updates
- Generate evidence logs for all research activities

**EVIDENCE COLLECTION**: Save all research activities:
- Context7 MCP research logs and findings
- External AI prompts and responses (if used)
- Updated document sections with change tracking
- Validation reports and acceptance criteria