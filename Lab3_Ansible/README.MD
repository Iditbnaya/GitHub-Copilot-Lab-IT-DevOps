# Lab – Using Ansible with GitHub Copilot

## 1. Overview

In this lab you will use **GitHub Copilot** to build and improve an **Ansible-based automation** solution that deploys and configures a simple web server on a Linux target.

You will:

- Use Copilot to generate and refactor **Ansible playbooks and roles**
- Create a **simple web server configuration** with Ansible
- Use **variables, templates, handlers, and tags**
- Test the playbook locally using **WSL** (Windows Subsystem for Linux)

---

## 2. Scenario

Your team manages several Linux servers using Ansible.  
You want to:

1. Standardize the installation and configuration of a web server (Nginx or Apache).
2. Store the automation in GitHub.
3. Use GitHub Copilot to help you create and improve the Ansible playbooks and roles needed to deploy and manage the web servers.

---

## 3. Prerequisites

- Basic familiarity with:
  - Git and GitHub
  - Ansible concepts (inventory, playbook, roles, tasks)
- GitHub Copilot installed and enabled in your editor (VS Code / JetBrains).
- Python and Ansible installed on your machine (for local testing), for example:

  ```bash
  pip install ansible

- Ansible cannot run directly on Windows, in order to run the playbooks WSL is required - see Step 3 for details.

## 4. Lab Structure

```text
Lab3_Ansible/
├── ansible.cfg - Ansible configuration file - alredy in place
├── inventory - Ansible inventory file - (You'll create this manually)
├── site.yml - Main Ansible playbook - (You'll create this with Copilot)
├── roles/ - Ansible roles directory - (You'll create this with Copilot)
│   └── webserver/
│       ├── tasks/
│       │   └── main.yml - Tasks for installing and configuring the web server
│       ├── handlers/
│       │   └── main.yml - Handlers for managing the web server service
│       ├── templates/
│       │   └── index.html.j2 - Jinja2 template for the web server's index page
│       └── vars/
│           └── main.yml - Variables for the web server role
└── .github/
    └── workflows/
        └── ansible-deploy.yml - GitHub Actions workflow file - (You'll create this with Copilot in the next lab)
```

## Step 1  - Create inventory and Main Playbook with Copilot

1. Create a Local Inventory under Lab3_Ansible folder

- Create a new  file named inventory and type the following manually

```text
[web]
localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3

```

- Ask Copilot in Chat:

```text
Explain what this Ansible inventory means and how the [web] group will be used in a playbook.

```

2. Generate the Main Playbook with Copilot

-Create a file site.yml.
-Type the following manually

```text

---
- name: Configure web servers
  hosts: web
  become: true
  
  roles:
    - webserver

```

## Step 2 - Create the webserver Role with Copilot

1. Create the folder structure:

```pwsh
@('tasks','handlers','templates','vars') | ForEach-Object { New-Item -ItemType Directory -Path "roles/webserver/$_" -Force }
```

2. Create a main.yml file under roles/webserver/tasks

- Open roles/webserver/tasks/main.yml.
- Type the following manually

``` text
---
# Tasks for webserver role

- name: Install web server package

```

Use Copilot to complete the rest of the tasks inline or in Chat.
Suggested prompt (in Chat):

```text
Create an Ansible tasks file that:
Installs the nginx package on Debian/Ubuntu
Creates a web root directory if needed
Deploys a Jinja2 template to /var/www/html/index.html
Notifies a handler called restart webserver when the template changes.
Use handlers and variables where appropriate.
```

- You should get something like:

```yaml
# Tasks for webserver role

- name: Install web server package
  ansible.builtin.apt:
    name: "{{ webserver_package }}"
    state: present
    update_cache: yes
  become: yes

- name: Ensure web root directory exists
  ansible.builtin.file:
    path: "{{ web_root }}"
    state: directory
    mode: "0755"
    owner: "{{ webserver_user }}"
    group: "{{ webserver_user }}"
  become: yes

- name: Deploy index.html template
  ansible.builtin.template:
    src: index.html.j2
    dest: "{{ web_root }}/index.html"
    mode: "0644"
    owner: "{{ webserver_user }}"
    group: "{{ webserver_user }}"
  become: yes
  notify: restart nginx

- name: Ensure nginx service is started and enabled
  ansible.builtin.service:
    name: "{{ webserver_service }}"
    state: started
    enabled: yes
  become: yes

```

3. handlers/main.yml
Create a main.yml file under roles/webserver/handlers
paste this text:

```text
# Handlers for webserver role

- name: restart nginx
  service:
    name: nginx
    state: restarted
  become: yes
```

4. vars/main.yml

Create a main.yml file under roles/webserver/vars
paste this text;

```text
---
# Variables for webserver role

webserver_package: nginx
webserver_service: nginx
web_root: /var/www/html
webserver_port: 80
webserver_user: www-data

# Custom welcome page content
welcome_title: "Welcome to Ansible Managed Server"
welcome_message: "This server is managed by Ansible automation"

```

5. Create an index.html.j2 file under roles/webserver/templates/

Ask Copilot:

```text
Create a simple HTML template that shows the hostname and a custom message using Ansible facts or variables.
```

Example:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome to {{ inventory_hostname }}</h1>
    <p>{{ welcome_message }}</p>
</body>
</html>
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome to {{ inventory_hostname }}</h1>
    <p>Deployed by Ansible with GitHub Copilot.</p>
</body>
</html>
```

---

## Step 3 – Test the Playbook Locally

**⚠️ Important for Windows Users:**  
Ansible doesn't run natively on Windows. You must use WSL.

### WSL Setup and Execution

1. **Install WSL** (if not already done) - PowerShell as Administrator:
   ```powershell
   wsl --install
   ```
   *Restart your computer if prompted*

2. **Open WSL terminal**:
   ```powershell
   wsl
   ```
3. **Install Ansible in WSL**:

   ```bash
   sudo apt update
   sudo apt install ansible -y
   ```

4. **Navigate to the lab folder**:

   ```bash
   cd /mnt/.../GitHub-Copilot-Lab-IT-DevOps/Lab3_Ansible
   ```

   *Note: Windows C: drive is mounted at `/mnt/c` in WSL*

5. **Test the inventory** (verify connectivity):

   ```bash
   ansible web -i inventory -m ping
   ```

      **Expected output:**

   ```text
      localhost | SUCCESS => {
       "changed": false,
       "ping": "pong"
   }
   ```

6. **Run the playbook** (note the `-i inventory` flag):

   ```bash
   ansible-playbook -i inventory site.yml
   ```
  
   **Why `-i inventory` is needed:**  
   WSL sees Windows files as "world writable" (777 permissions). Ansible ignores `ansible.cfg` in world-writable directories for security reasons. Solution: Always specify inventory explicitly with `-i inventory`.

7. **Expected successful output:**

```text
   PLAY [Configure web servers] ***********************************************
   
   TASK [Gathering Facts] *****************************************************
   ok: [localhost]
   
   TASK [webserver : Install web server package] *****************************
   changed: [localhost]
   
   TASK [webserver : Ensure web root directory exists] ***********************
   changed: [localhost]
   
   TASK [webserver : Deploy index.html template] *****************************
   changed: [localhost]
   
   TASK [webserver : Ensure nginx service is started and enabled] ************
   ok: [localhost]
   
   RUNNING HANDLER [webserver : restart nginx] *******************************
   changed: [localhost]
   
   PLAY RECAP *****************************************************************
   localhost                  : ok=6    changed=4

   ```

8. **Verify the results**

 ```bash
# Check nginx is running:
sudo systemctl status nginx
# View the deployed HTML file
cat /var/www/html/index.html
# Test the web server
curl http://localhost

```

### Troubleshooting

**Problem: "No hosts matched"**  
Solution: Use `-i inventory` flag: `ansible-playbook -i inventory site.yml`

**Problem: "Permission denied"**  
Solution: Ensure `become: true` is in site.yml or use `--ask-become-pass`

**Problem: "Ansible command not found"**  
Solution: You're in PowerShell, not WSL. Type `wsl` first.

**Problem: Tab character errors in YAML**  
Solution: Ensure VS Code uses spaces, not tabs (Settings → Editor: Insert Spaces = true)

If something else fails, use Copilot Chat:

```text
Here is the error message from Ansible. Help me troubleshoot and fix the playbook.
```

## Step 4 – Refactor with Copilot (Tags, Idempotence, Variables)

Ask Copilot:

```text
Refactor this role to:
Add a tag called web to all tasks
Ensure it is fully idempotent
Move hard-coded values into variables where appropriate.
```


Review the diffs and discuss:

1. Did Copilot add tags consistently?
2. Did it change anything you disagree with?

- To stop the nginx web server that Ansible installed, you need to run the command in WSL

```bash
sudo systemctl stop nginx
```

- To start the nginx web server that Ansible installed, you need to run the command in WSL

```bash
sudo systemctl start nginx
```

Lab 3 is complete! Proceed to Lab 4 - GitHub Actions CI/CD with Copilot.