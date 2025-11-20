# Lab 5 – GitHub Actions CI/CD Pipeline

## Scenario

You've created PowerShell scripts (Lab 1), Python applications (Lab 2), YAML configurations (Lab 3), and Ansible playbooks (Lab 4). Now you'll use GitHub Copilot to automate everything with a complete CI/CD pipeline using GitHub Actions.

**The purpose of this lab is to learn how GitHub Copilot can help you:**
- Generate GitHub Actions workflow YAML
- Automate testing and deployment
- Integrate all previous labs into one pipeline
- Implement CI/CD best practices

## Learning Goals

- Use Copilot to create GitHub Actions workflows
- Set up multi-stage pipelines (build, test, deploy)
- Implement matrix builds for multiple environments
- Use secrets, artifacts, and caching
- Automate Ansible playbook execution

## Prerequisites

- Completed Labs 1-4 (PowerShell, Python, YAML, Ansible)
- GitHub repository with all lab code
- GitHub account with Actions enabled

## Exercise 1 – Create Basic Workflow for Scripts

**Generate a workflow to run PowerShell and Python scripts:**

1. Create `.github/workflows` folder structure in your repository root.
2. Create a new file named `run-monitoring-scripts.yaml` inside `.github/workflows`.
3. Ask Copilot Chat in **Agent mode**:

   ```text
   "Create a GitHub Actions workflow that:
   - Triggers on push to main branch and on schedule (daily at 8 AM)
   - Runs on ubuntu-latest and windows-latest
   - Checks out the repository
   - Sets up PowerShell 7
   - Runs the Script.ps1 from Lab1_PowerShell
   - Sets up Python 3.10+
   - Installs requirements from Lab2_Python
   - Runs system_report.py from Lab2_Python
   - Uploads outputs as artifacts"
   ```

4. Review the generated workflow.
5. Ask Copilot: "Add environment variables for configurable thresholds"
6. Ask Copilot: "Add job summaries to display key metrics in the Actions UI"

## Exercise 2 – Multi-Environment Matrix Build

**Create a workflow that deploys to dev, staging, and prod:**

1. Create a new file named `deploy-multi-env.yaml` inside `.github/workflows`.
2. Ask Copilot Chat:

   ```text
   "Create a GitHub Actions workflow with:
   - A matrix strategy for environments: [development, staging, production]
   - Different configurations per environment using the group_vars from Lab3_YAML
   - Conditional approval required for production
   - Uses environments in GitHub for protection rules
   - Deploys configurations using files from Lab3_YAML"
   ```

3. Review the matrix configuration.
4. Ask Copilot: "Add a manual approval step before production deployment"
5. Ask Copilot: "Add Slack or email notifications for deployment status"

## Exercise 3 – Ansible Playbook Automation

**Integrate Ansible playbooks into the pipeline:**

1. Create a new file named `run-ansible.yaml` inside `.github/workflows`.
2. Ask Copilot Chat in **Agent mode**:

   ```text
   "Create a GitHub Actions workflow that:
   - Installs Ansible
   - Validates playbook syntax with ansible-lint
   - Runs the system-monitoring.yaml playbook from Lab4_Ansible
   - Uses the inventory from Lab3_YAML
   - Runs in check mode first (dry-run)
   - Requires manual approval before actual execution
   - Captures playbook output as artifact
   - Uses GitHub secrets for SSH keys and credentials"
   ```

3. Review the Ansible integration.
4. Ask Copilot: "Add a step to run ansible-playbook with --diff flag to show changes"
5. Ask Copilot: "Add error handling to fail the workflow if any host fails"

## Exercise 4 – Complete CI/CD Pipeline

**Build an end-to-end pipeline:**

1. Create a new file named `complete-pipeline.yaml` inside `.github/workflows`.
2. Ask Copilot Chat:

   ```text
   "Create a comprehensive GitHub Actions workflow with these jobs:
   
   Job 1 - Validate:
   - Lint PowerShell scripts
   - Lint Python code with flake8
   - Validate YAML syntax
   - Run ansible-lint
   
   Job 2 - Test:
   - Run PowerShell script with test data
   - Run Python tests with pytest
   - Generate coverage report
   
   Job 3 - Build:
   - Package Python application
   - Create configuration bundle with YAML files
   - Upload artifacts
   
   Job 4 - Deploy (depends on Build):
   - Download artifacts
   - Deploy to target environment
   - Run Ansible playbooks
   - Verify deployment
   
   Use caching for dependencies and include proper job dependencies"
   ```

3. Review the complete pipeline.
4. Ask Copilot: "Add a rollback job that triggers on deployment failure"
5. Ask Copilot: "Add performance benchmarking between deployments"

## Exercise 5 – Reusable Workflows and Documentation

**Create reusable components:**

1. Create a new file named `reusable-deploy.yaml` inside `.github/workflows`.
2. Ask Copilot:

   ```text
   "Create a reusable workflow that accepts inputs:
   - environment (dev/staging/prod)
   - ansible-playbook path
   - configuration files path
   Make it callable from other workflows using workflow_call"
   ```

3. Create `GITHUB_ACTIONS_GUIDE.md` in the repository root.
4. Ask Copilot:

   ```text
   "Create documentation that explains:
   - How to use each workflow
   - Required secrets and variables setup
   - How to trigger workflows manually
   - Troubleshooting common issues
   - Best practices for workflow organization
   Include examples from the workflows created in this lab"
   ```

## Exercise 6 – Document Your CI/CD Patterns

**Create a best practices guide:**

1. Create a new file named `CICD_PATTERNS.md` inside the repository root.
2. Ask Copilot:

   ```text
   "Document best practices for GitHub Actions including:
   - Workflow organization strategies
   - Security best practices (secrets, OIDC)
   - Performance optimization (caching, parallelization)
   - Monitoring and debugging workflows
   - Integration patterns with Ansible
   Include specific examples from our labs"
   ```

3. Add your own learnings about which Copilot prompts were most effective for CI/CD.

## Copilot Prompt Sampler

- "Add concurrency control to prevent overlapping deployments"
- "Create a workflow that triggers on issue comments for ChatOps"
- "Add status badges to README for workflow status"
- "Generate a workflow that creates release notes automatically"
- "Add OIDC authentication for AWS/Azure deployments"

## Validation Checklist

- [ ] Workflows successfully run PowerShell and Python scripts
- [ ] Matrix builds deploy to multiple environments
- [ ] Ansible playbooks execute via GitHub Actions
- [ ] Artifacts are uploaded and downloadable
- [ ] Secrets are properly configured and used
- [ ] Manual approvals work for production
- [ ] Documentation explains how to use all workflows

## Stretch Goals

- Use Copilot to create self-hosted runner setup
- Generate workflow for automatic dependency updates
- Create a workflow that posts results to the Streamlit dashboard
- Build a workflow dashboard using GitHub Pages
- Implement blue-green deployment workflow

Lab 5 is complete! You now have a full CI/CD pipeline that automates all the work from Labs 1-4.

## Final Lab Summary

**What you've built:**
- **Lab 1**: PowerShell monitoring scripts
- **Lab 2**: Python data processing and Streamlit dashboard
- **Lab 3**: YAML configurations and Ansible inventory
- **Lab 4**: Ansible playbooks for automation
- **Lab 5**: GitHub Actions pipeline that runs everything automatically

**You've learned to use GitHub Copilot for:**
- Script generation across multiple languages
- Data format conversion
- Infrastructure as Code
- Configuration management
- CI/CD pipeline automation
- Documentation and best practices

Congratulations on completing the GitHub Copilot Lab for IT & DevOps!
