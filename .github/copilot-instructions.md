<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Copilot Instructions - MH PostDischarge Dashboard

> These instructions guide GitHub Copilot's behavior when working within this project.
> File location: `.github/copilot-instructions.md`

---

## Project Context

You are assisting with the **MH PostDischarge Dashboard** project at the **Edward Hines Jr. VA Hospital** (Station 578), part of the U.S. Department of Veterans Affairs.

- **Purpose:** A PowerBI dashboard that identifies Veterans discharged from inpatient Mental Health wards (2S/2N) who have NOT completed a required post-discharge follow-up outpatient appointment within 7 calendar days.
- **Developer:** Kyle J. Coder, Power Platform Engineer/Fusion Developer, Advanced Analytics & Informatics Team
- **Key Stakeholder:** Heidi Mercurio, Chief Nurse, Nursing Services
- **Data Source:** VA Corporate Data Warehouse (CDW) via SQL Server `VhaCdwDwhSql33.vha.med.va.gov`, database `D03_VISN12Collab`
- **Reporting Platform:** PowerBI Gov Cloud (`app.powerbigov.us`), workspace "V12 Hines VA - Informatics"

---

## Coding Conventions

### Naming

- Use **camelCase** for all variable names, function names, file names, and identifiers
- SQL keywords should be **UPPERCASE** (`SELECT`, `FROM`, `WHERE`, `JOIN`, `AS`)
- SQL aliases and custom identifiers should be **camelCase**

### File Naming

- Use date prefixes where appropriate: `YYYY.MM.DD_fileName.ext` (e.g., `2026.03.04_initialQuery.sql`)
- Use semantic version prefixes for release artifacts: `vX.Y.Z_fileName.ext`
- Use `_template` prefix/suffix for template files (e.g., `_template.sql`)

### Formatting

- **Indentation:** 2 spaces for JSON, YAML, Markdown; 4 spaces for SQL, Python, PowerShell
- **Line endings:** LF (`\n`) — configured in `.editorconfig` and `.gitattributes`
- **Encoding:** UTF-8

---

## SQL Conventions

- Use **T-SQL** dialect (Microsoft SQL Server)
- Target server: `VhaCdwDwhSql33.vha.med.va.gov`
- Target database: `D03_VISN12Collab`
- CDW schema patterns: `CDWWork`, `Dim`, `Inpat`, `Outpat`, `SPatient`, etc.
- Always use **schema-qualified** table references (e.g., `[Inpat].[Inpatient]`)
- Use `WITH (NOLOCK)` hints on CDW read queries per VA conventions
- Prefer CTEs over nested subqueries for readability
- Always include a standard header comment block (see template in `src/sql/queries/_template.sql`)

---

## PowerBI Conventions

- Use the VA-branded theme from `config/powerbiTheme.json`
- DAX measure names should use camelCase (e.g., `countMissingFollowUp`)
- Format DAX with one clause per line for readability
- Document all measures in `src/powerbi/measures/`

---

## License Header Requirement

**Every source file** must begin with the Apache 2.0 license header. Use the comment syntax appropriate for the file type:

### SQL Files
```sql
-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
```

### Markdown Files
```markdown
<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->
```

### PowerShell / Python / YAML / Config Files
```powershell
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
```

---

## Security Rules (CRITICAL)

1. **NEVER generate, include, or reference real patient data** — no names, SSNs, dates of birth, or any PHI/PII
2. **NEVER hardcode credentials**, API keys, tokens, or passwords in any file
3. **NEVER store connection passwords** — all connections use Windows Integrated Security or Entra authentication
4. **NEVER generate fake but realistic-looking patient data** that could be mistaken for real data
5. When creating test/sample data, use obviously synthetic values (e.g., "Test Patient A", dates in the far future like 2099)
6. If asked to write SQL queries that reference patient tables, always include a comment noting that results contain PHI and should not be exported

---

## Documentation Standards

- Keep `CHANGELOG.md` updated with every functional change using Keep a Changelog format
- Use Architecture Decision Records (ADRs) in `docs/architecture/` for major design decisions
- Follow Conventional Commits format for commit messages
- Use semantic versioning (`vMAJOR.MINOR.PATCH`)
- Maintain verbose entries in `logs/devLog.md`

---

## VA Design System

When generating UI-related content, documentation, or PowerBI visuals:

- Reference the VA Design System: https://design.va.gov/
- Use approved VA color palette (see `config/powerbiTheme.json` and `docs/branding/vaBrandingReference.md`)
- Primary blue: `#003F72`
- Accent blue: `#0083BE`
- Red/alert: `#C4262E`

---

## Project Structure Reference

```
\root\
├── .github/          # GitHub config, Copilot instructions, workflows
├── .vscode/          # VS Code workspace settings
├── archive/          # Long-term archival storage
├── config/           # Configuration files (SQL profiles, PowerBI themes)
├── data/             # Sample/mock data only
├── docs/             # Documentation, ADRs, guides, branding
├── logs/             # Development logs
├── prompts/          # AI prompt templates
├── scripts/          # Automation scripts (PowerShell, Python, batch)
├── src/sql/          # SQL queries, stored procedures, views, migrations
├── src/powerbi/      # PowerBI templates, measures, dataflows
├── src/powerAutomate/ # Power Automate flow exports
├── src/powerApps/    # Power Apps source files
├── tests/            # Test scripts and data
```

---

## Commit Message Format

Follow Conventional Commits:
```
<type>(<scope>): <description>

Types: feat, fix, docs, style, refactor, test, chore
Scopes: sql, powerbi, docs, config, scripts, ci
```

---

*These instructions are version-controlled and updated as the project evolves.*
