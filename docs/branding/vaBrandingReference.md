<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team -->
<!-- Licensed under the Apache License, Version 2.0 -->
<!-- http://www.apache.org/licenses/LICENSE-2.0 -->

# VA Design System - Branding Reference

> Quick reference for VA Design System colors, typography, and visual standards
> as applied to the MH PostDischarge Dashboard PowerBI reports.
>
> Full VA Design System: https://design.va.gov/

---

## Color Palette

### Primary Colors (from VA Design System)

| Swatch | Hex | Name | Usage |
|--------|-----|------|-------|
| ![#003F72](https://via.placeholder.com/20/003F72/003F72) | `#003F72` | VA Primary Blue (Dark) | Headers, primary actions, table headers |
| ![#0083BE](https://via.placeholder.com/20/0083BE/0083BE) | `#0083BE` | VA Primary Blue (Medium) | Links, secondary data series |
| ![#205493](https://via.placeholder.com/20/205493/205493) | `#205493` | VA Blue (Alt) | Totals row, accents |
| ![#02BFE7](https://via.placeholder.com/20/02BFE7/02BFE7) | `#02BFE7` | VA Cyan / Accent | Highlights, info callouts |

### Alert / Status Colors

| Swatch | Hex | Name | Usage |
|--------|-----|------|-------|
| ![#C4262E](https://via.placeholder.com/20/C4262E/C4262E) | `#C4262E` | VA Red | Alerts, errors, critical status, overdue items |
| ![#772432](https://via.placeholder.com/20/772432/772432) | `#772432` | VA Maroon | Secondary alert, severe status |
| ![#2E8540](https://via.placeholder.com/20/2E8540/2E8540) | `#2E8540` | VA Green | Success, completed, on-track |
| ![#FDB81E](https://via.placeholder.com/20/FDB81E/FDB81E) | `#FDB81E` | VA Gold/Yellow | Warning, approaching deadline |
| ![#F3CF45](https://via.placeholder.com/20/F3CF45/F3CF45) | `#F3CF45` | VA Yellow (Light) | Caution, informational |

### Data Visualization Colors

| Order | Hex | Description |
|-------|-----|-------------|
| 1 | `#003F72` | Primary data series |
| 2 | `#0083BE` | Secondary data series |
| 3 | `#C4262E` | Alert / exception data |
| 4 | `#772432` | Severe / critical data |
| 5 | `#598527` | Positive / success data |
| 6 | `#F3CF45` | Warning data |
| 7 | `#F7955B` | Tertiary data series |
| 8 | `#839097` | Neutral / inactive |
| 9 | `#DCDDDE` | Background / disabled |
| 10 | `#CCCC99` | Extended palette |
| 11 | `#BEC292` | Extended palette |

### Neutral / Gray Scale

| Hex | Usage |
|-----|-------|
| `#212121` | Primary text |
| `#565C65` | Secondary text, labels |
| `#839097` | Tertiary text, borders |
| `#DCDDDE` | Light borders, dividers |
| `#F1F1F1` | Page background |
| `#FFFFFF` | Card/container background |

---

## Typography

### Recommended Fonts

| Priority | Font | Fallback |
|----------|------|----------|
| 1st | **Source Sans Pro** | VA Design System primary typeface |
| 2nd | **Segoe UI** | Windows system font (PowerBI default) |
| 3rd | **Arial** | Universal fallback |

### Font Sizes (PowerBI)

| Element | Size |
|---------|------|
| Report title | 18pt |
| Section header | 14pt |
| Card value (KPI) | 32-36pt |
| Card label | 12pt |
| Table header | 11pt |
| Table data | 10pt |
| Axis labels | 10pt |
| Tooltip text | 10pt |

---

## Dashboard-Specific Color Assignments

For the MH PostDischarge Dashboard, the following color coding communicates patient follow-up status:

| Status | Color | Hex | Meaning |
|--------|-------|-----|---------|
| **Overdue** | Red | `#C4262E` | >7 days since discharge, no follow-up completed |
| **At Risk** | Yellow/Gold | `#FDB81E` | 5-7 days since discharge, no follow-up yet |
| **Approaching** | Light Yellow | `#F3CF45` | 3-5 days since discharge, no follow-up yet |
| **Pending** | Blue | `#0083BE` | 0-3 days since discharge, within window |
| **Completed** | Green | `#2E8540` | Follow-up appointment completed within 7 days |

---

## VA References

- VA Design System Foundation: https://design.va.gov/foundation/
- VA Color Palette: https://design.va.gov/foundation/color-palette
- VA Typography: https://design.va.gov/foundation/typography
- VA Content Style Guide: https://design.va.gov/content-style-guide/
- VA Patterns: https://design.va.gov/patterns/
- VA Components: https://design.va.gov/components/

---

## PowerBI Theme File

The corresponding PowerBI JSON theme file is located at:
`config/powerbiTheme.json`

Import this file into PowerBI Desktop via:
**View > Themes > Browse for themes > Select `powerbiTheme.json`**

---

## Existing VA Assets

The following existing VA assets from previous projects have been referenced:

| Asset | Source Path | Status |
|-------|------------|--------|
| VA Branded Theme (legacy) | `S:\...\PowerBI - Misc Files\578 PBI Files\VA-Branded-Theme.json` | Updated and modernized into `config/powerbiTheme.json` |
| PBI Template File | `S:\...\PowerBI - Misc Files\578 PBI Files\PBI Template File.pbit` | Copied to `src/powerbi/templates/` for reference |

---

*Last updated: 2026-03-04 | Version: v0.1.0*
