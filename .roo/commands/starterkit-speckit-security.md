---
description: Perform security audits and vulnerability assessments using current security best practices and comprehensive threat analysis.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate security audit environment. All paths must be absolute.

2. **Parse security scope**:
   - Components or systems to audit
   - Security requirements and compliance needs
   - Current branch context and security specifications
   - Existing security measures and configurations

3. **Execute security audit workflow**:
   - **Static Security Analysis**: Scan code for security vulnerabilities
   - **Dependency Audit**: Check for vulnerable dependencies and libraries
   - **Secrets Detection**: Identify exposed secrets and credentials
   - **Configuration Review**: Analyze security configurations and settings
   - **Threat Modeling**: Identify potential security threats and attack vectors

4. **Apply current security practices**:
   - Research current security vulnerabilities for used technologies
   - Apply current secure coding practices and patterns
   - Validate security measures against current threat landscape
   - Generate security recommendations using current best practices

5. **Template-driven security**:
   - Use checklist-template.md for systematic security audit workflows
   - Follow tasks-template.md patterns for security improvements
   - Document security findings using established template structures
   - Generate security recommendations and remediation plans

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before security assessments
   - Run `update-agent-context.ps1` after security improvements
   - Validate security environment and tool availability
   - Generate comprehensive security reports and evidence

7. **Generate security deliverables**:
   - **Vulnerability Reports**: Identified security issues and severity levels
   - **Security Recommendations**: Mitigation strategies and improvements
   - **Compliance Assessment**: Security standard compliance evaluation
   - **Risk Analysis**: Threat modeling and risk assessment results
   - **Evidence Logs**: Security audit evidence and validation findings

8. **Report**: Output security assessment summary:
   - Security vulnerabilities found and prioritized
   - Risk assessment and impact analysis
   - Remediation recommendations and implementation steps
   - Compliance status and requirements
   - Next steps for security improvements

Context for security audit: $ARGUMENTS

## Integration Requirements

**CURRENT SECURITY RESEARCH**: Before security assessments:
- Research current vulnerabilities for used technologies
- Apply current security best practices and patterns
- Validate security measures against current threat landscape
- Generate security recommendations using current methodologies

**COMPREHENSIVE AUDIT**: Perform thorough security analysis:
- Static code analysis for security vulnerabilities
- Dependency vulnerability scanning and assessment
- Secrets and credentials detection and analysis
- Security configuration review and validation
- Threat modeling and attack vector identification

**SCRIPT AUTOMATION**: Use security automation scripts:
- `check-prerequisites.ps1` before security audit activities
- `update-agent-context.ps1` after security improvements
- Generate evidence logs for all security activities
- Validate security fixes against acceptance criteria

**SECURITY BEST PRACTICES**: Apply current security methodologies:
- Current vulnerability assessment and mitigation techniques
- Secure coding practices and security control implementation
- Threat modeling and risk assessment frameworks
- Compliance requirement validation and reporting
- Evidence-based security validation and improvement tracking