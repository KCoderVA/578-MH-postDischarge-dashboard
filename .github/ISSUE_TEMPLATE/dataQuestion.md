---
name: Data Question
about: Ask a question about data sources, schemas, or clinical data logic
title: "[DATA] "
labels: question, data
assignees: KCoderVA
---

<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Licensed under the Apache License, Version 2.0 -->

## Clinical Context

Describe the clinical or business context for this data question.

## Data Source

- **Server:** [e.g., VhaCdwDwhSql33.vha.med.va.gov]
- **Database:** [e.g., D03_VISN12Collab]
- **Table(s)/Schema(s):** [e.g., Inpat.Inpatient, Outpat.Visit]

## Question

A clear and specific data question. For example:
- "Which CDW table contains the ward location for inpatient admissions?"
- "How are MH stop codes identified in the Outpat schema?"
- "What is the correct join between discharge and follow-up appointment records?"

## Expected Output

Describe what kind of answer or data you're looking for.

## Urgency

- [ ] Low - General knowledge question
- [ ] Medium - Needed for current development sprint
- [ ] High - Blocking development progress
- [ ] Critical - Production data issue

## Additional Context

Add any SQL snippets, CDW documentation references, or other relevant details.

> **IMPORTANT:** Do NOT include any PHI/PII, patient names, SSNs, or other sensitive data.
