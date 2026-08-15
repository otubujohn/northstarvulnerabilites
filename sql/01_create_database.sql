USE master;
GO

IF DB_ID(N'NorthstarVulnIntel') IS NULL
BEGIN
    CREATE DATABASE NorthstarVulnIntel;
END;
GO

USE NorthstarVulnIntel;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'stg'
)
    EXEC('CREATE SCHEMA stg AUTHORIZATION dbo');
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'dim'
)
    EXEC('CREATE SCHEMA dim AUTHORIZATION dbo');
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'fact'
)
    EXEC('CREATE SCHEMA fact AUTHORIZATION dbo');
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'audit'
)
    EXEC('CREATE SCHEMA audit AUTHORIZATION dbo');
GO

