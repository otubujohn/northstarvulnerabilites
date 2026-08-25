# Data Model and Analytical Grain

This document distinguishes the data structures already implemented in the repository from those planned for later analytical phases.

## Schemas

| Schema | Purpose | Current status |
|---|---|---|
| `stg` | Temporary landing and source-standardization tables | Schema created; tables not yet implemented |
| `dim` | Descriptive asset and vulnerability entities | Core tables implemented |
| `fact` | Asset-vulnerability findings and future analytical events | Core exposure table implemented |
| `audit` | Load, reconciliation, and data-quality records | Schema created; tables not yet implemented |

## Implemented Tables

### `dim.asset`

**Grain:** one row per synthetic NorthStar technology asset.

- Surrogate primary key: `asset_key`
- Business identifier: `asset_id`
- Unique identifier enforced on `asset_id`
- Descriptive context includes hostname, asset type, business unit, location, operating system, and status
- Risk context includes criticality, internet exposure, patient-care support, sensitive-data exposure, and production status
- Validation includes criticality range and first/last-seen date order

### `dim.vulnerability`

**Grain:** one row per unique CVE.

- Surrogate primary key: `vulnerability_key`
- Business identifier: `cve_id`
- Unique identifier enforced on `cve_id`
- Threat context includes CVSS, CWE, KEV, ransomware-use, vendor, product, and EPSS fields
- Validation constrains CVSS to 0–10 and EPSS score/percentile to 0–1

### `fact.asset_vulnerability`

**Grain:** one vulnerability finding on one asset.

- Surrogate primary key: `finding_key`
- Business identifier: `finding_id`
- Foreign keys connect each finding to one asset and one vulnerability
- Operational fields include detection dates, status, port, protocol, remediation dates, and scanner source
- Validation ensures valid date order and network-port range

## Implemented Relationships

| Parent | Child | Relationship |
|---|---|---|
| `dim.asset.asset_key` | `fact.asset_vulnerability.asset_key` | One asset to many findings |
| `dim.vulnerability.vulnerability_key` | `fact.asset_vulnerability.vulnerability_key` | One CVE to many asset findings |

## Key Analytical Distinction

A vulnerability and a vulnerability exposure are not interchangeable:

- **Unique vulnerability:** one CVE in `dim.vulnerability`
- **Vulnerability exposure:** one CVE found on one asset in `fact.asset_vulnerability`

If one CVE affects 150 assets, it produces one vulnerability record and up to 150 exposure records. Remediation effort and organizational risk must therefore be measured primarily at the exposure grain.

## Planned Structures

These structures are part of the analytical roadmap but are not yet implemented:

| Proposed table | Intended grain |
|---|---|
| `dim.software` | One row per unique software or product definition |
| `fact.asset_software` | One software installation on one asset |
| `fact.remediation` | One remediation action or state change |
| `fact.risk_snapshot` | One asset-vulnerability risk observation on one snapshot date |
| Audit tables | One row per load, check, reconciliation, or exception event |

The planned tables should be added only when the relevant analytical data and business questions require them.
