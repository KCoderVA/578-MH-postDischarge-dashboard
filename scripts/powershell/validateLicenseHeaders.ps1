# ============================================================================
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
# ============================================================================
# Script:      validateLicenseHeaders.ps1
# Author:      Kyle J. Coder (Kyle.Coder@va.gov)
# Created:     2026-03-04
# Version:     v0.1.0
# Description: Scans source files for missing Apache 2.0 license headers.
#              Reports files that are missing the required header.
# Usage:       pwsh -File scripts/powershell/validateLicenseHeaders.ps1
# ============================================================================

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Path,

    [Parameter(Mandatory = $false)]
    [switch]$FixMissing
)

# Project root
if (-not $Path) {
    $Path = Resolve-Path (Join-Path $PSScriptRoot "..\..")
}

Write-Host "Scanning for missing Apache 2.0 license headers..." -ForegroundColor Cyan
Write-Host "Root: $Path" -ForegroundColor DarkGray
Write-Host ""

# File extensions to check with their expected license patterns
$filePatterns = @{
    "*.sql" = "Apache License"
    "*.ps1" = "Apache License"
    "*.py"  = "Apache License"
    "*.js"  = "Apache License"
    "*.yml" = "Apache License"
    "*.yaml" = "Apache License"
    "*.md"  = "Apache License"
}

# Directories to skip
$excludeDirs = @(
    ".git",
    ".venv",
    "node_modules",
    "archive",
    ".vscode"
)

$totalFiles = 0
$missingHeader = @()
$passedFiles = 0

foreach ($pattern in $filePatterns.Keys) {
    $expectedText = $filePatterns[$pattern]
    $files = Get-ChildItem -Path $Path -Filter $pattern -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object {
            $skip = $false
            foreach ($excludeDir in $excludeDirs) {
                if ($_.FullName -like "*\$excludeDir\*" -or $_.FullName -like "*/$excludeDir/*") {
                    $skip = $true
                    break
                }
            }
            # Also skip template files and the LICENSE file itself
            if ($_.Name -eq "LICENSE" -or $_.Name -like "_template*") {
                $skip = $true
            }
            -not $skip
        }

    foreach ($file in $files) {
        $totalFiles++
        $content = Get-Content $file.FullName -TotalCount 10 -ErrorAction SilentlyContinue
        $headerText = $content -join "`n"

        if ($headerText -notmatch $expectedText) {
            $missingHeader += [PSCustomObject]@{
                File      = $file.FullName.Replace($Path, "").TrimStart("\", "/")
                Extension = $file.Extension
            }
        } else {
            $passedFiles++
        }
    }
}

# Report results
Write-Host "Scan Results:" -ForegroundColor White
Write-Host "  Total files scanned: $totalFiles" -ForegroundColor Cyan
Write-Host "  Files with header:   $passedFiles" -ForegroundColor Green
Write-Host "  Files missing header: $($missingHeader.Count)" -ForegroundColor $(if ($missingHeader.Count -gt 0) { "Yellow" } else { "Green" })
Write-Host ""

if ($missingHeader.Count -gt 0) {
    Write-Host "Files missing Apache 2.0 license header:" -ForegroundColor Yellow
    foreach ($missing in $missingHeader) {
        Write-Host "  - $($missing.File)" -ForegroundColor Yellow
    }
    Write-Host ""
    Write-Host "Add the appropriate license header to these files." -ForegroundColor DarkGray
    Write-Host "See CONTRIBUTING.md for header formats by file type." -ForegroundColor DarkGray
} else {
    Write-Host "All scanned files have Apache 2.0 license headers." -ForegroundColor Green
}
