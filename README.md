<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# MH PostDischarge Dashboard

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Status: In Development](https://img.shields.io/badge/Status-In_Development-yellow.svg)]()
[![Version: v0.1.0](https://img.shields.io/badge/Version-v0.1.0-green.svg)](CHANGELOG.md)

> A PowerBI-based clinical decision support dashboard for the Edward Hines Jr. VA Hospital that identifies Veterans discharged from inpatient Mental Health wards (2S/2N) who have not completed a required post-discharge follow-up outpatient appointment within 7 days.

---

## Purpose

The **MH PostDischarge Dashboard** is a dynamic PowerBI report designed to help Nursing Department leadership at **Edward Hines Jr. VA Hospital** (Station 578) monitor and act on post-discharge follow-up compliance for Mental Health inpatients.

### Clinical Context

When a Veteran is discharged from the 2S or 2N inpatient mental health/psychiatry wards, clinical best practice and VA policy require that a post-discharge outpatient mental health appointment be completed within **7 calendar days** of discharge. This dashboard identifies Veterans where that follow-up has **not** occurred, enabling timely intervention by clinical staff.

### What This Dashboard Shows

- Pre-populated, filtered lists of Veterans who:
  - Were admitted to the **2S** or **2N** inpatient mental health/psychiatry wards
  - Have been **discharged** from that ward
  - Have **NOT** completed a post-discharge follow-up outpatient appointment within 7 days
- The dashboard is designed as an exception report: patients appear only when the system has failed to schedule, perform, or complete the required follow-up

---

## Technology Stack

| Component | Technology | Environment |
|-----------|-----------|-------------|
| Data Source | MS SQL Server (VA Corporate Data Warehouse) | `VhaCdwDwhSql33.vha.med.va.gov` |
| Database | `D03_VISN12Collab` | VA on-prem network |
| Reporting | PowerBI (Gov Cloud) | [V12 Hines VA - Informatics](https://app.powerbigov.us/groups/f9a21156-7cbd-49e0-8cec-3b7b6e47b9e9/list) |
| Source Control | Git + GitHub | [KCoderVA/578-MH-postDischarge-dashboard](https://github.com/KCoderVA/578-MH-postDischarge-dashboard) |
| IDE | VS Code v1.110.0 | Windows 11 workstation |

---

## Project Structure

```
\root\
├── .github/          # GitHub config (templates, workflows, Copilot instructions)
├── .vscode/          # VS Code workspace settings & tasks
├── archive/          # Long-term development storage
├── config/           # Project configuration (SQL profiles, PowerBI themes)
├── data/             # Sample/mock data and schema documentation
├── docs/             # Project documentation, architecture records, guides
├── logs/             # Development logs
├── prompts/          # AI prompt templates & Copilot snippets
├── scripts/          # PowerShell, Python, and batch automation scripts
├── src/              # Primary source code (SQL, PowerBI, PowerAutomate)
├── tests/            # Test scripts and test data
├── CHANGELOG.md      # Versioned change history
├── CONTRIBUTING.md   # Contribution guidelines
├── LICENSE           # Apache License 2.0
├── README.md         # This file
└── SECURITY.md       # Security and PHI/PII policy
```

---

## Getting Started

### Prerequisites

- **VS Code** v1.110.0 or later with the following extensions:
  - MS SQL Tools (`ms-mssql.mssql`)
  - PowerShell (`ms-vscode.powershell`)
  - GitHub Copilot (`github.copilot-chat`)
  - Prettier (`esbenp.prettier-vscode`)
- **PowerBI Desktop** (Gov Cloud compatible)
- **Git** and **Git LFS** installed locally
- **VA Network access** with appropriate Entra ID credentials
- Access to `VhaCdwDwhSql33.vha.med.va.gov` SQL Server via Windows Integrated Security

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/KCoderVA/578-MH-postDischarge-dashboard.git
   ```
2. Open the workspace file in VS Code:
   ```
   .vscode/578-MH-postDischarge-dashboard.code-workspace
   ```
3. Install recommended extensions when prompted
4. Verify SQL Server connectivity using the `CDW_SQL33` connection profile

---

## For Other VA Facilities

This project is designed to be replicated at other VA hospitals. When the project reaches v1.0 release, a separate public repository will be created containing:

- Sanitized SQL stored procedure templates
- PowerBI report templates (`.pbit` files)
- Implementation guide with step-by-step deployment instructions
- Configuration documentation for adapting to your facility's data sources

See [`docs/guides/implementationGuide.md`](docs/guides/implementationGuide.md) for details.

---

## Key Stakeholders

| Role | Name | Department |
|------|------|------------|
| Developer | Kyle J. Coder | Advanced Analytics & Informatics Team |
| Key Stakeholder | Heidi Mercurio, Chief Nurse | Nursing Services |

---

## Privacy & Security

- **No PHI/PII** is stored in this repository
- All patient data access is handled at runtime via Microsoft Entra ID authentication
- See [SECURITY.md](SECURITY.md) for full security policy
- See [CONTRIBUTING.md](CONTRIBUTING.md) for contributor security requirements

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on coding standards, commit conventions, and the pull request process.

---

## License

This project is licensed under the **Apache License 2.0**. See [LICENSE](LICENSE) for the full text.

```
Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
```

---

*Created: 2026-03-04 | Version: v0.1.0*
