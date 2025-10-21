---
description: Deploy applications with DevOps automation, infrastructure provisioning, and reliable software delivery workflows.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `.specify/scripts/powershell/check-prerequisites.ps1 -Json` from repo root and validate deployment environment. All paths must be absolute.

2. **Parse deployment requirements**:
   - Target environment (development, staging, production)
   - Deployment strategy and automation requirements
   - Infrastructure requirements and provisioning needs
   - Monitoring and logging configuration

3. **Execute deployment workflow**:
   - **CI/CD Pipeline**: Design and maintain automated build and deployment pipelines
   - **Infrastructure Management**: Provision and manage cloud resources and environments
   - **Configuration Management**: Maintain consistent environments across development stages
   - **Monitoring Setup**: Implement logging, monitoring, and alerting systems
   - **Security Integration**: Ensure secure deployment practices and compliance

4. **Apply DevOps best practices**:
   - Automate deployment pipelines with current CI/CD practices
   - Implement infrastructure-as-code and automation patterns
   - Set up comprehensive monitoring and alerting systems
   - Ensure security compliance and secure deployment practices

5. **Template-driven deployment**:
   - Use checklist-template.md for deployment validation workflows
   - Follow tasks-template.md patterns for deployment automation
   - Generate deployment documentation using established template structures
   - Apply plan-template.md format for technical deployment planning

6. **Execute automation scripts**:
   - Run `check-prerequisites.ps1` before deployment operations
   - Run `update-agent-context.ps1` after infrastructure changes
   - Validate deployment environments and configurations
   - Generate deployment reports and operational metrics

7. **Generate deployment deliverables**:
   - **Deployment Pipelines**: Automated build and deployment scripts
   - **Infrastructure Code**: Infrastructure-as-code configurations
   - **Monitoring Dashboards**: Logging, monitoring, and alerting rules
   - **Security Policies**: Security policies and compliance documentation
   - **Operational Runbooks**: Deployment and maintenance procedures

8. **Report**: Output deployment summary:
   - Deployment status and environment information
   - Infrastructure provisioning results
   - Monitoring and alerting configuration status
   - Security compliance and validation results
   - Operational readiness assessment

Context for deployment: $ARGUMENTS

## Integration Requirements

**COMPREHENSIVE DEVOPS AUTOMATION**: Deploy complete application stacks:
- CI/CD pipeline setup and automation
- Infrastructure provisioning and management
- Configuration management across environments
- Monitoring, logging, and alerting implementation
- Security policy enforcement and compliance validation

**CURRENT DEVOPS PRACTICES**: Use Context7 MCP for current methodologies:
- Current CI/CD tools and automation patterns
- Infrastructure-as-code and provisioning best practices
- Monitoring and observability current standards
- Security automation and compliance frameworks
- Deployment strategy and rollback procedures

**SCRIPT AUTOMATION**: Use deployment automation scripts:
- `check-prerequisites.ps1` before deployment operations
- `update-agent-context.ps1` after infrastructure changes
- Generate deployment evidence and operational logs
- Validate deployment success and environment health

**DEPLOYMENT BEST PRACTICES**: Apply current deployment methodologies:
- Automated deployment pipeline implementation
- Infrastructure-as-code configuration management
- Comprehensive monitoring and alerting setup
- Security automation and compliance validation
- Rollback strategy and disaster recovery planning