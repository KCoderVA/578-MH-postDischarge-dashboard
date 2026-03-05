-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
-- File:        _template.sql
-- Author:      Kyle J. Coder (Kyle.Coder@va.gov)
-- Created:     2026-03-04
-- Modified:    2026-03-04
-- Version:     v0.1.0
-- Description: Template for ad-hoc SQL queries against the VA CDW.
--              Copy this file and rename for each new query.
-- Database:    D03_VISN12Collab
-- Server:      VhaCdwDwhSql33.vha.med.va.gov
-- ============================================================================

-- ===========================================
-- QUERY: [Query Title]
-- PURPOSE: [Brief description of query purpose]
-- ===========================================

-- Uncomment and modify the USE statement if needed:
-- USE [D03_VISN12Collab]
-- GO

SELECT
    -- Column list here
    col1,
    col2
FROM [Schema].[TableName] WITH (NOLOCK)
WHERE Sta3n = 578
    -- Add additional filters here
ORDER BY col1 ASC;
