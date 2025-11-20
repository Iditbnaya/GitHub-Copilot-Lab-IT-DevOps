# Lab 3 – Python Automation with Copilot

## Scenario

In the previous lab, you worked with a PowerShell script that:

- Collected system information (disks, services, event logs)
- Generated multiple CSV reports per computer
- Built a summary CSV for all machines

In this lab, you will use GitHub Copilot to:

- Generate an equivalent Python script
- Improve the Python version step by step
- Build a simple web dashboard using Streamlit to visualize system data

**The purpose of this lab is to learn how GitHub Copilot can help you:**

- Translate code between languages
- Generate Python scripts and functions
- Add features and improve code quality
- Build web interfaces quickly

## Learning Goals

- Use Copilot to translate PowerShell logic to Python
- Prompt Copilot to add error handling and logging in Python
- Generate data visualization and web UI code with Copilot
- Leverage Copilot Chat for code explanations and improvements

## Prerequisites

- Python 3.10+ installed
- VS Code with Python & Copilot extensions
- Completed Lab 1 (PowerShell) and have `Script.ps1` script

## Exercise 1 – Convert PowerShell to Python

**Where to create your Python script:**

- Create a new file named `system_report.py` inside the `Lab2_Python` folder.

**Use Copilot Chat to translate:****

1. Open your `Script.ps1` file in VS Code.
2. Select all the PowerShell code (Ctrl+A).
3. Open Copilot Chat (Ctrl+Shift+I) in **Agent mode** and ask:

   ```text
   "Convert this PowerShell script to Python."
   ```

   *Allow Copilot to generate the initial Python code.*

4. Review the Python code Copilot generates and accept the suggestions.
5. Ask Copilot: "What Python packages do I need to install for this script?"
6. Ask Copilot to create a `requirements.txt` file with the needed packages.
7. Create a virtual environment in the terminal:

   ```powershell
   python -m venv .venv
   ```

8. Activate the virtual environment:

   ```powershell
   .\.venv\Scripts\Activate.ps1
   ```

9. Install the packages from requirements.txt:

   ```powershell
   pip install -r requirements.txt
   ```

10. Run the script to verify it works:

    ```powershell
    python system_report.py
    ```

11. Do you see the output files created in the expected location?

## Exercise 2 – Improve the Python Script

**Use Copilot Edit Mode (Ctrl+Shift+I, ensure Edit mode is active):**

1. With `system_report.py` open, ask Copilot to:

   ```text
   "Add error handling with try/except blocks"
   ```

2. Ask Copilot to:

   ```text
   "Add logging to a file using Python's logging module"
   ```

3. Ask Copilot to:

   ```text
   "Save the system report to both JSON and CSV files"
   ```

   **Note:** This step is important for the next exercise. Make sure you have JSON and CSV files created.

4. Run the script to test:

   ```powershell
   python system_report.py
   ```

5. Verify output files are created in the expected location.


## Exercise 4 – Create a Streamlit Dashboard

**Where to create your dashboard:**

- Create a new file named `dashboard.py` inside the `Lab2_Python` folder.

**Use Copilot Chat in Plan mode:****

1. Make sure your context is the `system_report.py` script.
2. Open Copilot Chat and switch to **Plan mode**.
3. Ask Copilot to plan a Streamlit Dashboard:

   ```text
   "Create a modern, colorful Streamlit dashboard to visualize system report data from CSV files, featuring interactive charts, metrics cards, and multi-page navigation for comprehensive IT infrastructure monitoring."
   ```

4. Review the plan that Copilot generates.
5. If you agree with the plan, click the **"Start implementation"** button.
   - Plan mode will automatically change to Agent mode and start creating the dashboard.

6. Review and accept the generated code.
7. If needed, ask Copilot to update the `requirements.txt` file to include Streamlit:

   ```text
   "Add streamlit and any visualization libraries to requirements.txt"
   ```

8. Install the updated requirements:

   ```powershell
   pip install -r requirements.txt
   ```

9. Run the dashboard:

   ```powershell
   streamlit run dashboard.py
   ```

10. Open the web browser to view your dashboard (it should open automatically).

## Exercise 4 – Ask Mode - Understanding Python Code

**Switch to Ask Mode in Copilot Chat:**

1. Open `system_report.py`.
2. Change Copilot mode to **Ask** mode.
3. Ask Copilot:
   - "Explain how this script collects system information"
   - "What are the main functions in this script?"
   - "How can I improve the performance of this script?"
   - "What error handling mechanisms are in place?"

4. Review Copilot's explanations to deepen your understanding.
5. Try asking follow-up questions about any part of the code you don't understand.

## Validation Checklist

- [ ] Python script successfully retrieves system information
- [ ] JSON and CSV output files are created
- [ ] Streamlit dashboard displays data correctly


## Stretch Goals

- Use Copilot to add command-line arguments (argparse) to specify which reports to generate
- Ask Copilot to add email notifications when critical thresholds are exceeded
- Use Copilot to create unit tests for the main functions using pytest
- Ask Copilot to add support for exporting data to Excel format with formatting
- Use Copilot to add a configuration file (YAML or JSON) for script settings

- Ask Copilot to add multi-threading for checking multiple remote systems

Lab 3 is complete! Proceed to Lab 4 – YAML/Ansible Automation with Copilot.
