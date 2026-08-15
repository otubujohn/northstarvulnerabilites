USE NorthstarVulnIntel;
GO

CREATE TABLE dim.asset
(
    asset_key              INT IDENTITY(1,1) NOT NULL,
    asset_id               VARCHAR(30) NOT NULL,
    hostname               VARCHAR(100) NOT NULL,

    asset_type             VARCHAR(50) NOT NULL,
    business_unit          VARCHAR(100) NOT NULL,
    location_name          VARCHAR(100) NOT NULL,

    os_family              VARCHAR(50) NULL,
    os_version             VARCHAR(100) NULL,

    criticality            TINYINT NOT NULL,

    internet_exposed       BIT NOT NULL,
    patient_care_support   BIT NOT NULL,
    sensitive_data         BIT NOT NULL,
    production             BIT NOT NULL,

    first_seen_date        DATE NOT NULL,
    last_seen_date         DATE NOT NULL,

    asset_status           VARCHAR(20) NOT NULL,

    CONSTRAINT PK_dim_asset
        PRIMARY KEY (asset_key),

    CONSTRAINT UQ_dim_asset_asset_id
        UNIQUE (asset_id),

    CONSTRAINT CK_dim_asset_criticality
        CHECK (criticality BETWEEN 1 AND 5),

    CONSTRAINT CK_dim_asset_dates
        CHECK (last_seen_date >= first_seen_date)
);
GO