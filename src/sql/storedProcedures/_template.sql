-- ============================================================================
-- Copyright 2026 Kyle J. Coder, U.S. Department of Veterans Affairs
-- Edward Hines Jr. VA Hospital - Advanced Analytics & Informatics Team
--
-- Licensed under the Apache License, Version 2.0
-- http://www.apache.org/licenses/LICENSE-2.0
-- ============================================================================
-- Procedure:   [dbo].[usp_procedureName]
-- Author:      Kyle J. Coder (Kyle.Coder@va.gov)
-- Created:     2026-03-04
-- Modified:    2026-03-04
-- Version:     v0.1.0
-- Description: Template for stored procedures in D03_VISN12Collab.
--              Copy this file and rename for each new stored procedure.
-- Parameters:
--   @startDate   DATE    - Start of reporting date range
--   @endDate     DATE    - End of reporting date range
-- Returns:     Result set of [description]
-- ============================================================================

USE [D03_VISN12Collab]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================
-- Drop existing procedure if it exists (for development only)
-- ============================================================================
-- IF OBJECT_ID('[dbo].[usp_procedureName]', 'P') IS NOT NULL
--     DROP PROCEDURE [dbo].[usp_procedureName]
-- GO

CREATE OR ALTER PROCEDURE [dbo].[usp_procedureName]
    @startDate DATE = NULL,
    @endDate   DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Default date range to last 30 days if not specified
    IF @startDate IS NULL
        SET @startDate = DATEADD(DAY, -30, CAST(GETDATE() AS DATE));
    IF @endDate IS NULL
        SET @endDate = CAST(GETDATE() AS DATE);

    BEGIN TRY
        -- ====================================================================
        -- Main query logic
        -- ====================================================================

        SELECT
            -- Column list here
            col1,
            col2,
            col3
        FROM [Schema].[TableName] WITH (NOLOCK)
        WHERE Sta3n = 578
            AND dateColumn BETWEEN @startDate AND @endDate
        ORDER BY col1 ASC;

    END TRY
    BEGIN CATCH
        -- Error handling
        DECLARE @errorMessage  NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @errorSeverity INT            = ERROR_SEVERITY();
        DECLARE @errorState    INT            = ERROR_STATE();
        DECLARE @errorLine     INT            = ERROR_LINE();
        DECLARE @errorProc     NVARCHAR(200)  = ERROR_PROCEDURE();

        -- Log error details (optional: write to an error log table)
        PRINT 'Error in ' + ISNULL(@errorProc, 'Unknown') +
              ' at line ' + CAST(@errorLine AS NVARCHAR(10)) +
              ': ' + @errorMessage;

        RAISERROR(@errorMessage, @errorSeverity, @errorState);
    END CATCH
END
GO

-- ============================================================================
-- Grant execute permissions (uncomment and modify as needed)
-- ============================================================================
-- GRANT EXECUTE ON [dbo].[usp_procedureName] TO [role_or_user];
-- GO
