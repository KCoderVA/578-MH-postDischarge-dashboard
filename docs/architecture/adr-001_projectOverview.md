<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# ADR-001: Project Overview and Initial Architecture

| Field | Value |
|-------|-------|
| **ADR Number** | 001 |
| **Title** | Project Overview and Initial Architecture |
| **Status** | Accepted |
| **Date** | 2026-03-04 |
| **Author** | Kyle J. Coder (Kyle.Coder@va.gov) |
| **Stakeholder** | Heidi Mercurio, Chief Nurse (Heidi.Mercurio@va.gov) |

---

## Context

The Nursing Services department at Edward Hines Jr. VA Hospital (Station 578) requires a tool to monitor post-discharge follow-up compliance for Veterans discharged from the inpatient Mental Health wards (2S and 2N). VA policy and clinical best practice mandate that a post-discharge outpatient mental health appointment be completed within 7 calendar days of discharge. Currently there is no automated mechanism to identify patients who have fallen through the cracks.

The Advanced Analytics & Informatics Team has been asked to build a dashboard solution that will:

1. Query the VA Corporate Data Warehouse (CDW) to identify discharged MH inpatients
2. Cross-reference discharge records against completed outpatient appointments
3. Display a filtered exception list showing only patients without completed 7-day follow-up
4. Present this data in a web-hosted PowerBI report accessible to authorized Nursing leadership

---

## Decision

### Technology Choices

| Decision | Choice | Rationale |
|----------|--------|-----------|
| **Data Source** | VA CDW via SQL Server (`VhaCdwDwhSql33`) | Authoritative source for patient encounter data across the VA system |
| **Query Language** | T-SQL stored procedures | Standard for CDW queries; version-controlled; reusable across reports |
| **Target Database** | `D03_VISN12Collab` | VISN 12 collaborative database where stored procedures can be deployed |
| **Reporting** | PowerBI (Gov Cloud) | Enterprise-approved BI tool; Gov Cloud meets FedRAMP requirements |
| **PowerBI Workspace** | V12 Hines VA - Informatics | Team's existing managed workspace with appropriate access controls |
| **Source Control** | Git + GitHub (private repo) | Industry standard; enables version history, collaboration, and future public release |
| **IDE** | VS Code | Supports SQL, PowerShell, Python, PowerBI tooling, and Copilot AI assistance |
| **License** | Apache 2.0 | Permissive license enabling other VA facilities to adopt and modify |

### Architecture Pattern

The solution follows a standard **ETL + BI Reporting** pattern:

```
CDW SQL Server  -->  Stored Procedures  -->  PowerBI Dataset  -->  PowerBI Report
(Source Data)        (Transform/Filter)      (Semantic Model)     (User-Facing)
```

- **Extract**: SQL queries pull discharge and appointment data from CDW
- **Transform**: Stored procedures filter to MH wards, calculate 7-day windows, identify gaps
- **Load**: PowerBI connects via DirectQuery or Import to the stored procedure results
- **Present**: PowerBI report with filtered patient lists, date ranges, and status indicators

### Data Access Strategy

- **No PHI/PII in repository**: All patient data access is runtime-only
- **Authentication**: Microsoft Entra ID / Windows Integrated Security
- **Authorization**: PowerBI row-level security + CDW access groups
- **Compliance**: HIPAA, VA Directive 6500, FISMA, FedRAMP (Gov Cloud)

### Project Lifecycle

1. **v0.x.x** (Development): Private repository, iterative development on local workstation
2. **v1.0.0** (Release): Functional dashboard deployed to PowerBI Gov Cloud
3. **Post-v1.0**: Create separate public repository with sanitized templates for other VA facilities

---

## Consequences

### Positive

- Standardized, version-controlled approach to clinical decision support
- Replicable architecture that other VA facilities can adopt
- Clear separation of concerns (data, logic, presentation)
- Comprehensive documentation trail via Git history and ADRs

### Negative / Risks

- CDW data freshness depends on CDW ETL schedules (typically T+1 day)
- PowerBI DirectQuery may have performance implications with large datasets
- Single developer (Kyle J. Coder) creates bus factor risk
- Government IT restrictions may limit certain tooling choices

### Mitigations

- Document all architecture decisions via ADRs
- Maintain verbose CHANGELOG.md for knowledge continuity
- Create comprehensive implementation guide for knowledge transfer
- Use PowerBI Import mode with scheduled refresh if DirectQuery is too slow

---

## References

- [VA Design System](https://design.va.gov/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- Michael Nygard, [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

---

*This ADR was created as part of the v0.1.0 project initialization.*
