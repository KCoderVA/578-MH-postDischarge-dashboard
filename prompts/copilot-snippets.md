<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Copilot Code Snippets - MH PostDischarge Dashboard

> Reusable code snippet patterns for Copilot to reference when generating code
> within this project. These ensure consistent output aligned to project conventions.

---

## SQL Snippets

### Standard Query File Header

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
-- Description: [Brief description of query purpose]
-- Database:    D03_VISN12Collab
-- Server:      VhaCdwDwhSql33.vha.med.va.gov
-- ============================================================================
```

### Standard Stored Procedure Template

```sql
-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
-- Procedure:   [dbo].[usp_procedureName]
-- Author:      Kyle J. Coder (Kyle.Coder@va.gov)
-- Created:     [YYYY-MM-DD]
-- Modified:    [YYYY-MM-DD]
-- Version:     [vX.Y.Z]
-- Description: [Description of what this procedure does]
-- Parameters:
--   @paramName  [dataType]  - [Description]
-- Returns:     [Description of result set or return value]
-- ============================================================================

USE [D03_VISN12Collab]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[usp_procedureName]
    @paramName DATATYPE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Query logic here
        SELECT
            columnName
        FROM [Schema].[TableName] WITH (NOLOCK)
        WHERE Sta3n = 578
    END TRY
    BEGIN CATCH
        DECLARE @errorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @errorSeverity INT = ERROR_SEVERITY();
        DECLARE @errorState INT = ERROR_STATE();

        RAISERROR(@errorMessage, @errorSeverity, @errorState);
    END CATCH
END
GO
```

### CDW Query Pattern (Discharge + Follow-Up)

```sql
-- Pattern: Identify MH discharges without 7-day follow-up
;WITH dischargedPatients AS (
    SELECT
        pat.PatientICN,
        pat.PatientName,
        inp.DischargeDateTime,
        inp.WardLocationSID,
        ward.WardLocationName,
        DATEADD(DAY, 7, inp.DischargeDateTime) AS followUpDeadline
    FROM [Inpat].[Inpatient] inp WITH (NOLOCK)
    INNER JOIN [SPatient].[SPatient] pat WITH (NOLOCK)
        ON inp.PatientSID = pat.PatientSID
    INNER JOIN [Dim].[WardLocation] ward WITH (NOLOCK)
        ON inp.WardLocationSID = ward.WardLocationSID
    WHERE inp.Sta3n = 578
        AND ward.WardLocationName IN ('2S', '2N')
        AND inp.DischargeDateTime IS NOT NULL
),
completedFollowUps AS (
    SELECT
        outVisit.PatientSID,
        outVisit.VisitDateTime
    FROM [Outpat].[Visit] outVisit WITH (NOLOCK)
    WHERE outVisit.Sta3n = 578
        -- Add MH stop code filters here
)
SELECT
    dp.PatientICN,
    dp.PatientName,
    dp.WardLocationName,
    dp.DischargeDateTime,
    dp.followUpDeadline,
    DATEDIFF(DAY, dp.DischargeDateTime, GETDATE()) AS daysSinceDischarge
FROM dischargedPatients dp
LEFT JOIN completedFollowUps cfu
    ON dp.PatientICN = cfu.PatientSID  -- Adjust join key as needed
    AND cfu.VisitDateTime BETWEEN dp.DischargeDateTime AND dp.followUpDeadline
WHERE cfu.PatientSID IS NULL  -- No follow-up found
ORDER BY dp.DischargeDateTime ASC;
```

---

## PowerShell Snippets

### Standard Script Header

```powershell
# ============================================================================
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
# ============================================================================
# Script:      [scriptName.ps1]
# Author:      Kyle J. Coder (Kyle.Coder@va.gov)
# Created:     [YYYY-MM-DD]
# Version:     [vX.Y.Z]
# Description: [Description]
# ============================================================================
```

---

## DAX Snippets

### Standard Measure Pattern

```dax
// Measure: countMissingFollowUp
// Description: Counts patients without completed 7-day post-discharge follow-up
// Author: Kyle J. Coder
// Version: vX.Y.Z
countMissingFollowUp =
CALCULATE(
    COUNTROWS('DischargePatients'),
    FILTER(
        'DischargePatients',
        'DischargePatients'[followUpCompleted] = FALSE()
            && 'DischargePatients'[daysSinceDischarge] > 7
    )
)
```

---

## Markdown Snippets

### Standard File Header

```markdown
<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->
```

### ADR Template

```markdown
# ADR-NNN: [Title]

| Field | Value |
|-------|-------|
| **ADR Number** | NNN |
| **Title** | [Title] |
| **Status** | Proposed / Accepted / Deprecated / Superseded |
| **Date** | YYYY-MM-DD |
| **Author** | Kyle J. Coder (Kyle.Coder@va.gov) |

## Context
[Why is this decision needed?]

## Decision
[What was decided?]

## Consequences
### Positive
- [Benefit]

### Negative / Risks
- [Risk]

### Mitigations
- [How risks are addressed]
```

---

*Add new snippet patterns as development patterns emerge. Last updated: 2026-03-04*
