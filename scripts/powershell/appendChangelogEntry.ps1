# ============================================================================
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
# ============================================================================
# Script:      appendChangelogEntry.ps1
# Author:      Kyle J. Coder (Kyle.Coder@va.gov)
# Created:     2026-03-04
# Version:     v0.1.0
# Description: Interactively appends a new entry to CHANGELOG.md with
#              timestamp and semantic version number.
# Usage:       pwsh -File scripts/powershell/appendChangelogEntry.ps1
# ============================================================================

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Version,

    [Parameter(Mandatory = $false)]
    [ValidateSet("Added", "Changed", "Deprecated", "Removed", "Fixed", "Security")]
    [string]$Category = "Added",

    [Parameter(Mandatory = $false)]
    [string]$Description
)

# Project root (navigate up from scripts/powershell/)
$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$changelogPath = Join-Path $projectRoot "CHANGELOG.md"

if (-not (Test-Path $changelogPath)) {
    Write-Error "CHANGELOG.md not found at: $changelogPath"
    exit 1
}

# Interactive prompts if parameters not provided
if (-not $Version) {
    $Version = Read-Host "Enter version number (e.g., v0.2.0)"
}

if (-not $Description) {
    $Description = Read-Host "Enter changelog description"
}

# Format the entry
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$dateOnly = Get-Date -Format "yyyy-MM-dd"

$newEntry = @"

## [$Version] - $dateOnly

### $Category

- $Description

> *Entry added: $timestamp*

"@

# Read existing changelog
$existingContent = Get-Content $changelogPath -Raw

# Insert after the [Unreleased] section
$insertPoint = $existingContent.IndexOf("---`n`n## [v")
if ($insertPoint -lt 0) {
    $insertPoint = $existingContent.IndexOf("---`r`n`r`n## [v")
}

if ($insertPoint -ge 0) {
    $beforeInsert = $existingContent.Substring(0, $insertPoint)
    $afterInsert = $existingContent.Substring($insertPoint)
    $updatedContent = $beforeInsert + "---`n" + $newEntry + "`n" + $afterInsert
} else {
    # Append to end if pattern not found
    $updatedContent = $existingContent + "`n" + $newEntry
}

# Write updated content
$updatedContent | Set-Content $changelogPath -NoNewline

Write-Host ""
Write-Host "Changelog entry added successfully!" -ForegroundColor Green
Write-Host "  Version:     $Version" -ForegroundColor Cyan
Write-Host "  Category:    $Category" -ForegroundColor Cyan
Write-Host "  Description: $Description" -ForegroundColor Cyan
Write-Host "  Timestamp:   $timestamp" -ForegroundColor Cyan
Write-Host "  File:        $changelogPath" -ForegroundColor DarkGray
