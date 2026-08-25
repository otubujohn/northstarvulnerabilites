# Project Status and Roadmap

Last documentation review: August 2026.

This file separates completed repository evidence from intended future work.

## Completed

- Defined the business problem and stakeholder questions.
- Documented the fictional NorthStar Health environment.
- Created the `NorthstarVulnIntel` Microsoft SQL Server database script.
- Created `stg`, `dim`, `fact`, and `audit` schemas.
- Implemented `dim.asset`.
- Implemented `dim.vulnerability`.
- Implemented `fact.asset_vulnerability`.
- Added primary keys, unique constraints, foreign keys, range checks, and date checks.
- Added schema and empty-table validation queries.
- Added Git ignore rules for raw, interim, secret, environment, and temporary files.

## Current Foundation

The repository currently contains a data-model foundation. It does **not** yet contain loaded asset or vulnerability records, Python ETL code, notebooks, risk-scoring outputs, analytical findings, or a Power BI dashboard.

## Next Analytical Phases

### 1. Synthetic Asset Data

- Generate the fictional asset inventory.
- Profile row counts, identifiers, categories, dates, and missingness.
- Validate business criticality, exposure, patient-care, production, and sensitive-data fields.
- Load and reconcile `dim.asset`.

### 2. Public Vulnerability Intelligence

- Retrieve a controlled CVE subset from NVD.
- Enrich CVEs with CISA KEV and FIRST EPSS.
- Standardize identifiers, dates, severities, probabilities, vendors, and products.
- Document source dates and reconciliation checks.
- Load and validate `dim.vulnerability`.

### 3. Synthetic Findings and Exposure Model

- Assign vulnerabilities to synthetic assets using documented assumptions.
- Create stable finding identifiers.
- Validate first/last detection dates, status, ports, and remediation dates.
- Load and reconcile `fact.asset_vulnerability`.

### 4. Exploratory Analysis

- Profile severity, EPSS, KEV, asset criticality, exposure, age, and remediation status.
- Investigate discrepancies, missing values, duplicates, and join losses.
- Analyze vulnerability and exposure counts separately.
- Document evidence before defining risk weights.

### 5. Risk Prioritization

- Define transparent, bounded scoring rules.
- Compare risk-based, CVSS-first, EPSS-first, KEV-first, and oldest-first queues.
- Test remediation capacities of 10, 25, and 50 exposures per day.
- Measure risk reduction and sensitivity to weighting choices.

### 6. Stakeholder Reporting

- Create a concise Power BI report.
- Present executive KPIs, remediation priorities, high-risk assets, threat-intelligence comparisons, and capacity scenarios.
- Publish screenshots, findings, recommendations, assumptions, and limitations.

## Completion Standard

A phase should be marked complete only when its code or query, validation evidence, analytical output, and documentation are committed to the repository.
