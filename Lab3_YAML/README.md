# Lab 4 – YAML & Config Generation

## Scenario
You will transform structured data and infrastructure definitions into production-ready YAML configurations.


## Learning Goals
 
- Drive Copilot to convert formats (JSON ⇄ YAML ⇄ PowerShell).
- Build Kubernetes deployment manifests with validation.
- Create reusable configuration templates for future automation.

## Prerequisites
 
- Results from Lab 2 – PowerShell Automation (JSON logs).
- `yaml` VS Code extension (install from VS Code Extensions marketplace) - https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml

## Exercise 1 – JSON to YAML Translation
 
1. Paste Lab 1 JSON into a new buffer.
2. Prompt Copilot: “Convert this JSON disk report into clean YAML with anchor examples.”
3. Verify indentation with `yamllint`.

## Exercise 2 – Kubernetes Deployment
 
1. Specify requirements to Copilot (image, replicas, probes, resources).
2. Generate `Deployment` and `Service` manifests.
3. Validate with `kubectl apply --dry-run=client -f`.

## Exercise 3 – GitHub Actions Config
 
1. Ask Copilot to draft a reusable workflow matrix for Windows and Linux PowerShell tests.
2. Inject secrets and environment variables using `env` and `secrets` conventions.
3. Reference Lab 4 deliverables for continuity.

## Copilot Prompt Sampler
 
- “Transform this PowerShell parameter set into a Kubernetes ConfigMap.”
- “Explain each section of the generated workflow and add inline comments.”

## Validation Checklist
 
- [ ] YAML passes linting.
- [ ] Deployment supports rolling updates with health checks.
- [ ] Workflow reusable via `workflow_call`.

## Stretch Goals
 
- Use Copilot to suggest Helm chart structure.
- Convert the Kubernetes manifest back into PowerShell data structures.
