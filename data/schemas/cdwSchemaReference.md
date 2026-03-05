<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Data Schema Documentation

> This directory contains documentation for the data schemas used by the
> MH PostDischarge Dashboard project.

---

## CDW Tables Used

The following VA Corporate Data Warehouse (CDW) tables are anticipated for use in this project.
This list will be updated as SQL development progresses.

### Inpatient Data

| Schema | Table | Purpose |
|--------|-------|---------|
| `[Inpat]` | `[Inpatient]` | Inpatient admission records |
| `[Inpat]` | `[InpatientDischarge]` | Inpatient discharge records |
| `[Inpat]` | `[InpatientDiagnosis]` | Diagnoses associated with inpatient stays |

### Outpatient Data

| Schema | Table | Purpose |
|--------|-------|---------|
| `[Outpat]` | `[Visit]` | Outpatient visit/encounter records |
| `[Outpat]` | `[Workload]` | Outpatient workload with stop codes |
| `[Outpat]` | `[WorkloadVDiagnosis]` | Outpatient diagnoses |

### Patient Demographics

| Schema | Table | Purpose |
|--------|-------|---------|
| `[SPatient]` | `[SPatient]` | Core patient demographics |
| `[SPatient]` | `[SPatientAddress]` | Patient address (for contact follow-up) |

### Dimension Tables

| Schema | Table | Purpose |
|--------|-------|---------|
| `[Dim]` | `[WardLocation]` | Ward names and identifiers (2S, 2N) |
| `[Dim]` | `[StopCode]` | Clinic stop codes (MH stop codes for outpatient filtering) |
| `[Dim]` | `[Division]` | Station/facility identifiers |

---

## Key Columns

### Station Filter
- `Sta3n = 578` — Edward Hines Jr. VA Hospital

### Ward Identifiers
- `WardLocationName IN ('2S', '2N')` — Mental Health inpatient wards

### Mental Health Stop Codes
- Primary stop codes for MH outpatient encounters (to be confirmed during development):
  - `502` - Mental Health Clinic - Individual
  - `509` - Mental Health Clinic - Group
  - `510` - Mental Health Clinic - Other
  - Additional stop codes TBD based on CDW data dictionary

---

## Data Flow Diagram

```
CDW SQL Server (VhaCdwDwhSql33)
    │
    ├── [Inpat].[Inpatient] ──── Admission/Discharge records
    │                              │
    ├── [Dim].[WardLocation] ──── Filter: 2S, 2N wards
    │                              │
    ├── [Outpat].[Visit] ──────── Post-discharge appointments
    │                              │
    ├── [Dim].[StopCode] ──────── Filter: MH stop codes
    │                              │
    ├── [SPatient].[SPatient] ─── Patient demographics
    │                              │
    └── Stored Procedure ─────────┘
         (D03_VISN12Collab)
              │
              ▼
         PowerBI Dataset
         (DirectQuery or Import)
              │
              ▼
         PowerBI Report
         (Gov Cloud - app.powerbigov.us)
              │
              ▼
         End Users
         (Nursing Leadership)
```

---

## Important Notes

- All data access uses Windows Integrated Security (no stored credentials)
- CDW data freshness is typically T+1 (one business day lag)
- Always use `WITH (NOLOCK)` hints on CDW read queries
- Patient-level data is PHI — never store in repository files

---

*This schema documentation will be expanded as the SQL queries and stored procedures are developed.*
*Last updated: 2026-03-04*
