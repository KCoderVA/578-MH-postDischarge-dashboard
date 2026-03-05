# MH PostDischarge Dashboard - Workspace Initialization Plan

> **Document Version:** v0.1.0
> **Created:** 2026-03-04
> **Author:** Claude Opus 4.6 (Co-Authored with Kyle J. Coder)
> **Source Prompt:** `\root\newWorkspaceSetup_userInput.prompt`
> **Project Root:** `S:\Informatics\Data Team\Coder - Informatics\Data Analyst\Data Projects\MH_postDischarge_dashboard\`

---

## TABLE OF CONTENTS

1. [Pre-Execution Clarifying Questions](#1-pre-execution-clarifying-questions)
2. [Project Context Summary](#2-project-context-summary)
3. [Verified Input Parameters Reference Table](#3-verified-input-parameters-reference-table)
4. [Directory &amp; Folder Structure Plan](#4-directory--folder-structure-plan)
5. [VS Code Workspace Configuration Plan](#5-vs-code-workspace-configuration-plan)
6. [Git Repository Initialization &amp; GitHub Remote Setup](#6-git-repository-initialization--github-remote-setup)
7. [Core Project Documentation Files](#7-core-project-documentation-files)
8. [AI/Agent Instruction &amp; Customization Files](#8-aiagent-instruction--customization-files)
9. [Automation, Tasks, &amp; Developer Tooling](#9-automation-tasks--developer-tooling)
10. [SQL &amp; Data Source Configuration](#10-sql--data-source-configuration)
11. [PowerBI Artifacts &amp; Configuration](#11-powerbi-artifacts--configuration)
12. [Template Files &amp; Reusable Scaffolding](#12-template-files--reusable-scaffolding)
13. [Security, Licensing, &amp; Compliance](#13-security-licensing--compliance)
14. [Extension Recommendations](#14-extension-recommendations)
15. [Implementation Execution Order &amp; Checklist](#15-implementation-execution-order--checklist)

---

## 1. PRE-EXECUTION CLARIFYING QUESTIONS

**IMPORTANT: Please answer ALL of the following questions before we begin executing any plan steps. Your answers will directly affect the files, configurations, and content that get created.**

### Q1 - Git Branch Strategy

- [ ] **Question:** Which Git branching model do you prefer for this project?**USER ANSWER: (a)** GitHub Flow (simple: `main` + short-lived feature branches) -- recommended for solo/small-team projects

### Q2 - Initial Default Branch Name

- [ ] **Question:** Should the default branch be named `main` or `master`? (GitHub default is `main`; your prompt file did not specify.)
  **USER ANSWER:** Use the "main" default that GitHub.com repos typically utilize

### Q3 - .gitignore Scope

- [ ] **Question:** I plan to generate a comprehensive `.gitignore` covering: VS Code, Windows, PowerBI (.pbix, .pbit), Python, Node.js, PowerShell, .NET, Office temp files, and sensitive config files. Are there any additional tools or file types you want excluded from Git tracking?

  **USER ANSWER:** Do not make the .gitignore file TOO restrictive. I want you to add all those different lines and specific tools you descrived to the .gitignore file, but comment-out the majority of things so they are not actually functional. Since my project's development is going to be almost exclusively on my local machine & internal secured networks, there is not much significant risk of having too little ignored. I can later un-comment out the portions I want to have ignored at later stages of development if I need.

### Q4 - PowerBI Artifact Files

- [ ] **Question:** Will you be storing `.pbix` files in the repo (they are binary and bloat Git history), or only `.pbit` template files? Common best practice is:**USER ANSWER:** **(b)** Store both `.pbix` and `.pbit` in Git (use Git LFS for `.pbix`). The local PowerBi file artifacts should be saved for my own development history and usage and saved to my private GitHub repo for archival and record keeping. A final hypothetical future state published completed project that I am ready to share publicly will instead have a second public-facing repo created that only contains the minimal sanitized source files and content that are relevant to third party users who want to duplicate my packaged solution at their own facility. Until then, everything will only ever be seen and stored by me.

### Q5 - Python Virtual Environment

- [ ] **Question:** Your VS Code profile has Python extensions installed. Do you want me to:

  - **USER ANSWER:      (a)** Initialize a Python virtual environment (`.venv/`) with a `requirements.txt` (I want you to initialize the enviroment and placeholder file artifacts and subfolders now, but then also add them to the .gitignore listing so they aren't shared or archived. At some future hypothetical stage if needed, I can use them and un-ignore them.

### Q6 - Node.js / npm Initialization

- [ ] **Question:** Your prompt mentions potential JavaScript files. Do you want me to:
  - **USER ANSWER:    (a)** Run `npm init` to create a `package.json` (for linting tools, Prettier config, etc.)

### Q7 - GitHub Repository Visibility

- [ ] **Question:** Your prompt says the repo at `KCoderVA/578-MH-postDischarge-dashboard` is "newly created and empty." You also say it will eventually become public. Should it be:
  - **USER ANSWER:**     NEITHER (a) nor (b), this main GitHub.com repository is under my own account privately and I am the only developer who will be working on this project.   When I complete the project and am ready to release it publicly at v1.0, I will create a seperate public-facing repository that mirrors my developmental private version BUT which only contains the sanitized & anonymized template files, importation guides, and source code for my project. You should still confirm current visibility so I can match the plan accordingly.

### Q8 - CHANGELOG.md Tooling

- [ ] **Question:** You specified a preference for verbose CHANGELOG.md with semantic versioning. Do you want:
  - **USER ANWER:   (c)** Fully automated via a GitHub Action that generates changelog on release

### Q9 - PowerAutomate / Power Apps Scope

- [ ] **Question:** You mentioned potential PowerAutomate flows and canvas Power Apps. Should I create placeholder directories and configuration for these now, or defer until they are actually needed?
  **USER ANSWER:**     YES, create the placeholder folders and relavent README.md and other configuration components or structures that might eventually be needed for these other content types. 

### Q10 - Pre-commit Hooks

- [ ] **Question:** Do you want Git pre-commit hooks installed (e.g., to validate SQL syntax, check for secrets, enforce license headers)? Options:
  - **USER ANSWER:     (b)** Yes, comprehensive hooks (lint SQL, format markdown, secret scan, license headers)    BUT,  I have had quite a lot of trouble with GitHub pre-commit hook execution in past projects, THEREFORE I want you to build out these comprehensive hook file artifacts with very clearly defined activation/deactivation lines at the top that I could easily disable them later by simply changing their first row's values from "true" to "false" or something similar.

### Q11 - VA Design System Assets

- [ ] **Question:** Your prompt references the VA Design System (`design.va.gov`). For this project (a PowerBI dashboard with SQL backend), how should VA branding be applied?
  - **(a)** Create a `\docs\branding\` folder with VA color palette reference, logo files, and font specifications for use in PowerBI theming
  - **(b)** Create a PowerBI JSON theme file aligned to VA branding guidelines
  - **USER ANSWER:    (c)** Both (a) and (b)    IN MY PREVIOUS PROJECTS, I have also used this locally saved .pbit template file, that I indend to re-use here as well  (saved at file path "S:\Informatics\Data Team\Coder - Informatics\Data Analyst\PowerBI - Misc Files\578 PBI Files\PBI Template File.pbit") as well as this older copy of a Veterans Affairs branded theme .json file (saved at file path "S:\Informatics\Data Team\Coder - Informatics\Data Analyst\PowerBI - Misc Files\578 PBI Files\VA-Branded-Theme.json"). However both of those two artifacts are more than a year since their last update, and they likely need to be modernized & updated again.

### Q12 - Workspace File Creation Timing

- [ ] **Question:** You correctly noted that creating the `.code-workspace` file will cause VS Code to prompt you to open it, potentially disrupting this session. Should I:
  - **USER ANSWER:   (a)** Create the workspace file as the very LAST step (after all other files/folders exist)

---

## 2. PROJECT CONTEXT SUMMARY

### 2.1 Project Purpose

The **MH PostDischarge Dashboard** is a PowerBI-based clinical decision support tool for the **Edward Hines Jr. VA Hospital**. It will display filtered lists of Veterans who were discharged from inpatient Mental Health wards (2S/2N) and who have NOT completed a required post-discharge outpatient follow-up appointment within 7 calendar days.

### 2.2 Stakeholders

| Role            | Name           | Email                 | Department                            |
| --------------- | -------------- | --------------------- | ------------------------------------- |
| Developer       | Kyle J. Coder  | Kyle.Coder@va.gov     | Advanced Analytics & Informatics Team |
| Key Stakeholder | Heidi Mercurio | Heidi.Mercurio@va.gov | Nursing Services (Chief Nurse)        |

### 2.3 Technology Stack

| Layer          | Technology                                               | Environment                                            |
| -------------- | -------------------------------------------------------- | ------------------------------------------------------ |
| Data Source    | MS SQL Server (CDW)                                      | `VhaCdwDwhSql33.vha.med.va.gov`                      |
| Database       | `D03_VISN12Collab`                                     | On-prem VA network                                     |
| Reporting      | PowerBI (Gov Cloud)                                      | `app.powerbigov.us`                                  |
| Workspace      | `V12 Hines VA - Informatics`                           | PowerBI Service                                        |
| Source Control | Git + GitHub                                             | `github.com/KCoderVA/578-MH-postDischarge-dashboard` |
| IDE            | VS Code v1.110.0                                         | Local workstation (Windows 11)                         |
| Scripting      | SQL, PowerShell, Python, potentially JS/VBA              | Various                                                |
| Automation     | PowerAutomate (Gov Cloud), VS Code Tasks, GitHub Actions | Various                                                |

### 2.4 Key Constraints

- No local admin privileges (restricted to `C:\Users\VHAHINCoderK1\` and S: drive)
- Government cloud environments (`*.gov` domains, US Gov Azure)
- No live PHI/PII stored in repository (Entra-based runtime access only)
- Apache 2.0 license required on all source files
- Must comply with VA content style guidelines (`design.va.gov`)

---

## 3. VERIFIED INPUT PARAMETERS REFERENCE TABLE

| Parameter                  | Value                                                                                                                                                                                                                            |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Project Name (Human)       | MH PostDischarge Dashboard                                                                                                                                                                                                       |
| Project Name (File System) | MH_postDischarge_dashboard                                                                                                                                                                                                       |
| Project Name (Repo)        | 578-MH-postDischarge-dashboard                                                                                                                                                                                                   |
| Root Directory             | `S:\Informatics\Data Team\Coder - Informatics\Data Analyst\Data Projects\MH_postDischarge_dashboard\`                                                                                                                          |
| Workspace File Path        | `\root\.vscode\578-MH-postDischarge-dashboard.code-workspace`                                                                                                                                                                  |
| GitHub Repo URL            | `https://github.com/KCoderVA/578-MH-postDischarge-dashboard`                                                                                                                                                                   |
| GitHub Username            | KCoderVA                                                                                                                                                                                                                         |
| SQL Server                 | `VhaCdwDwhSql33.vha.med.va.gov`                                                                                                                                                                                                |
| SQL Database               | `D03_VISN12Collab`                                                                                                                                                                                                             |
| SQL Connection String      | `Data Source=VhaCdwDwhSql33.vha.med.va.gov;Integrated Security=True;Pooling=False;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Name=vscode-mssql;Application Intent=ReadWrite;Command Timeout=30` |
| PowerBI Workspace          | `V12 Hines VA - Informatics`                                                                                                                                                                                                   |
| PowerBI Workspace URL      | `https://app.powerbigov.us/groups/f9a21156-7cbd-49e0-8cec-3b7b6e47b9e9/...`                                                                                                                                                    |
| License                    | Apache License 2.0                                                                                                                                                                                                               |
| Naming Convention          | camelCase                                                                                                                                                                                                                        |
| Date Format in Filenames   | `YYYY.MM.DD_fileName.fileType`                                                                                                                                                                                                 |
| Version Format             | Semantic `vX.Y.Z`                                                                                                                                                                                                              |
| User Settings Path         | `C:\Users\VHAHINCoderK1\AppData\Roaming\Code\User\settings.json`                                                                                                                                                               |
| PowerShell Profile         | `c:\Users\VHAHINCoderK1\AppData\Local\Programs\Microsoft VS Code\0870c2a0c7\resources\app\out\vs\workbench\contrib\terminal\common\scripts\shellIntegration.ps1`                                                               |

---

## 4. DIRECTORY & FOLDER STRUCTURE PLAN

The following directory tree follows industry-standard conventions used in major open-source projects and enterprise software organizations. Each directory has a clear, single-responsibility purpose.

```
\root\  (MH_postDischarge_dashboard\)
│
├── .github\                          # GitHub-specific configuration
│   ├── ISSUE_TEMPLATE\               # GitHub issue templates
│   │   ├── bugReport.md              # Bug report template
│   │   ├── featureRequest.md         # Feature request template
│   │   └── dataQuestion.md           # Data/clinical question template
│   ├── PULL_REQUEST_TEMPLATE\        # PR templates
│   │   └── pullRequestTemplate.md    # Default PR template
│   ├── workflows\                    # GitHub Actions CI/CD
│   │   └── ci.yml                    # Basic CI workflow (lint, validate)
│   ├── copilot-instructions.md       # GitHub Copilot project instructions
│   ├── dependabot.yml                # Dependency update automation
│   └── CODEOWNERS                    # Code ownership definitions
│
├── .vscode\                          # VS Code workspace configuration
│   ├── 578-MH-postDischarge-dashboard.code-workspace  # Workspace file (CREATED LAST)
│   ├── settings.json                 # Workspace-level VS Code settings
│   ├── tasks.json                    # VS Code task definitions
│   ├── launch.json                   # Debug configurations
│   ├── extensions.json               # Recommended extensions list
│   └── mcp.json                      # MCP server configuration (if applicable)
│
├── archive\                          # Long-term development storage
│   ├── deprecated\                   # Retired code/files preserved for reference
│   ├── research\                     # Research notes, white papers, references
│   └── snapshots\                    # Point-in-time project snapshots
│
├── config\                           # Project configuration files
│   ├── sqlConnectionProfiles.json    # SQL connection profiles (non-sensitive)
│   └── powerbiTheme.json             # PowerBI theme file (VA branding)
│
├── data\                             # Data files (test/sample data only)
│   ├── sample\                       # Sample/mock datasets for testing
│   └── schemas\                      # Data schema documentation
│
├── docs\                             # Project documentation
│   ├── architecture\                 # Architecture decision records (ADRs)
│   │   └── adr-001_projectOverview.md
│   ├── branding\                     # VA design system references
│   ├── guides\                       # User guides and implementation docs
│   │   └── implementationGuide.md    # Hospital-level deployment guide
│   ├── images\                       # Screenshots, diagrams, media
│   └── runbooks\                     # Operational procedures
│
├── logs\                             # Development logs & troubleshooting
│   └── devLog.md                     # Running developer log
│
├── prompts\                          # AI prompt templates & records
│   ├── ai-prompts.md                 # Reusable AI/Copilot prompts
│   └── copilot-snippets.md          # Copilot code snippets
│
├── scripts\                          # Automation & utility scripts
│   ├── powershell\                   # PowerShell automation scripts
│   ├── python\                       # Python utility scripts
│   └── batch\                        # Windows batch files
│
├── src\                              # Primary source code
│   ├── sql\                          # SQL source files
│   │   ├── queries\                  # Ad-hoc & development queries
│   │   ├── storedProcedures\         # Production stored procedures
│   │   ├── views\                    # SQL views
│   │   └── migrations\              # Schema migration scripts
│   ├── powerbi\                      # PowerBI artifacts
│   │   ├── templates\                # .pbit template files
│   │   ├── measures\                 # DAX measure definitions
│   │   └── dataflows\               # PowerBI dataflow definitions
│   └── powerAutomate\                # Power Automate flow exports (if applicable)
│
├── tests\                            # Testing artifacts
│   ├── sql\                          # SQL test scripts
│   ├── data\                         # Test data files (csv, xlsx)
│   └── output\                       # Test output/results
│
├── .editorconfig                     # Editor configuration (cross-editor consistency)
├── .gitattributes                    # Git line-ending & binary file handling
├── .gitignore                        # Git ignore rules
├── .prettierrc                       # Prettier formatting configuration
├── CHANGELOG.md                      # Versioned change history
├── CONTRIBUTING.md                   # Contribution guidelines
├── LICENSE                           # Apache License 2.0 full text
├── newWorkspace_initializationPlan.md  # This file
├── newWorkspaceSetup_userInput.prompt  # Original initialization prompt
├── README.md                         # Project README (primary documentation)
└── SECURITY.md                       # Security policy & vulnerability reporting
```

### 4.1 Design Rationale

- **`.github/`**: Standard location for GitHub platform features (Actions, templates, Copilot instructions, Dependabot). Used universally at FAANG companies and top open-source projects.
- **`.vscode/`**: Workspace-level settings that override user-level defaults. Contains recommended extensions so any collaborator gets the same tooling.
- **`archive/`**: Your specified long-term archival storage, separated from active source code.
- **`config/`**: Externalized configuration following the Twelve-Factor App methodology. No secrets stored here.
- **`data/`**: Sample/mock data only. Live data is never persisted locally per your security requirements.
- **`docs/`**: Follows the "docs-as-code" pattern. Architecture Decision Records (ADRs) track major design choices over time.
- **`src/`**: Primary source code organized by technology layer (SQL, PowerBI, PowerAutomate).
- **`tests/`**: Separate test directory mirroring source structure. Enables clear separation of production vs. test artifacts.
- **`scripts/`**: Automation utilities organized by language/runtime.

---

## 5. VS CODE WORKSPACE CONFIGURATION PLAN

### 5.1 Workspace File (`578-MH-postDischarge-dashboard.code-workspace`)

The multi-root workspace file will define:

```jsonc
{
  "folders": [
    {
      "name": "MH PostDischarge Dashboard",
      "path": ".."
    }
  ],
  "settings": {
    // Workspace-specific overrides (see 5.2)
  },
  "extensions": {
    "recommendations": [
      // See Section 14
    ]
  },
  "tasks": {
    "version": "2.0.0",
    "tasks": []
  }
}
```

**WARNING**: This file will be created as the **LAST** step of the implementation to avoid disrupting the current session.

### 5.2 Workspace-Level settings.json

These settings override user-level settings for this project only:

```jsonc
{
  // File associations for this project
  "files.associations": {
    "*.sql": "sql",
    "*.prompt": "markdown",
    "*.copilotmd": "markdown"
  },

  // Project-specific file exclusions
  "files.exclude": {
    "**/node_modules": true,
    "**/.git": false,
    "**/archive/snapshots": false
  },

  // SQL configuration for this project
  "mssql.connections": [
    {
      "server": "VhaCdwDwhSql33.vha.med.va.gov",
      "database": "D03_VISN12Collab",
      "authenticationType": "Integrated",
      "profileName": "578-MH-PostDischarge",
      "encrypt": "Mandatory",
      "trustServerCertificate": true,
      "connectTimeout": 30,
      "commandTimeout": 30,
      "applicationName": "vscode-mssql",
      "applicationIntent": "ReadWrite"
    }
  ],

  // Search exclusions
  "search.exclude": {
    "**/archive/**": true,
    "**/logs/**": true,
    "**/tests/output/**": true
  },

  // Copilot instructions location
  "chat.instructionsFilesLocations": {
    ".github/copilot-instructions.md": true
  }
}
```

### 5.3 tasks.json (VS Code Task Definitions)

Planned tasks:

| Task Name                            | Command                                                   | Purpose                      |
| ------------------------------------ | --------------------------------------------------------- | ---------------------------- |
| `Run SQL Query`                    | Execute active `.sql` file against `D03_VISN12Collab` | Quick SQL testing            |
| `Validate SQL Syntax`              | Lint/parse check on SQL files                             | Pre-commit quality check     |
| `Generate Changelog Entry`         | PowerShell script to append to CHANGELOG.md               | Streamline changelog updates |
| `Open PowerBI Workspace`           | Launch browser to PowerBI Gov workspace URL               | Quick access                 |
| `Git: Stage & Commit with Version` | Prompt for version, stage, commit                         | Enforce semantic versioning  |

### 5.4 launch.json (Debug Configurations)

- Python script debugging (for any utility scripts)
- PowerShell script debugging

### 5.5 extensions.json (Workspace Recommendations)

Will recommend installation of extensions relevant to this project (see Section 14).

---

## 6. GIT REPOSITORY INITIALIZATION & GITHUB REMOTE SETUP

### 6.1 Steps

- [ ] **6.1.1** Initialize local Git repository: `git init`
- [ ] **6.1.2** Configure local Git identity:
  ```bash
  git config user.name "Kyle J. Coder"
  git config user.email "Kyle.Coder@va.gov"
  ```
- [ ] **6.1.3** Set default branch name (pending Q2 answer)
- [ ] **6.1.4** Create `.gitignore` (comprehensive, multi-language)
- [ ] **6.1.5** Create `.gitattributes` (line endings, binary file handling, LFS patterns)
- [ ] **6.1.6** Create `.editorconfig` (cross-editor formatting consistency)
- [ ] **6.1.7** Add GitHub remote:
  ```bash
  git remote add origin https://github.com/KCoderVA/578-MH-postDischarge-dashboard.git
  ```
- [ ] **6.1.8** Create initial commit: `v0.1.0 - Project initialization`
- [ ] **6.1.9** Push to remote: `git push -u origin main`

### 6.2 .gitignore Coverage

The `.gitignore` will cover:

- **VS Code**: `.vscode/*` (except committed config files), `.history/`
- **Windows**: `Thumbs.db`, `Desktop.ini`, `$RECYCLE.BIN/`
- **PowerBI**: `*.pbix` (depending on Q4 answer), `.pbi/`
- **Python**: `__pycache__/`, `*.pyc`, `.venv/`, `*.egg-info/`
- **Node.js**: `node_modules/`, `package-lock.json` (if not using npm)
- **Office**: `~$*`, `*.tmp`
- **Secrets/Sensitive**: `.env`, `*.key`, `*.pem`, credentials files
- **Build outputs**: `bin/`, `obj/`, `dist/`
- **Logs**: `*.log` (but NOT `logs/devLog.md`)
- **Archives**: `archive/snapshots/` (large snapshots excluded)

### 6.3 .gitattributes

```gitattributes
# Auto-detect text files and normalize line endings to LF
* text=auto eol=lf

# Explicit text files
*.md text eol=lf
*.sql text eol=lf
*.json text eol=lf
*.xml text eol=lf
*.yml text eol=lf
*.yaml text eol=lf
*.ps1 text eol=lf
*.py text eol=lf
*.js text eol=lf
*.csv text eol=lf
*.prompt text eol=lf

# Binary files (never diff/merge)
*.pbix binary
*.pbit binary
*.xlsx binary
*.xls binary
*.docx binary
*.pptx binary
*.pdf binary
*.png binary
*.jpg binary
*.gif binary
*.ico binary
*.msapp binary
*.zip binary
*.7z binary
*.exe binary
```

---

## 7. CORE PROJECT DOCUMENTATION FILES

### 7.1 Files to Create

| File                                             | Purpose                            | Content Summary                                                                                                                    |
| ------------------------------------------------ | ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `README.md`                                    | Primary project documentation      | Project overview, purpose, setup instructions, architecture diagram, links to PowerBI workspace, contributing guide, license badge |
| `CHANGELOG.md`                                 | Version history                    | Initialized with `v0.1.0` entry documenting project creation                                                                     |
| `CONTRIBUTING.md`                              | Contribution guidelines            | How to contribute, coding standards, PR process, branch naming, commit message format                                              |
| `SECURITY.md`                                  | Security policy                    | PHI/PII handling policy, vulnerability reporting, data access requirements                                                         |
| `LICENSE`                                      | Apache License 2.0                 | Full Apache 2.0 license text with VA-specific copyright header                                                                     |
| `docs/architecture/adr-001_projectOverview.md` | First Architecture Decision Record | Documents the initial architectural choices and technology stack                                                                   |
| `docs/guides/implementationGuide.md`           | Deployment guide                   | Step-by-step instructions for other VA hospitals to implement this dashboard                                                       |
| `logs/devLog.md`                               | Developer log                      | Running log of development decisions, issues, and progress                                                                         |

### 7.2 Apache 2.0 License Header Template

The following header will be applied to all applicable source files:

```
Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

### 7.3 README.md Structure

```markdown
# MH PostDischarge Dashboard

> **Status:** In Development (v0.1.0)
> **License:** Apache 2.0
> **Organization:** Edward Hines Jr. VA Hospital

## Purpose
[Clinical purpose and overview]

## Architecture
[Technology stack, data flow diagram]

## Getting Started
[Prerequisites, setup steps]

## For Other VA Facilities
[How to implement at your facility]

## Contributing
[Link to CONTRIBUTING.md]

## License
[Apache 2.0 badge and link]
```

---

## 8. AI/AGENT INSTRUCTION & CUSTOMIZATION FILES

### 8.1 Files to Create

| File                                | Purpose                                                |
| ----------------------------------- | ------------------------------------------------------ |
| `.github/copilot-instructions.md` | Project-level Copilot behavior instructions            |
| `prompts/ai-prompts.md`           | Reusable prompt templates for common development tasks |
| `prompts/copilot-snippets.md`     | Code snippet templates for Copilot suggestions         |

### 8.2 Copilot Instructions Content Plan

The `.github/copilot-instructions.md` will include:

- Project context (MH PostDischarge Dashboard, VA Hospital, clinical purpose)
- Coding conventions (camelCase, date-prefixed filenames, semantic versioning)
- SQL conventions (T-SQL dialect, CDW schema patterns, VA data warehouse conventions)
- PowerBI conventions (DAX formatting, measure naming)
- File header requirement (Apache 2.0 license block)
- Security rules (never generate fake PHI/PII, never hardcode credentials)
- Documentation standards (verbose changelogs, ADRs for decisions)
- VA Design System compliance references

---

## 9. AUTOMATION, TASKS, & DEVELOPER TOOLING

### 9.1 VS Code Tasks (`tasks.json`)

```jsonc
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Open PowerBI Workspace",
      "type": "shell",
      "command": "start",
      "args": ["https://app.powerbigov.us/groups/f9a21156-7cbd-49e0-8cec-3b7b6e47b9e9/list"],
      "problemMatcher": [],
      "group": "none",
      "presentation": { "reveal": "silent" }
    },
    {
      "label": "Open GitHub Repository",
      "type": "shell",
      "command": "start",
      "args": ["https://github.com/KCoderVA/578-MH-postDischarge-dashboard"],
      "problemMatcher": [],
      "group": "none",
      "presentation": { "reveal": "silent" }
    },
    {
      "label": "Append Changelog Entry",
      "type": "shell",
      "command": "pwsh",
      "args": ["-File", "${workspaceFolder}/scripts/powershell/appendChangelogEntry.ps1"],
      "problemMatcher": [],
      "group": "none"
    }
  ]
}
```

### 9.2 GitHub Actions (`ci.yml`)

A basic CI workflow for:

- Validating markdown file structure
- Checking for secrets accidentally committed
- Verifying license headers exist on source files

### 9.3 PowerShell Utility Scripts

| Script                                            | Purpose                                                                     |
| ------------------------------------------------- | --------------------------------------------------------------------------- |
| `scripts/powershell/appendChangelogEntry.ps1`   | Interactively append a new entry to CHANGELOG.md with timestamp and version |
| `scripts/powershell/validateLicenseHeaders.ps1` | Scan source files for missing Apache 2.0 headers                            |
| `scripts/powershell/exportProjectSnapshot.ps1`  | Create a dated archive snapshot in `archive/snapshots/`                   |

### 9.4 Dependabot Configuration

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
```

---

## 10. SQL & DATA SOURCE CONFIGURATION

### 10.1 SQL Connection Profile

A workspace-level SQL connection profile will be configured in `.vscode/settings.json` targeting:

- **Server:** `VhaCdwDwhSql33.vha.med.va.gov`
- **Database:** `D03_VISN12Collab`
- **Authentication:** Windows Integrated (no stored credentials)

### 10.2 SQL File Organization

```
src/sql/
├── queries/           # Development & ad-hoc queries
│   └── _template.sql  # Boilerplate query with license header
├── storedProcedures/  # Production stored procedures
│   └── _template.sql  # SP boilerplate with standard header block
├── views/             # SQL view definitions
└── migrations/        # Version-controlled schema changes
```

### 10.3 SQL File Template

Each SQL file will begin with:

```sql
-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
-- File:        [fileName.sql]
-- Author:      Kyle J. Coder (Kyle.Coder@va.gov)
-- Created:     [YYYY-MM-DD]
-- Modified:    [YYYY-MM-DD]
-- Version:     [vX.Y.Z]
-- Description: [Brief description]
-- Database:    D03_VISN12Collab
-- Server:      VhaCdwDwhSql33.vha.med.va.gov
-- ============================================================================
```

---

## 11. POWERBI ARTIFACTS & CONFIGURATION

### 11.1 PowerBI Theme File

A `config/powerbiTheme.json` file will be created with VA Design System-compliant colors:

- Primary: `#112E51` (VA primary blue)
- Secondary: `#205493` (VA secondary blue)
- Accent: `#02BFE7` (VA accent cyan)
- Error/Alert: `#E31C3D` (VA red)
- Success: `#2E8540` (VA green)
- Neutral grays matching VA design tokens

### 11.2 PowerBI Workspace Link

Quick-access links and bookmarks will be configured in tasks and documentation pointing to:
`https://app.powerbigov.us/groups/f9a21156-7cbd-49e0-8cec-3b7b6e47b9e9/list`

---

## 12. TEMPLATE FILES & REUSABLE SCAFFOLDING

### 12.1 GitHub Issue Templates

**Bug Report** (`bugReport.md`):

- Environment details, steps to reproduce, expected vs. actual behavior, screenshots

**Feature Request** (`featureRequest.md`):

- Problem statement, proposed solution, alternatives considered, stakeholder impact

**Data Question** (`dataQuestion.md`):

- Clinical context, data source, expected output, urgency

### 12.2 Pull Request Template

Standard PR template with:

- Summary of changes
- Type of change (bug fix, feature, documentation, etc.)
- Testing performed
- Checklist (license headers, changelog updated, no PHI/PII)

### 12.3 ADR Template

Architecture Decision Record template following the Michael Nygard format:

- Title, Status, Context, Decision, Consequences

---

## 13. SECURITY, LICENSING, & COMPLIANCE

### 13.1 Security Measures

- `.gitignore` excludes all credential files, `.env`, keys, and certificates
- `SECURITY.md` documents the PHI/PII handling policy
- No live patient data stored in repository (runtime Entra auth only)
- GitHub secret scanning enabled on the repository
- License headers on all source files

### 13.2 Apache 2.0 License

The `LICENSE` file will contain the complete Apache License 2.0 text with the copyright notice:

```
Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
```

### 13.3 CODEOWNERS

```
# Default owner for everything in the repo
* @KCoderVA
```

---

## 14. EXTENSION RECOMMENDATIONS

### 14.1 Workspace Extension Recommendations (`.vscode/extensions.json`)

Based on your installed extensions and the project's technology stack:

```json
{
  "recommendations": [
    "ms-mssql.mssql",
    "ms-mssql.data-workspace-vscode",
    "ms-vscode.powershell",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "github.copilot-chat",
    "github.vscode-pull-request-github",
    "github.vscode-github-actions",
    "esbenp.prettier-vscode",
    "redhat.vscode-yaml",
    "yzhang.markdown-all-in-one",
    "christian-kohler.path-intellisense",
    "vscode-icons-team.vscode-icons",
    "docsmsft.docs-markdown",
    "microsoft-isvexptools.powerplatform-vscode",
    "ms-vscode.vscode-websearchforcopilot",
    "analytic-signal.preview-pdf"
  ]
}
```

---

## 15. IMPLEMENTATION EXECUTION ORDER & CHECKLIST

**CRITICAL: Do not begin execution until all questions in Section 1 are answered.**

The following is the ordered sequence of implementation steps. Each step should be completed and verified before moving to the next.

### Phase 1: Foundation (Git & Core Files)

- [X] **Step 1.1** - Create all directories in the folder structure (Section 4) -- COMPLETED 2026-03-04
- [X] **Step 1.2** - Create `.editorconfig` -- COMPLETED 2026-03-04
- [X] **Step 1.3** - Create `.gitignore` -- COMPLETED 2026-03-04 (mostly commented-out per Q3 answer)
- [X] **Step 1.4** - Create `.gitattributes` -- COMPLETED 2026-03-04 (LFS configured for .pbix per Q4 answer)
- [X] **Step 1.5** - Create `.prettierrc` -- COMPLETED 2026-03-04
- [X] **Step 1.6** - Initialize Git repository (`git init`) -- COMPLETED 2026-03-04 (branch: main)
- [X] **Step 1.7** - Configure Git local identity (name, email) -- COMPLETED 2026-03-04 (Kyle J. Coder / Kyle.Coder@va.gov)
- [X] **Step 1.8** - Add GitHub remote origin -- COMPLETED 2026-03-04 (origin: KCoderVA/578-MH-postDischarge-dashboard)

### Phase 2: Licensing & Security

- [X] **Step 2.1** - Create `LICENSE` file (Apache 2.0 full text) -- COMPLETED 2026-03-04
- [X] **Step 2.2** - Create `SECURITY.md` -- COMPLETED 2026-03-04 (PHI/PII policy, HIPAA/FISMA compliance refs)
- [X] **Step 2.3** - Create `.github/CODEOWNERS` -- COMPLETED 2026-03-04 (@KCoderVA owns all paths)

### Phase 3: Project Documentation

- [X] **Step 3.1** - Create `README.md` -- COMPLETED 2026-03-04
- [X] **Step 3.2** - Create `CHANGELOG.md` (initial v0.1.0 entry) -- COMPLETED 2026-03-04
- [X] **Step 3.3** - Create `CONTRIBUTING.md` -- COMPLETED 2026-03-04
- [X] **Step 3.4** - Create `docs/architecture/adr-001_projectOverview.md` -- COMPLETED 2026-03-04
- [X] **Step 3.5** - Create `docs/guides/implementationGuide.md` (placeholder) -- COMPLETED 2026-03-04
- [X] **Step 3.6** - Create `logs/devLog.md` -- COMPLETED 2026-03-04

### Phase 4: AI/Agent Configuration

- [X] **Step 4.1** - Create `.github/copilot-instructions.md` -- COMPLETED 2026-03-04
- [X] **Step 4.2** - Create `prompts/ai-prompts.md` -- COMPLETED 2026-03-04
- [X] **Step 4.3** - Create `prompts/copilot-snippets.md` -- COMPLETED 2026-03-04

### Phase 5: Templates & GitHub Configuration

- [X] **Step 5.1** - Create `.github/ISSUE_TEMPLATE/bugReport.md` -- COMPLETED 2026-03-04
- [X] **Step 5.2** - Create `.github/ISSUE_TEMPLATE/featureRequest.md` -- COMPLETED 2026-03-04
- [X] **Step 5.3** - Create `.github/ISSUE_TEMPLATE/dataQuestion.md` -- COMPLETED 2026-03-04
- [X] **Step 5.4** - Create `.github/PULL_REQUEST_TEMPLATE/pullRequestTemplate.md` -- COMPLETED 2026-03-04
- [X] **Step 5.5** - Create `.github/workflows/ci.yml` -- COMPLETED 2026-03-04 (also created changelog.yml per Q8 answer)
- [X] **Step 5.6** - Create `.github/dependabot.yml` -- COMPLETED 2026-03-04

### Phase 6: Source Code Scaffolding

- [X] **Step 6.1** - Create SQL file templates (`src/sql/queries/_template.sql`, `src/sql/storedProcedures/_template.sql`) -- COMPLETED 2026-03-04
- [X] **Step 6.2** - Create sample data schema docs (`data/schemas/`) -- COMPLETED 2026-03-04 (cdwSchemaReference.md)
- [X] **Step 6.3** - Create PowerBI theme file (`config/powerbiTheme.json`) -- COMPLETED 2026-03-04 (modernized from legacy VA theme)
- [X] **Step 6.4** - Create SQL connection profile (`config/sqlConnectionProfiles.json`) -- COMPLETED 2026-03-04
- [X] **Step 6.5** - Create VA branding reference (`docs/branding/vaBrandingReference.md`) -- COMPLETED 2026-03-04
- [X] **Step 6.6** - Copy existing VA assets (PBI Template, legacy theme) -- COMPLETED 2026-03-04
- [X] **Step 6.7** - Create Power Automate & Power Apps placeholder READMEs -- COMPLETED 2026-03-04 (per Q9)

### Phase 7: Automation & Scripts

- [X] **Step 7.1** - Create `scripts/powershell/appendChangelogEntry.ps1` -- COMPLETED 2026-03-04
- [X] **Step 7.2** - Create `scripts/powershell/validateLicenseHeaders.ps1` -- COMPLETED 2026-03-04
- [X] **Step 7.3** - Create `scripts/powershell/exportProjectSnapshot.ps1` -- COMPLETED 2026-03-04
- [X] **Step 7.4** - Create `.github/hooks/pre-commit` with enable/disable toggles -- COMPLETED 2026-03-04 (installed to .git/hooks/)

### Phase 8: VS Code Workspace Configuration

- [X] **Step 8.1** - Create `.vscode/settings.json` (workspace-level) -- COMPLETED 2026-03-04
- [X] **Step 8.2** - Create `.vscode/tasks.json` -- COMPLETED 2026-03-04 (7 tasks: PBI, GitHub, changelog, license, snapshot, git)
- [X] **Step 8.3** - Create `.vscode/launch.json` -- COMPLETED 2026-03-04 (PowerShell + Python debug configs)
- [X] **Step 8.4** - Create `.vscode/extensions.json` -- COMPLETED 2026-03-04 (23 recommended extensions)
- [ ] **Step 8.5** - Create `.vscode/mcp.json` (if applicable) -- SKIPPED: No MCP servers configured at this stage

### Phase 9: Initial Commit & Push

- [ ] **Step 9.1** - Stage all created files
- [ ] **Step 9.2** - Create initial commit: `v0.1.0 - Project workspace initialization`
- [ ] **Step 9.3** - Push to GitHub remote

### Phase 8.5: Python & Node.js Initialization (added)

- [X] **Step 8.5.1** - Initialize Python virtual environment (`.venv/`) -- COMPLETED 2026-03-04 (excluded from Git via .gitignore)
- [X] **Step 8.5.2** - Create `requirements.txt` placeholder -- COMPLETED 2026-03-04
- [X] **Step 8.5.3** - Create `package.json` via manual initialization -- COMPLETED 2026-03-04

### Phase 10: Workspace File (FINAL STEP)

- [ ] **Step 10.1** - Create `.vscode/578-MH-postDischarge-dashboard.code-workspace`
  - **WARNING:** This step MUST be last. Creating this file will cause VS Code to prompt to open the workspace, which will terminate the current Copilot Chat session and its context/history.

---

## APPENDIX A: FILES CREATED BY THIS PLAN

**Total files to be created: ~40**
**Total directories to be created: ~25**

## APPENDIX B: EXISTING CONTEXT REVIEWED

The following existing artifacts were analyzed to produce this plan:

1. `newWorkspaceSetup_userInput.prompt` (13,188 characters, 25 lines) - Full project initialization instructions
2. `C:\Users\VHAHINCoderK1\AppData\Roaming\Code\User\settings.json` (498 lines) - User-level VS Code settings including:
   - 5 configured MSSQL connection profiles
   - PowerShell 7 terminal configuration
   - Government cloud settings (Azure, PowerBI, Power Platform)
   - Copilot agent mode configuration with extensive auto-approve rules
   - VA Design System YAML schema references
3. Exported VS Code Profile (33 extensions) - Including MSSQL, Python, PowerShell, Copilot, Power Platform, Markdown, YAML, Prettier, and PDF extensions

## APPENDIX C: STANDARDS & REFERENCES

This plan draws from the following industry-standard practices:

- **Google Engineering Practices** - Code review, documentation, project structure
- **Microsoft Open Source Guidelines** - README structure, CONTRIBUTING.md, SECURITY.md
- **GitHub Community Standards** - Issue templates, PR templates, CODEOWNERS, CODE_OF_CONDUCT
- **Twelve-Factor App Methodology** - Configuration externalization, dependency declaration
- **Conventional Commits** - Structured commit messages for automated changelog generation
- **Semantic Versioning 2.0.0** - Version numbering (`vMAJOR.MINOR.PATCH`)
- **Architecture Decision Records (ADRs)** - Michael Nygard's format for documenting design decisions
- **VA Digital Service Design System** - `design.va.gov` for branding and UX compliance

---

*This document will be updated as clarifying questions are answered and implementation proceeds.*
