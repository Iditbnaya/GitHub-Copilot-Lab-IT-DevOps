## 🏛️GitHub Copilot Lab

## Overview

This series trains IT administrators and DevOps practitioners to leverage GitHub Copilot across PowerShell, Python, YAML, Ansible, GitHub Actions, and language-to-language conversions. Each lab builds on prior work so participants finish with an end-to-end infrastructure automation pipeline while keeping roughly of hands-on time in PowerShell,n Python, and in YAML/Ansible.
Participants will be guided to install the GitHub Copilot VS Code extension, follow the [Setup.md](Setup.md) for first-time setup, and then use GitHub Copilot to create and integrate PowerShell scripts, Python services, YAML configurations, Ansible playbooks, and GitHub Actions workflows.

## Prerequisites

- Active GitHub Copilot subscription associated with your GitHub account.
- Latest Visual Studio Code release installed from [code.visualstudio.com](https://code.visualstudio.com/Download?ref_product=copilot&ref_type=engagement&ref_style=text).
- Successful sign-in to GitHub within VS Code; review the [authentication troubleshooting guide](https://docs.github.com/en/enterprise-cloud@latest/copilot/troubleshooting-github-copilot/troubleshooting-issues-with-github-copilot-chat#troubleshooting-authentication-issues-in-your-editor) if needed.
- New to GitHub, VS Code, or Copilot? Follow the step-by-step [Setup.md](setup.md) before Lab 1.

Installations required for local runtimes:

1. [PowerShell 7+](https://learn.microsoft.com/powershell/scripting/install/installing-powershell)
2. [Python 3.10+](https://www.python.org/downloads/)
3. [Ansible Core](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-core-with-pip) via `pip install ansible-core`
4. [Docker Desktop](https://www.docker.com/products/docker-desktop/)
5. [YAML VSCode extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) by Red Hat

## Lab Roadmap

1. [Lab 1 – PowerShell Automation with Copilot](Lab1_PowerShell/README.md)
2. [Lab 2 – Python Automation with Copilot](Lab2_Python/README.md)
3. [Lab 3 – YAML & Config Generation](Lab2_YAML/README.md)
4. [Lab 4 – Ansible Playbook with Copilot](Lab3_Ansible/README.md)
5. [Lab 5 – GitHub Actions CI/CD](Lab4_GitHub_Actions/README.md)
6. [Lab 6 – Copilot Agents](Lab5_Security.md)

## Environment Prerequisites

- GitHub Copilot enabled in Visual Studio Code.
- VS Code extensions: PowerShell, YAML, Ansible, GitHub Actions, GitHub Copilot Chat.
- Local PowerShell 7+, Python 3.10+ with `ansible-core`, Docker Desktop (for runner/emulator targets).
- Sample infrastructure target (VM, container, or emulator) with SSH access.

## Assessment & Deliverables

- PowerShell scripting showing Copilot-assisted iteration.
- YAML configuration pack (GitHub Actions, converted configs).
- Ansible collection with roles, handlers, and inventories.
- GitHub Actions workflow executing Ansible deployment.
- Security audit report and Best Practices documentation.

## Copilot Engagement Playbook

1. Start with intent prompts (goal, constraints, environment).
2. Request code explanations before modifications.
3. Iterate via inline edits, then validate with lint/test tools.
4. Use Copilot Chat to translate between PowerShell ⇄ YAML ⇄ Ansible.


## Repository Layout

```text
├── docs
├── Lab1_PowerShell
├── Lab2_Python
├── Lab2_YAML
├── Lab3_Ansible
├── Lab4_GitHub_Actions
└── Lab5_Security
├── Readme.md
└── Setup.md

