# Lab 5 – Ansible Playbook with Copilot

## Scenario
Provision a web server fleet using Ansible, leveraging Copilot to scaffold roles, inventories, and handlers. This lab shares the YAML/Ansible 20% workload segment and converts outputs from the PowerShell (Lab 2), Python (Lab 3), and YAML (Lab 4) exercises into idempotent automation.

## Learning Goals
 
- Translate existing PowerShell logic into Ansible tasks.
- Structure roles with defaults, handlers, and templates.
- Parameterize inventories for multiple environments.

## Prerequisites
 
- Python 3.10+ with `ansible-core`.
- SSH access to test nodes or containers.
- Artifacts from Labs 2–4 (for conversions).

## Exercise 1 – Role Scaffolding
 
1. Prompt Copilot: “Create an Ansible role `webserver` that installs NGINX, deploys config templates, and restarts on changes.”
2. Populate `defaults/main.yml`, `tasks/main.yml`, `handlers/main.yml`.
3. Add Jinja2 template for site config using Copilot.

## Exercise 2 – Inventory & Variables
 
1. Generate inventory files for `dev` and `prod` groups.
2. Translate PowerShell thresholds into Ansible variables with Copilot.
3. Store secrets via `ansible-vault` (document prompts used).

## Exercise 3 – Playbook Automation
 
1. Build a playbook that ties roles, variables, and handlers together.
2. Use Copilot to add idempotent checks and notify handlers only on change.
3. Convert a sample Ansible task back into PowerShell using Copilot for comparison.

## Copilot Prompt Sampler
 
- “Refine this task to use `ansible.builtin.service` with retries.”
- “Explain how to loop over disks from the YAML generated in Lab 2.”

## Validation Checklist
 
- [ ] Role passes `ansible-lint`.
- [ ] Inventory supports host-specific overrides.
- [ ] Playbook outputs summary with no errors.

## Stretch Goals
 
- Add Molecule tests scaffolded by Copilot.
- Generate documentation via `ansible-doc` and Copilot summaries.
