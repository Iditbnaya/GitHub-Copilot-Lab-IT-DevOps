# GitHub Copilot Lab

## Overview

This series trains IT administrators and DevOps practitioners to leverage GitHub Copilot across PowerShell, Python, YAML, Ansible, GitHub Actions, and language-to-language conversions. Each lab builds on prior work so participants finish with an end-to-end infrastructure automation pipeline while keeping roughly 60% of hands-on time in PowerShell, 20% in Python, and 20% in YAML/Ansible. Lab 1 introduces Copilot capabilities before the language-specific exercises.

Participants will be guided to install the GitHub Copilot VS Code extension, follow a CodeTour to learn how to interact with GitHub Copilot, and then use GitHub Copilot to create and integrate PowerShell scripts, Python services, YAML configurations, Ansible playbooks, and GitHub Actions workflows.

## Prerequisites

- Active GitHub Copilot subscription associated with your GitHub account.
- Latest Visual Studio Code release installed from [code.visualstudio.com](https://code.visualstudio.com/Download?ref_product=copilot&ref_type=engagement&ref_style=text).
- Successful sign-in to GitHub within VS Code; review the [authentication troubleshooting guide](https://docs.github.com/en/enterprise-cloud@latest/copilot/troubleshooting-github-copilot/troubleshooting-issues-with-github-copilot-chat#troubleshooting-authentication-issues-in-your-editor) if needed.
- Optional: CodeTour extension to follow guided walkthroughs.

Filename | Description
--- | ---
[1. setup.md](</.instructions/1. setup.md>) | Instructions for installing the GitHub Copilot VS Code extension and joining the GitHub Copilot trial.
[2. getting started.md](</.instructions/2. getting started.md>) | Instructions for getting started with GitHub Copilot.

## Lab Roadmap

1. [Lab 1 – Getting Started with GitHub Copilot](Lab1_GettingStarted/README.md)
2. [Lab 2 – PowerShell Automation with Copilot](Lab1_PowerShell/README.md)
3. [Lab 3 – Python Automation with Copilot](Lab2_Python/README.md)
4. [Lab 4 – YAML & Config Generation](Lab2_YAML/README.md)
5. [Lab 5 – Ansible Playbook with Copilot](Lab3_Ansible/README.md)
6. [Lab 6 – GitHub Actions CI/CD](Lab4_GitHub_Actions/README.md)
7. [Lab 7 – Copilot Agents](Lab5_Agents/README.md)

## Environment Prerequisites

- GitHub Copilot enabled in Visual Studio Code.
- VS Code extensions: PowerShell, YAML, Ansible, GitHub Actions, GitHub Copilot Chat.
- Local PowerShell 7+, Python 3.10+ with `ansible-core`, Docker Desktop (for runner/emulator targets).
- Sample infrastructure target (VM, container, or emulator) with SSH access.

## Suggested Schedule

Day | Focus
--- | ---
1 | Lab 1 – Getting Started with GitHub Copilot
2 | Lab 2 – PowerShell automation fundamentals
3 | Lab 3 – Python ingestion and enrichment
4 | Lab 4 – YAML translation & validation
5 | Lab 5 – Ansible roles and inventories
6 | Lab 6 – GitHub Actions CI/CD pipeline
7 | Lab 7 – Copilot Agents and orchestration review

## Assessment & Deliverables

- PowerShell module and transcript showing Copilot-assisted iteration.
- YAML configuration pack (Kubernetes, GitHub Actions, converted configs).
- Ansible collection with roles, handlers, and inventories.
- GitHub Actions workflow executing Ansible deployment.
- Agent conversation log and exported CI/CD plan.

## Copilot Engagement Playbook

1. Start with intent prompts (goal, constraints, environment).
2. Request code explanations before modifications.
3. Iterate via inline edits, then validate with lint/test tools.
4. Use Copilot Chat to translate between PowerShell ⇄ YAML ⇄ Ansible.
5. Capture prompts/responses for retrospective analysis.

## Repository Layout

```text
├── Lab1_GettingStarted
├── Lab1_PowerShell
├── Lab2_Python
├── Lab2_YAML
├── Lab3_Ansible
├── Lab4_GitHub_Actions
└── Lab5_Agents
```

## Completion Criteria

- All lab checklists satisfied.
- Automated pipeline demonstrated end-to-end.
- Lessons learned documented for each language workflow.
