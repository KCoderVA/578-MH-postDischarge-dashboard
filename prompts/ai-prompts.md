<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# AI Prompt Templates - MH PostDischarge Dashboard

> Reusable prompts for interacting with GitHub Copilot and other AI assistants
> during development of this project.

---

## Table of Contents

- [SQL Development Prompts](#sql-development-prompts)
- [PowerBI Prompts](#powerbi-prompts)
- [Documentation Prompts](#documentation-prompts)
- [Code Review Prompts](#code-review-prompts)
- [Troubleshooting Prompts](#troubleshooting-prompts)

---

## SQL Development Prompts

### New Query from Template

```
Create a new T-SQL query for the MH PostDischarge Dashboard project.
- Target server: VhaCdwDwhSql33.vha.med.va.gov
- Target database: D03_VISN12Collab
- Include the Apache 2.0 license header block
- Use UPPERCASE for SQL keywords
- Use camelCase for aliases
- Use WITH (NOLOCK) hints on CDW tables
- Include the standard file metadata comment block (Author, Date, Version, Description)
- Purpose: [DESCRIBE THE QUERY PURPOSE HERE]
```

### Stored Procedure Scaffold

```
Create a new T-SQL stored procedure scaffold for the MH PostDischarge Dashboard.
- Database: D03_VISN12Collab on VhaCdwDwhSql33
- Include Apache 2.0 license header
- Include standard metadata block (Author, Date, Version, Description, Parameters)
- Use SET NOCOUNT ON
- Include TRY/CATCH error handling
- Procedure name should follow camelCase convention
- Purpose: [DESCRIBE THE STORED PROCEDURE PURPOSE HERE]
```

### CDW Discharge Query Pattern

```
Write a T-SQL query that identifies Veterans discharged from Mental Health
inpatient wards (2S/2N) at Station 578 (Edward Hines Jr. VA Hospital) using
the VA Corporate Data Warehouse (CDW).

Key CDW tables to consider:
- [Inpat].[Inpatient] or [Inpat].[InpatientDischarge]
- [Outpat].[Visit] or [Outpat].[Workload]
- [SPatient].[SPatient]
- [Dim].[WardLocation]

Requirements:
- Filter to Station 578 (Sta3n = 578)
- Filter to MH wards 2S and 2N
- Calculate 7-day post-discharge window
- Cross-reference against completed outpatient MH appointments
- Return only patients WITHOUT a completed follow-up within 7 days
- DO NOT include real patient data in the query output or comments
```

---

## PowerBI Prompts

### DAX Measure

```
Create a DAX measure for the MH PostDischarge Dashboard PowerBI report.
- Use camelCase naming
- Format with one clause per line
- Include a comment documenting the measure's purpose
- Measure name: [NAME]
- Purpose: [DESCRIBE THE MEASURE]
```

### Report Design

```
Suggest a PowerBI report page layout for the MH PostDischarge Dashboard.
- Target audience: Nursing leadership (Chief Nurse and team)
- VA Design System colors (primary: #003F72, accent: #0083BE, alert: #C4262E)
- Key data points: patient name, discharge date, ward, days since discharge, follow-up status
- Include filter options for date range, ward, and status
- Design for clarity and actionability — this is an exception/action report
```

---

## Documentation Prompts

### Architecture Decision Record

```
Create a new Architecture Decision Record (ADR) for the MH PostDischarge Dashboard.
Follow the Michael Nygard format with the following sections:
- ADR Number, Title, Status, Date, Author
- Context, Decision, Consequences (Positive, Negative, Mitigations)
- References

ADR Topic: [DESCRIBE THE ARCHITECTURAL DECISION]
```

### Changelog Entry

```
Write a CHANGELOG.md entry for the MH PostDischarge Dashboard.
Follow Keep a Changelog format with the categories: Added, Changed, Deprecated,
Removed, Fixed, Security.
Use semantic versioning (vX.Y.Z).

Changes to document:
[DESCRIBE WHAT CHANGED]
```

---

## Code Review Prompts

### SQL Review

```
Review this SQL query for the MH PostDischarge Dashboard project. Check for:
1. Correct use of CDW table/schema references
2. Proper use of WITH (NOLOCK) hints
3. SQL injection vulnerabilities
4. Performance considerations (missing indexes, unnecessary joins)
5. Correct 7-day window calculation logic
6. No hardcoded patient data or credentials
7. Apache 2.0 license header present
8. camelCase naming conventions
```

### General Review

```
Review this file for compliance with the MH PostDischarge Dashboard project standards:
1. Apache 2.0 license header present
2. camelCase naming conventions followed
3. No PHI/PII or credentials present
4. Proper formatting per .editorconfig
5. Documentation is clear and complete
```

---

## Troubleshooting Prompts

### SQL Connection Issues

```
I'm having trouble connecting to the CDW SQL Server for the MH PostDischarge Dashboard.
Connection details:
- Server: VhaCdwDwhSql33.vha.med.va.gov
- Database: D03_VISN12Collab
- Auth: Windows Integrated Security
- VS Code extension: ms-mssql.mssql

Error message: [PASTE ERROR HERE]

Help me diagnose and resolve this connection issue.
```

### PowerBI Refresh Issues

```
The PowerBI report for the MH PostDischarge Dashboard is experiencing
data refresh issues in the PowerBI Gov Cloud service.
- Workspace: V12 Hines VA - Informatics
- URL: https://app.powerbigov.us/groups/f9a21156-7cbd-49e0-8cec-3b7b6e47b9e9/list
- Data source: SQL Server DirectQuery/Import to D03_VISN12Collab

Error: [PASTE ERROR HERE]
```

---

*Add new prompt templates as development patterns emerge. Last updated: 2026-03-04*
