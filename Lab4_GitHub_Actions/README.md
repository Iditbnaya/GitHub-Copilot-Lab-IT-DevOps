# Lab 5 – GitHub Actions CI/CD Pipeline

## Scenario
Create a GitHub Actions Workflow with Copilot using the Ansible playbook from Lab 3 to automate web server deployment. You will learn how to leverage Copilot to generate CI/CD YAML configurations, integrate Ansible execution, and manage secrets.
## Learning Goals
- Use Copilot to generate GitHub Actions workflow YAML.
- Integrate Ansible playbook execution into the CI/CD pipeline.
- Manage secrets and environment variables in GitHub Actions.
- Test and validate the CI/CD pipeline using Copilot assistance.

In a real environment, you would:
Use SSH to connect to a remote host, or
Use a self-hosted runner inside your infra.

For simplicity in this lab, we will just run Ansible on the GitHub runner and validate that it executes successfully (e.g., against localhost or as a “syntax-only” check).

## Prerequisites
- Completed Lab 3 – Ansible Playbook with Copilot.
- GitHub repository with Ansible playbook from Lab 3.
- VS Code with GitHub Actions & Copilot extensions.

## Exercise 1 – Generate GitHub Actions Workflow with Copilot

1. Open VS Code and navigate to the `Lab4_GitHub_Actions` folder.
2. Create a new file named `ansible-deploy.yml` under `.github/workflows/`.
3. Start typing the following comment to prompt Copilot:
```
# Create a GitHub Actions workflow that triggers on push to main branch and runs the Ansible playbook to deploy the web server.
```
4. Accept Copilot's suggestion to scaffold the workflow.

5. make sure the workflow includes steps for checking out the code, setting up Python, installing
Ansible, and running the playbook.

## Exercise 2 – Integrate Ansible Execution

1. In the `ansible-deploy.yml` file, add a step to install Ansible using pip.

2. Add a step to run the Ansible playbook created in Lab 3.
   
3. Use Copilot Chat to help you with the syntax if needed: 

```
yaml
- name: Run Ansible playbook
  working-directory: Lab3_Ansible
  run: |
    ansible-playbook -i inventory site.yml
```

## Exercise 3 – Manage Secrets and Environment Variables (Optional)

This exercise is optional if you don't have secrets configured in your GitHub repository.

If you need to use secrets in the future:

```yaml
- name: Set up secrets
  run: |
    echo "MY_SECRET=${{ secrets.MY_SECRET }}" >> $GITHUB_ENV   
```

1. Use Copilot to help you add steps for managing secrets in the workflow.
2. Ensure that sensitive information like SSH keys or passwords are stored as GitHub Secrets and referenced in the workflow.

**Note:** For this lab, you can skip this exercise if you don't have secrets configured.

## Exercise 4 – Test and Validate the CI/CD Pipeline

1. Commit and push the `ansible-deploy.yml` file to the main branch of your GitHub repository.
2. Navigate to the Actions tab in your GitHub repository to monitor the workflow execution.
3. Use Copilot Chat to help troubleshoot any issues that arise during the workflow execution.
4. Verify that the web server is deployed successfully on the target machine.

## Conclusion

In this lab, you successfully created a GitHub Actions CI/CD pipeline using GitHub Copilot. You learned how to generate YAML configurations, integrate Ansible playbook execution, manage secrets, and validate the pipeline. This knowledge will help you automate deployments and streamline your development workflows using Copilot.
