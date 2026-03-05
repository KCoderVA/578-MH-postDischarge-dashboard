<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Security Policy

## Project: MH PostDischarge Dashboard

**Repository:** [578-MH-postDischarge-dashboard](https://github.com/KCoderVA/578-MH-postDischarge-dashboard)
**Maintainer:** Kyle J. Coder (Kyle.Coder@va.gov)
**Organization:** Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team

---

## Protected Health Information (PHI/PII) Policy

This project is designed to display sensitive patient healthcare data from the U.S. Department of Veterans Affairs Corporate Data Warehouse (CDW). The following policies are strictly enforced:

### What This Repository Does NOT Contain

- **No live patient data** is stored in this repository, on disk, or in Git history
- **No Protected Health Information (PHI)** as defined by HIPAA
- **No Personally Identifiable Information (PII)** of Veterans, staff, or any individuals
- **No database credentials**, connection passwords, API keys, or authentication tokens
- **No Social Security Numbers (SSNs)**, dates of birth, or patient identifiers

### How Sensitive Data Is Handled

All sensitive data access is handled at **runtime** through:

1. **Microsoft Entra ID (Azure Active Directory)** authentication
2. **Windows Integrated Security** for SQL Server connections
3. **Role-based access control (RBAC)** managed by VA enterprise IT
4. **PowerBI Gov Cloud row-level security** based on user identity

No credentials are ever stored in source code, configuration files, or environment variables within this repository.

### Test and Sample Data

Any test or sample data included in this repository uses:

- Completely fabricated/synthetic data with no relation to real patients
- Anonymized structural examples that demonstrate data schema only
- Clearly labeled mock datasets in the `data/sample/` directory

---

## Reporting Security Vulnerabilities

If you discover a security vulnerability in this project, please follow responsible disclosure:

### For VA Employees

1. **Do NOT** open a public GitHub issue
2. Contact the maintainer directly: **Kyle.Coder@va.gov**
3. If the issue involves PHI/PII exposure, also contact your **Information Security Officer (ISO)**
4. Follow VA Directive 6500 and VA Handbook 6500.3 for incident reporting

### For External Contributors

1. **Do NOT** open a public GitHub issue for security vulnerabilities
2. Email the maintainer at **Kyle.Coder@va.gov** with:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact assessment
3. Allow reasonable time for a fix before any public disclosure

---

## Security Best Practices for Contributors

### Before Committing Code

- [ ] Verify no PHI/PII is present in any files
- [ ] Verify no credentials, API keys, or tokens are hardcoded
- [ ] Verify no connection strings contain passwords
- [ ] Verify sample/test data uses only synthetic information
- [ ] Verify `.gitignore` excludes sensitive file types (.env, *.key, etc.)

### SQL Query Safety

- Always use parameterized queries where applicable
- Never include patient identifiers in commented-out code examples
- Use Windows Integrated Security (no stored passwords)
- Reference database schemas and column names only; never include actual data values

### PowerBI Safety

- PowerBI reports connect to data sources using delegated Entra authentication
- Row-level security filters data based on the viewing user's permissions
- Published reports are hosted on PowerBI Gov Cloud (`app.powerbigov.us`)

---

## Compliance References

| Standard | Description |
|----------|-------------|
| **HIPAA** | Health Insurance Portability and Accountability Act |
| **VA Directive 6500** | VA Information Security Program |
| **VA Handbook 6500.3** | Assessment, Authorization, and Continuous Monitoring of VA Information Systems |
| **FISMA** | Federal Information Security Modernization Act |
| **NIST SP 800-53** | Security and Privacy Controls for Information Systems |
| **FedRAMP** | Federal Risk and Authorization Management Program (for cloud services) |

---

## Supported Versions

| Version | Supported |
|---------|-----------|
| v0.x.x (Development) | Current development branch |

Security updates will be applied to the latest development version.

---

*Last updated: 2026-03-04*
