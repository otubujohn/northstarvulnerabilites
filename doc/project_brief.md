# Data Model and Grain

## dim_asset
One row = one Northstar technology asset.

Primary key:
asset_id

## dim_vulnerability
One row = one unique CVE.

Primary key:
cve_id

## dim_software
One row = one unique software/product definition.

Primary key:
software_id

## fact_asset_software
One row = one software installation on one asset.

## fact_asset_vulnerability
One row = one vulnerability detected on one asset.

## fact_remediation
One row = one remediation action or remediation state change.

## fact_risk_snapshot
One row = one asset-vulnerability risk observation on a given snapshot date.
