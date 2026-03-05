<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# Changelog

All notable changes to the **MH PostDischarge Dashboard** project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Planned

- SQL stored procedures for CDW patient discharge data extraction
- PowerBI report with post-discharge follow-up compliance views
- PowerBI Gov Cloud deployment to V12 Hines VA - Informatics workspace
- Implementation guide for other VA facilities

---

## [v0.1.0] - 2026-03-04

### Added

- **Project Initialization** - Complete workspace scaffolding and configuration
  - Created project directory structure (~25 directories)
  - Created `.editorconfig` for cross-editor formatting consistency
  - Created `.gitignore` with comprehensive rules (mostly commented-out per development preferences)
  - Created `.gitattributes` with LF line endings, binary handling, and Git LFS for `.pbix` files
  - Created `.prettierrc` for Prettier code formatting
  - Created `LICENSE` with full Apache License 2.0 text
  - Created `SECURITY.md` with PHI/PII policy, HIPAA/FISMA compliance references
  - Created `.github/CODEOWNERS` assigning @KCoderVA as owner
  - Created `README.md` with project overview, tech stack, and getting started guide
  - Created `CHANGELOG.md` (this file)
  - Created `CONTRIBUTING.md` with coding standards and commit conventions
  - Created `docs/architecture/adr-001_projectOverview.md` (first Architecture Decision Record)
  - Created `docs/guides/implementationGuide.md` (placeholder for VA facility deployment guide)
  - Created `docs/branding/vaBrandingReference.md` (VA Design System color/font reference)
  - Created `logs/devLog.md` (running developer log)
  - Created `.github/copilot-instructions.md` (Copilot agent behavior rules)
  - Created `prompts/ai-prompts.md` (reusable AI prompt templates)
  - Created `prompts/copilot-snippets.md` (Copilot code snippet templates)
  - Created `.github/ISSUE_TEMPLATE/bugReport.md`
  - Created `.github/ISSUE_TEMPLATE/featureRequest.md`
  - Created `.github/ISSUE_TEMPLATE/dataQuestion.md`
  - Created `.github/PULL_REQUEST_TEMPLATE/pullRequestTemplate.md`
  - Created `.github/workflows/ci.yml` (CI pipeline: markdown lint, secret scan, license check)
  - Created `.github/workflows/changelog.yml` (automated changelog generation on release)
  - Created `.github/dependabot.yml` (GitHub Actions dependency updates)
  - Created SQL file templates with Apache 2.0 headers
  - Created `config/powerbiTheme.json` (VA-branded PowerBI theme)
  - Created `config/sqlConnectionProfiles.json` (non-sensitive connection metadata)
  - Created PowerShell automation scripts (changelog, license validation, snapshot export)
  - Created `.github/hooks/pre-commit` (comprehensive hooks with enable/disable toggles)
  - Created `.vscode/settings.json` (workspace-level settings)
  - Created `.vscode/tasks.json` (VS Code task definitions)
  - Created `.vscode/launch.json` (debug configurations)
  - Created `.vscode/extensions.json` (recommended extensions)
  - Initialized Python virtual environment (`.venv/`, excluded from Git)
  - Initialized Node.js `package.json`
- **Planning Documentation**
  - Created `newWorkspaceSetup_userInput.prompt` (13,188 character initialization specification)
  - Created `newWorkspace_initializationPlan.md` (comprehensive workspace initialization plan with 10 phases)

### Technical Notes

- Git repository initialized on `main` branch
- Remote origin: `https://github.com/KCoderVA/578-MH-postDischarge-dashboard.git`
- Git LFS enabled for `.pbix` file tracking
- Repository is **private** during development; a separate public repo will be created at v1.0
- All source files include Apache 2.0 license headers

---

[Unreleased]: https://github.com/KCoderVA/578-MH-postDischarge-dashboard/compare/v0.1.0...HEAD
[v0.1.0]: https://github.com/KCoderVA/578-MH-postDischarge-dashboard/releases/tag/v0.1.0
