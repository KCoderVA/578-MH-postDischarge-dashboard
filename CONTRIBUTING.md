<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Contributing to MH PostDischarge Dashboard

Thank you for your interest in contributing to this project. This document provides guidelines and standards for contributing to the **MH PostDischarge Dashboard** project.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Branching Strategy](#branching-strategy)
- [Commit Message Convention](#commit-message-convention)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [File Naming Conventions](#file-naming-conventions)
- [License Headers](#license-headers)
- [Security Requirements](#security-requirements)

---

## Code of Conduct

This project is maintained by the Advanced Analytics & Informatics Team at Edward Hines Jr. VA Hospital. All contributors are expected to conduct themselves professionally and in accordance with U.S. Department of Veterans Affairs policies.

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/KCoderVA/578-MH-postDischarge-dashboard.git
   ```
2. Open the VS Code workspace file:
   ```
   .vscode/578-MH-postDischarge-dashboard.code-workspace
   ```
3. Install recommended extensions when prompted by VS Code
4. Review the [README.md](README.md) for project overview and architecture

---

## Branching Strategy

This project uses **GitHub Flow** (simple branching):

- `main` is the primary branch and should always be in a deployable state
- Create short-lived **feature branches** for all changes
- Branch naming convention: `<type>/<short-description>`
  - Examples: `feature/addDischargeQuery`, `fix/dateFilterBug`, `docs/updateGuide`
- All changes merge to `main` via pull request

### Branch Name Types

| Prefix | Purpose |
|--------|---------|
| `feature/` | New functionality or capability |
| `fix/` | Bug fixes |
| `docs/` | Documentation updates |
| `refactor/` | Code restructuring without behavior change |
| `test/` | Test additions or modifications |
| `chore/` | Maintenance tasks (dependencies, config changes) |

---

## Commit Message Convention

This project follows **Conventional Commits** format:

```
<type>(<scope>): <short description>

<optional body with details>

<optional footer>
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, whitespace (no logic change) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test` | Adding or updating tests |
| `chore` | Maintenance (build, config, dependencies) |

### Examples

```
feat(sql): add stored procedure for discharge patient list

fix(powerbi): correct date filter for 7-day window calculation

docs(readme): update setup instructions for new SQL connection profile

chore(deps): update GitHub Actions workflow to v4
```

### Version Tagging

- All releases are tagged with semantic version numbers: `vMAJOR.MINOR.PATCH`
- Example: `v0.1.0`, `v0.2.0`, `v1.0.0`
- Update `CHANGELOG.md` with every version increment

---

## Pull Request Process

1. Create a feature branch from `main`
2. Make your changes following the coding standards below
3. Ensure all files have Apache 2.0 license headers
4. Update `CHANGELOG.md` if the change is user-facing
5. Submit a pull request using the [PR template](.github/PULL_REQUEST_TEMPLATE/pullRequestTemplate.md)
6. Request review from `@KCoderVA`

### PR Checklist

Before submitting, verify:

- [ ] Code follows project naming conventions (camelCase)
- [ ] All new files include Apache 2.0 license header
- [ ] No PHI/PII, credentials, or sensitive data included
- [ ] CHANGELOG.md updated (if applicable)
- [ ] SQL queries tested against development environment
- [ ] Documentation updated (if applicable)

---

## Coding Standards

### General

- **Naming convention:** camelCase for variables, functions, file names
- **Indentation:** Spaces (2 for JSON/YAML/MD, 4 for SQL/Python/PowerShell)
- **Line endings:** LF (`\n`) per `.editorconfig` and `.gitattributes`
- **File encoding:** UTF-8

### SQL (T-SQL)

- Use uppercase for SQL keywords (`SELECT`, `FROM`, `WHERE`, `JOIN`)
- Use camelCase for aliases and custom identifiers
- Indent nested clauses by 4 spaces
- Include header comment block with file metadata
- Target server: `VhaCdwDwhSql33.vha.med.va.gov`
- Target database: `D03_VISN12Collab`

### PowerShell

- Follow [PowerShell Best Practices](https://poshcode.gitbook.io/powershell-practice-and-style/)
- Use approved verbs for function names (`Get-`, `Set-`, `New-`, etc.)
- Use `Write-Verbose` for diagnostic output
- 4-space indentation

### Python

- Follow [PEP 8](https://peps.python.org/pep-0008/) style guide
- 4-space indentation
- Use type hints where applicable

### Markdown

- Use ATX-style headers (`#`, `##`, `###`)
- Use fenced code blocks with language identifiers
- One sentence per line (for cleaner diffs)

---

## File Naming Conventions

| Convention | Format | Example |
|-----------|--------|---------|
| General files | camelCase | `dischargePatientQuery.sql` |
| Date-prefixed files | `YYYY.MM.DD_fileName.ext` | `2026.03.04_initialSetup.md` |
| Versioned files | `vX.Y.Z_fileName.ext` | `v0.1.0_schemaDefinition.sql` |
| Template files | `_template.ext` | `_template.sql` |

---

## License Headers

**All source files** must include the Apache 2.0 license header. Use the appropriate comment syntax for each file type:

### SQL
```sql
-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
```

### Markdown (HTML comment)
```markdown
<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->
```

### PowerShell / Python / YAML
```powershell
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
```

---

## Security Requirements

Before any commit or pull request:

1. **NEVER** include Protected Health Information (PHI) or Personally Identifiable Information (PII)
2. **NEVER** hardcode credentials, API keys, or connection passwords
3. **NEVER** include real patient data, even in test files
4. Use only synthetic/fabricated test data
5. See [SECURITY.md](SECURITY.md) for the full security policy

---

## Questions?

Contact the project maintainer:

- **Kyle J. Coder** - Kyle.Coder@va.gov
- Advanced Analytics & Informatics Team
- Edward Hines Jr. VA Hospital

---

*Last updated: 2026-03-04 | Version: v0.1.0*
