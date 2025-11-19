# Lab 1 – Getting Started with GitHub Copilot

## Scenario

Your team is rolling out GitHub Copilot to infrastructure engineers who primarily work in PowerShell, YAML, and Ansible. This introductory lab walks through enabling Copilot, exploring core features, and capturing best practices so everyone starts from a consistent baseline before the automation-focused labs.

## Learning Goals

- Activate GitHub Copilot in VS Code and confirm the extension is responding to prompts.
- Practice inline completions, multi-line suggestions, and Copilot Chat workflows.
- Compare Copilot-generated answers with documentation and adjust prompts for higher quality outputs.
- Capture prompt/response artifacts that will feed later labs and retrospectives.

## Prerequisites

- Active GitHub Copilot subscription tied to a GitHub identity that can access the training repository.
- Visual Studio Code (latest stable build) with GitHub Copilot and GitHub Copilot 
- Sample PowerShell and YAML snippets (provided in this repository under `samples/` or created ad hoc with Copilot).

## Exercise 1 – Verify Copilot Setup (20 min)

1. Open VS Code, sign into GitHub, and ensure the **Copilot** and **Copilot Chat** extensions are enabled.
3. Use the Command Palette (`Ctrl+Shift+P`) and run `GitHub Copilot: Toggle Copilot` to confirm status.
	- This quick toggle forces the extension to reconnect so you can verify authentication before investing time in the later automation labs.

## Exercise 2 – Inline Completions & Ghost Text (20 min)

1. Create a new PowerShell file `Get-ProcessReport.ps1` and type a comment describing a script that summarizes top processes by CPU.
2. Pause typing and observe Copilot's ghost text suggestion; accept with `Tab` if appropriate.
3. Ask Copilot for an alternative by pressing `Alt+[` or `Alt+]` (or the equivalent on macOS) to cycle through suggestions.
4. Document which prompt style (comment, function signature, or inline description) produced the best result.

## Exercise 3 – Copilot Chat & Explanations (25 min)

1. Open Copilot Chat (`Ctrl+I`) and ask, "Explain what this PowerShell function does" while selecting the generated script.
2. Follow up with "Optimize the script for remote execution against multiple servers" and review the diff Copilot proposes.
3. Request a conversion: "Translate this PowerShell function into Python" and save the output for Lab 3.
4. Summarize the prompt strategies that yielded the most accurate answers in `notes/lab1-retro.md` (create the file if needed).

## Exercise 4 – Pair Programming Patterns (25 min)

1. Use Copilot Chat's `@workspace` context to ask for a plan: "Outline steps to audit disk usage across Windows servers using PowerShell." Note the plan for Lab 2.
2. Highlight a YAML snippet (Kubernetes deployment or GitHub Action) and ask Copilot Chat, "Add inline comments explaining each section." Save the annotated version to reuse later.
3. Try `@terminal` or `@vscode` commands (if available) to ask Copilot how to run PowerShell linting locally.
4. Reflect on scenarios where human review is essential; add findings to the retro notes.

## Exercise 5 – Prompt Crafting Retro (15 min)

1. In a Markdown file (`notes/prompt-library.md`), log three prompts that produced excellent results and three that needed refinement.
2. Use Copilot to suggest improved wording for the weaker prompts and record the before/after pairs.
3. Share your prompt library with teammates by committing it to a shared branch or posting in your collaboration channel.

## Validation Checklist

- [ ] Copilot is authenticated and providing inline suggestions in VS Code.
- [ ] Copilot Chat explanations reviewed for accuracy and annotated where needed.
- [ ] At least one PowerShell-to-Python translation saved for use in Lab 3.
- [ ] Prompt library and retro notes committed or stored for later reference.

## Stretch Goals

- Explore GitHub Copilot in the CLI (`gh extension install github/gh-copilot`) and ask it to generate a `gh` command for repository automation.
- Enable voice dictation or accessibility features in VS Code and test how Copilot responds to dictated prompts.
- Review Copilot's privacy and telemetry settings, documenting the configuration required by your organization.
