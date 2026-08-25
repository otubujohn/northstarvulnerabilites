# NorthStar Health Vulnerability Remediation Intelligence

**Status:** In progress — analytical foundation and SQL data model completed  
**Focus:** Cybersecurity data analysis and risk-based vulnerability prioritization

## Project Summary

NorthStar is a portfolio project that asks a practical vulnerability-management question:

> With limited remediation capacity, which vulnerability exposures should be fixed first to reduce the greatest amount of organizational cyber risk?

The project is designed to combine public vulnerability intelligence—CVSS, CISA Known Exploited Vulnerabilities, and FIRST EPSS—with a synthetic healthcare asset environment. The analysis will compare CVSS-only remediation with prioritization based on exploitation evidence, asset criticality, internet exposure, patient-care dependency, vulnerability age, and organizational context.

## Current Project Status

| Component | Status | Evidence in this repository |
|---|---|---|
| Business problem and stakeholder questions | Completed | [Project brief](docs/project_brief.md) |
| Fictional healthcare environment | Completed | [NorthStar environment](docs/northstar_env.md) |
| SQL Server database and schemas | Completed | `sql/01_create_database.sql` |
| Asset dimension | Completed | `sql/02_create_dim_asset.sql` |
| Vulnerability dimension | Completed | `sql/03_create_dim_vulnerability.sql` |
| Asset-vulnerability fact table | Completed | `sql/04_create_fact_asset_vulnerability.sql` |
| Schema-validation queries | Completed | `sql/05_validate_schema.sql` |
| Synthetic asset and finding data | Not yet committed | Planned next analytical phase |
| NVD, CISA KEV, and EPSS integration | Not yet committed | Planned |
| Risk-scoring analysis and comparison | Not yet committed | Planned |
| Power BI decision-support dashboard | Not yet committed | Planned |

See the detailed [project status and roadmap](docs/project_status.md).

## Why CVSS Alone Is Not Enough

CVSS measures technical severity, but it does not fully describe organizational urgency. A severe vulnerability on an isolated, low-criticality asset may present less immediate risk than a lower-CVSS vulnerability that:

- appears in the CISA KEV catalogue;
- has a high EPSS probability;
- affects an internet-facing system;
- supports patient care;
- exists on a mission-critical asset; or
- has remained unresolved beyond its remediation target.

NorthStar will analyze vulnerability **exposures**, not just unique CVEs. One CVE affecting 150 assets represents one vulnerability but 150 separate asset-vulnerability exposures.

## Analytical Questions

1. Which vulnerability exposures affect the most critical assets?
2. Which exposures combine known exploitation, high EPSS, and internet exposure?
3. Which assets and business units carry the greatest cumulative risk?
4. Which unresolved findings are oldest or past due?
5. How much risk can be reduced under different remediation capacities?
6. Does organizational risk-based prioritization outperform CVSS-only prioritization?

## Intended Data Sources

| Source | Analytical use | Current repository status |
|---|---|---|
| [NIST National Vulnerability Database](https://nvd.nist.gov/) | CVE descriptions, CVSS, dates, and weakness information | Integration planned |
| [CISA Known Exploited Vulnerabilities](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) | Evidence of observed exploitation | Integration planned |
| [FIRST EPSS](https://www.first.org/epss/) | Near-term exploitation probability | Integration planned |
| Synthetic NorthStar asset data | Asset criticality, exposure, business unit, and patient-care context | Generation planned |

## Implemented SQL Model

The committed T-SQL foundation uses Microsoft SQL Server and creates four schemas: `stg`, `dim`, `fact`, and `audit`.

| Table | Grain | Status |
|---|---|---|
| `dim.asset` | One row per synthetic NorthStar technology asset | Implemented |
| `dim.vulnerability` | One row per unique CVE | Implemented |
| `fact.asset_vulnerability` | One row per vulnerability finding on one asset | Implemented |

Primary keys, unique constraints, foreign keys, date checks, CVSS/EPSS range checks, criticality checks, and network-port checks are included. See [data-model notes](docs/data_model_notes.md).

## Technology

**Implemented now**

- Microsoft SQL Server and T-SQL
- Relational and dimensional data modelling
- Data constraints and validation queries
- Git and GitHub documentation

**Planned analytical phases**

- Python, Pandas, NumPy, Requests, and SQLAlchemy
- Data profiling, cleaning, joining, and QA
- Risk scoring and remediation-capacity simulation
- Matplotlib exploratory analysis
- Power BI stakeholder reporting

## Run the Current SQL Foundation

Requirements:

- Microsoft SQL Server
- SQL Server Management Studio, Azure Data Studio, or another T-SQL client

Run the scripts in order:

1. `sql/01_create_database.sql`
2. `sql/02_create_dim_asset.sql`
3. `sql/03_create_dim_vulnerability.sql`
4. `sql/04_create_fact_asset_vulnerability.sql`
5. `sql/05_validate_schema.sql`

The validation script is expected to show the implemented schemas and tables. At the current project stage, the tables contain no committed data.

## Repository Guide

| Path | Purpose |
|---|---|
| `data/raw/` | Local raw-source landing area; source files are intentionally excluded from Git |
| `data/interim/` | Local intermediate data; generated files are intentionally excluded from Git |
| `docs/project_brief.md` | Business problem, users, questions, and intended outputs |
| `docs/northstar_env.md` | Synthetic organization and asset assumptions |
| `docs/data_model_notes.md` | Implemented and planned analytical grains |
| `docs/project_status.md` | Honest record of completed and remaining work |
| `sql/` | Ordered SQL Server database and table scripts |
| `requirements.txt` | Focused dependencies for upcoming Python analysis |

## Disclaimer

**NorthStar Health Network is entirely fictional.** Its organization, facilities, assets, hostnames, IP addresses, business units, users, infrastructure, vulnerability assignments, remediation records, and operational scenarios are synthetic. No confidential, proprietary, patient, employee, or internal organizational data is used.

Public NVD/CVE, CISA KEV, and FIRST EPSS information describes real publicly disclosed vulnerabilities. Its future assignment to NorthStar assets and scenarios will be synthetic. Any resemblance to a real organization is coincidental, and this project must not be interpreted as an assessment of any real entity's security posture.

## Author

[John Otubu](https://github.com/otubujohn)  
[LinkedIn](https://www.linkedin.com/in/john-otubu/)
