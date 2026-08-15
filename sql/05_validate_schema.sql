USE NorthstarVulnIntel;
GO

-- Check schemas
SELECT
    name AS schema_name
FROM sys.schemas
WHERE name IN ('stg', 'dim', 'fact', 'audit')
ORDER BY name;
GO

-- Check our tables
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;
GO

-- Check asset columns
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dim'
  AND TABLE_NAME = 'asset'
ORDER BY ORDINAL_POSITION;
GO

-- Check vulnerability columns
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dim'
  AND TABLE_NAME = 'vulnerability'
ORDER BY ORDINAL_POSITION;
GO

-- Confirm tables currently contain no data
SELECT
    (SELECT COUNT(*) FROM dim.asset) AS asset_rows,
    (SELECT COUNT(*) FROM dim.vulnerability) AS vulnerability_rows,
    (SELECT COUNT(*) FROM fact.asset_vulnerability) AS finding_rows;
GO