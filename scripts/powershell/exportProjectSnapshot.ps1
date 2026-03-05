# ============================================================================
# Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
# Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
# ============================================================================
# Script:      exportProjectSnapshot.ps1
# Author:      Kyle J. Coder (Kyle.Coder@va.gov)
# Created:     2026-03-04
# Version:     v0.1.0
# Description: Creates a dated archive snapshot of the project in
#              archive/snapshots/ for point-in-time backup.
# Usage:       pwsh -File scripts/powershell/exportProjectSnapshot.ps1
# ============================================================================

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Version,

    [Parameter(Mandatory = $false)]
    [string]$Label
)

# Project root
$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$snapshotsDir = Join-Path $projectRoot "archive\snapshots"

# Ensure snapshots directory exists
if (-not (Test-Path $snapshotsDir)) {
    New-Item -ItemType Directory -Path $snapshotsDir -Force | Out-Null
}

# Generate snapshot name
$dateStamp = Get-Date -Format "yyyy.MM.dd"
$timeStamp = Get-Date -Format "HHmmss"

if (-not $Version) {
    $Version = Read-Host "Enter current version (e.g., v0.1.0)"
}

if ($Label) {
    $snapshotName = "${dateStamp}_${Version}_${Label}"
} else {
    $snapshotName = "${dateStamp}_${Version}_snapshot_${timeStamp}"
}

$snapshotPath = Join-Path $snapshotsDir $snapshotName

Write-Host "Creating project snapshot..." -ForegroundColor Cyan
Write-Host "  Source:      $projectRoot" -ForegroundColor DarkGray
Write-Host "  Destination: $snapshotPath" -ForegroundColor DarkGray
Write-Host ""

# Directories and patterns to exclude from snapshot
$excludePatterns = @(
    ".git",
    ".venv",
    "node_modules",
    "archive\snapshots",
    "__pycache__"
)

# Create snapshot directory
New-Item -ItemType Directory -Path $snapshotPath -Force | Out-Null

# Copy files excluding patterns
$allItems = Get-ChildItem -Path $projectRoot -Recurse -Force -ErrorAction SilentlyContinue
$copiedCount = 0

foreach ($item in $allItems) {
    $relativePath = $item.FullName.Replace($projectRoot, "").TrimStart("\", "/")

    # Check exclusions
    $exclude = $false
    foreach ($pattern in $excludePatterns) {
        if ($relativePath -like "$pattern*" -or $relativePath -like "*\$pattern\*") {
            $exclude = $true
            break
        }
    }

    if (-not $exclude) {
        $destPath = Join-Path $snapshotPath $relativePath
        if ($item.PSIsContainer) {
            if (-not (Test-Path $destPath)) {
                New-Item -ItemType Directory -Path $destPath -Force | Out-Null
            }
        } else {
            $destDir = Split-Path $destPath -Parent
            if (-not (Test-Path $destDir)) {
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            }
            Copy-Item -Path $item.FullName -Destination $destPath -Force
            $copiedCount++
        }
    }
}

# Create snapshot manifest
$manifestContent = @"
# Snapshot Manifest
# Project: MH PostDischarge Dashboard
# Date:    $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
# Version: $Version
# Files:   $copiedCount
# Label:   $(if ($Label) { $Label } else { "N/A" })
"@

$manifestContent | Set-Content (Join-Path $snapshotPath "_snapshot_manifest.txt")

Write-Host "Snapshot created successfully!" -ForegroundColor Green
Write-Host "  Name:  $snapshotName" -ForegroundColor Cyan
Write-Host "  Files: $copiedCount" -ForegroundColor Cyan
Write-Host "  Path:  $snapshotPath" -ForegroundColor Cyan
