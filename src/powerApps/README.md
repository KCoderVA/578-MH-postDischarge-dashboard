<!-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs -->
<!-- Licensed under the Apache License, Version 2.0 -->

# Power Apps Source Files

> Placeholder directory for canvas Power App source files related to the
> MH PostDischarge Dashboard project.

## Purpose

This directory will contain Power Apps source files if/when a companion
canvas app is developed for this project. Files may include:

- Packaged `.msapp` binary files
- Unpacked source files extracted via the Power Platform CLI (`pac canvas unpack`)

## Potential Use Cases

- Mobile-friendly companion app for ward nurses
- Data entry form for recording follow-up appointment outcomes
- Action tracking app for follow-up case management

## Environment

- Power Apps Gov Cloud: `make.gov.powerapps.us`
- Power Platform CLI: `pac` (Power Apps Component framework CLI)
- Tenant: U.S. Department of Veterans Affairs

## Unpacking Canvas Apps

To unpack a `.msapp` file for source control:

```bash
pac canvas unpack --msapp "AppName.msapp" --sources "src/"
```

To repack source files into `.msapp`:

```bash
pac canvas pack --sources "src/" --msapp "AppName.msapp"
```

---

*This directory is a placeholder. Content will be added when Power Apps development begins.*
