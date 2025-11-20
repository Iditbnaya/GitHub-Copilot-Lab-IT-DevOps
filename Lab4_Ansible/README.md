# Lab 4 – Ansible Automation with Copilot

## Scenario

You now have YAML configuration files and Ansible inventory from Lab 3. In this lab, you'll use GitHub Copilot to create Ansible playbooks that automate system monitoring and configuration management tasks.

**The purpose of this lab is to learn how GitHub Copilot can help you:**
- Generate Ansible playbooks and tasks
- Create reusable Ansible roles
- Automate infrastructure configuration
- Use variables and templates in Ansible

## Learning Goals

- Use Copilot to generate Ansible playbook syntax
- Create tasks that use inventory and group_vars from Lab 3
- Build modular Ansible roles
- Integrate monitoring configurations from previous labs

## Prerequisites

- Completed Lab 3 (YAML) with inventory.yaml and group_vars files
- Ansible installed (optional for validation): `pip install ansible ansible-lint`
- VS Code with Ansible extension (optional): `redhat.ansible`

## Exercise 1 – Create System Monitoring Playbook

**Use Copilot to generate an Ansible playbook:**

1. Open Copilot Chat (Ctrl+Shift+I) and add both Lab3_YAML and Lab4_Ansible folders to context.
2. Ask Copilot in **Agent mode**:

   ```text
   "Create an Ansible playbook under Lab4_Ansible folder that:
   - Uses the inventory from ../Lab3_YAML/inventory.yaml
   - Targets all host groups (development, staging, production)
   - Gathers system facts (disk space, memory, CPU)
   - Creates a reports directory
   - Saves system information to JSON files
   - Uses variables from group_vars for thresholds"
   ```

3. Review the generated playbook.
4. Ask Copilot: "Add comments explaining each task and what it does"
5. Ask Copilot: "Add error handling with failed_when and block/rescue"

## Exercise 2 – Create Configuration Management Tasks

**Generate tasks to deploy monitoring configurations:**

1. Create a new file named `deploy-config.yaml` inside the `Lab4_Ansible` folder.
2. Ask Copilot Chat in Agent mode:

   ```text
   "Create an Ansible playbook that:
   - Copies the app_config.yaml from Lab3_YAML to target servers
   - Creates monitoring directories (/var/log/monitoring, /etc/monitoring)
   - Sets appropriate permissions
   - Uses templates to customize config per environment
   - Validates the configuration file syntax"
   ```

3. Create a `templates` folder inside `Lab4_Ansible`.
4. Add  Lab4_Ansible folders to context Ask Copilot:

   ```text
   "Create a Jinja2 template file named monitoring.conf.j2 that uses variables from group_vars to set:
   - Environment-specific thresholds
   - Log levels
   - Alert recipients
   - Include Ansible variables like {{ ansible_hostname }} and {{ inventory_hostname }}"
   ```

5. Review and test the template syntax.

## Exercise 3 – Create Ansible Role

**Build a reusable Ansible role:**

1. Ask Copilot Chat in **Agent mode**:

   ```text
   "Create an Ansible role structure inside Lab4_Ansible/roles/system_monitoring with:
   - tasks/main.yaml for monitoring tasks
   - handlers/main.yaml for service restarts
   - templates/ for config files
   - vars/main.yaml for default variables
   - defaults/main.yaml for overridable defaults
   Include README.md explaining the role"
   ```

2. Review the generated role structure.
3. Ask Copilot to populate the tasks:

   ```text
   "In the system_monitoring role tasks/main.yaml, create tasks that:
   - Install required packages (python3, psutil)
   - Copy monitoring scripts from Lab2_Python
   - Set up cron jobs for scheduled monitoring
   - Configure log rotation"
   ```

4. Ask Copilot: "Create a playbook that uses this role with different variables for each environment"

## Exercise 4 – Validation and Testing

**Use Copilot to add validation:**

1. Create a new file named `validate-playbook.yaml` inside the `Lab4_Ansible` folder.
2. Ask Copilot:

   ```text
   "Create an Ansible playbook that validates:
   - All required files exist on target servers
   - Services are running
   - Configuration files are syntactically valid
   - Monitoring is producing expected outputs
   Use assert and stat modules"
   ```

3. Ask Copilot: "Add a pre-task check that verifies the inventory is reachable"
4. If ansible-lint is installed, run: `ansible-lint system-monitoring.yaml`
5. Ask Copilot to fix any linting issues reported.

## Exercise 5 – Document Your Ansible Patterns

**Create a best practices guide:**

1. Create a new file named `ANSIBLE_PATTERNS.md` inside the `Lab4_Ansible` folder.
2. Ask Copilot Chat:

   ```text
   "Create a markdown document that explains:
   - Best practices for Ansible playbook structure
   - How to use inventory and group_vars effectively
   - When to use roles vs. playbooks
   - Common Ansible modules and their use cases
   - Error handling patterns
   Include examples from the playbooks created in this lab"
   ```

3. Add your own observations about which Copilot prompts worked best for Ansible.

## Copilot Prompt Sampler

- "Convert this shell script to an Ansible task"
- "Add idempotency checks to ensure tasks only run when needed"
- "Create a handler that restarts a service only when config changes"
- "Generate a dynamic inventory script using Python"
- "Add tags to tasks for selective execution"

## Validation Checklist

- [ ] Playbooks use the inventory.yaml from Lab 3
- [ ] group_vars are properly referenced in playbooks
- [ ] Ansible role structure follows best practices
- [ ] Templates use Jinja2 syntax correctly
- [ ] Playbooks include error handling and validation
- [ ] ANSIBLE_PATTERNS.md documents key learnings

## Stretch Goals

- Use Copilot to create a dynamic inventory script that pulls from a cloud provider
- Generate an Ansible vault example for encrypting sensitive variables
- Create a playbook that integrates with the Streamlit dashboard from Lab 2 Python
- Build a pre-commit hook that runs ansible-lint automatically

Lab 4 is complete! The playbooks you created will be automated via GitHub Actions in Lab 5.
