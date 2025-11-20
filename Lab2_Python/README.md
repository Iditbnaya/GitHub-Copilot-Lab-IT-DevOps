# Lab 3 – Python Automation with Copilot

## Scenario
In the previous lab, you worked with a PowerShell script that:
- Collected disk usage information
- Generated JSON and CSV output files
- Created logs under the `./logs` folder

In this lab, you will use GitHub Copilot to:
1. Convert your PowerShell script to Python
2. Improve and refactor the Python version
3. Create a web dashboard using Streamlit to visualize the results

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
- Create a new file named `disk_audit.py` in the **root directory** of this repository (same folder as `Script.ps1`).

**Use Copilot Chat to translate:**
1. Open your `Script.ps1` file in VS Code.
2. Select all the PowerShell code (Ctrl+A).
3. Open Copilot Chat (Ctrl+Shift+I) and ask:
   ```
   "Convert this PowerShell script to Python. Use psutil library for disk information."
   ```
4. Review the Python code Copilot generates.
5. Copy the generated Python code into your new `disk_audit.py` file.
6. Ask Copilot: "What Python packages do I need to install for this script?"
7. Install required packages: `pip install psutil`

## Exercise 2 – Improve the Python Script

**Use Copilot Edit Mode (Ctrl+Shift+I, ensure Edit mode is active):**

1. With `disk_audit.py` open, ask Copilot to:
   ```
   "Add error handling with try/except blocks"
   ```
2. Ask Copilot to:
   ```
   "Add logging to a file using Python's logging module"
   ```
3. Ask Copilot to:
   ```
   "Save the disk report to both JSON and CSV files"
   ```
4. Run the script to test: `python disk_audit.py`
5. Verify output files are created in the expected location.

## Exercise 3 – Add Command-Line Arguments

**Use Copilot Inline suggestions:**

1. In `disk_audit.py`, add a comment at the top:
   ```python
   # Add argparse to accept threshold percentage as command-line argument
   ```
2. Let Copilot suggest the argparse code.
3. Accept the suggestions and add any additional parameters you need (e.g., output directory).
4. Test running with arguments: `python disk_audit.py --threshold 20`

## Exercise 4 – Create a Streamlit Dashboard

**Where to create your Streamlit app:**
- Create a new file named `dashboard.py` in the root directory.

**Use Copilot Chat:**

1. Open `dashboard.py` and ask Copilot Chat:
   ```
   "Create a Streamlit dashboard that reads disk_report.json and displays:
   - A table of all disks
   - A bar chart showing free space percentage
   - Highlight disks below 15% free in red"
   ```
2. Review and accept the generated code.
3. Install Streamlit: `pip install streamlit`
4. Run the dashboard: `streamlit run dashboard.py`
5. Open the web browser to view your dashboard.

## Exercise 5 – Ask Mode - Understanding Python Code

**Switch to Ask Mode in Copilot Chat:**

1. Open `disk_audit.py`.
2. Change Copilot mode to **Ask** mode.
3. Ask Copilot:
   - "Explain how psutil.disk_usage() works"
   - "What are the main functions in this script?"
   - "How can I improve the performance of this script?"
4. Review Copilot's explanations to deepen your understanding.

## Exercise 6 – Agent Mode - Documentation and Optimization

**Use Agent Mode:**

1. Open `disk_audit.py`.
2. Switch to **Agent** mode in Copilot.
3. Ask Copilot:
   ```
   "Add docstrings to all functions following Google style"
   ```
4. Review and accept changes.
5. Ask Copilot:
   ```
   "Refactor this script to use functions and make it more modular"
   ```
6. Review the refactored code and keep the improvements.
7. Run the script again to ensure it still works.

## Copilot Prompt Sampler

- "Add type hints to all function parameters and return values"
- "Create a Python class to encapsulate disk audit functionality"
- "Add unit tests for the main functions using pytest"
- "Convert the CSV output to an Excel file with formatting"

## Validation Checklist

- [ ] Python script successfully retrieves disk information
- [ ] Script accepts command-line arguments (threshold, output path)
- [ ] JSON and CSV output files are created
- [ ] Logging is configured and writes to a log file
- [ ] Streamlit dashboard displays data correctly
- [ ] Code includes docstrings and type hints

## Stretch Goals

- Use Copilot to add email notifications when disk space is low (using smtplib)
- Ask Copilot to integrate with Azure Monitor or Prometheus for metrics
- Use Copilot to create a FastAPI endpoint that returns disk data as JSON
- Ask Copilot to add multi-threading for checking multiple remote systems

Lab 3 is complete! Proceed to Lab 4 – YAML/Ansible Automation with Copilot.