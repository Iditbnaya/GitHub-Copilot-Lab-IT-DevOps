# Lab 6 – GitHub Actions CI/CD

## Scenario
Automate continuous integration and deployment that executes the PowerShell and Ansible assets created earlier.

## Learning Goals
 
- Prompt Copilot to design multi-stage workflows.
- Integrate matrix builds, reusable workflows, and job dependencies.
- Execute Ansible deployment from GitHub Actions securely.

## Prerequisites
 
- GitHub repository with previous lab artifacts.
- GitHub Actions runner permissions.
- Secrets: `ANSIBLE_VAULT_PASSWORD`, `SSH_PRIVATE_KEY`, etc.

## Exercise 1 – Workflow Draft
 
1. Prompt Copilot: “Generate a workflow `ci-cd.yaml` that runs PowerShell tests on Windows and Linux.”
2. Validate syntax with `act` or `workflow editor`.

## Exercise 2 – Artifact Build & Publish
 
1. Add job to package PowerShell module and upload artifacts.
2. Cache dependencies with Copilot-suggested keys.
3. Ensure YAML references from Lab 2 integrated as config inputs.

## Exercise 3 – Ansible Deployment Job
 
1. Ask Copilot to author a job that configures SSH agent, decrypts vault, and runs `ansible-playbook`.
2. Apply conditional deployment triggers (e.g., only on `main`, manual approvals).

## Exercise 4 – Notification & Observability
 
1. Generate Copilot snippet to send deployment status to Teams/Slack via webhook.
2. Store diagnostic logs as workflow artifacts.

## Copilot Prompt Sampler
 
- “Explain how this `needs:` graph enforces sequential execution.”
- “Convert this Ansible command into a composite action.”

## Validation Checklist
 
- [ ] Workflow passes `yamllint` and `act` dry run.
- [ ] Secrets referenced securely.
- [ ] Deployment logs captured.

## Stretch Goals
 
- Split workflow into reusable templates.
- Add security scans (CodeQL) scaffolded by Copilot.
