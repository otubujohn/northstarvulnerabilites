
# Northstar Health Vulnerability Remediation Intelligence

## Project Overview

Northstar Health Vulnerability Remediation Intelligence is a portfolio project designed to demonstrate an end-to-end cybersecurity data analytics and vulnerability management workflow.

The project simulates the vulnerability management environment of a healthcare organization that operates hospitals, outpatient clinics, employee endpoints, servers, network infrastructure, clinical systems, and internet-facing services.

The central business problem is:

> Given limited remediation capacity, which vulnerabilities should an organization remediate first to achieve the greatest reduction in cybersecurity risk?

Rather than prioritizing vulnerabilities using CVSS severity alone, this project combines vulnerability severity, exploitation probability, known exploitation activity, asset exposure, business criticality, vulnerability age, and other organizational factors to support risk-based remediation decisions.

---

## Important Disclaimer

**Northstar Health Network is entirely fictional.**

The company name, organizational structure, hospitals, clinics, departments, assets, systems, hostnames, IP addresses, business units, users, remediation activities, infrastructure, and operational scenarios used in this project are fictional and were created solely for portfolio and educational purposes.

Northstar Health Network does not represent any real healthcare organization.

Any resemblance between Northstar Health Network and an existing company, hospital, healthcare organization, government organization, technology environment, or other real-world entity is entirely coincidental.

No confidential, proprietary, patient, employee, customer, or internal organizational data is used in this project.

Some cybersecurity threat-intelligence data used in the analysis is derived from legitimate public sources, including:

- National Institute of Standards and Technology (NIST)
- National Vulnerability Database (NVD)
- Common Vulnerabilities and Exposures (CVE) data
- Cybersecurity and Infrastructure Security Agency (CISA) Known Exploited Vulnerabilities catalogue
- FIRST Exploit Prediction Scoring System (EPSS)

These public datasets describe real publicly disclosed cybersecurity vulnerabilities and threat intelligence.

However, the assignment of those vulnerabilities to Northstar assets, systems, business units, locations, remediation records, and organizational risk scenarios is synthetic.

The purpose of combining real public vulnerability intelligence with a fictional organizational environment is to demonstrate practical skills in:

- Data analytics
- Vulnerability management analytics
- Cybersecurity risk prioritization
- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Power BI
- ETL and data transformation
- Relational data modelling
- Data validation and quality assurance
- Dashboard development
- Business communication
- Risk-based decision support

This project is intended exclusively as a professional portfolio demonstration of technical and analytical proficiency for recruiters, hiring managers, cybersecurity professionals, and data professionals.

It should not be interpreted as an assessment of the security posture of any real organization.

---

## Business Problem

Organizations frequently identify more vulnerabilities than security and infrastructure teams can remediate immediately.

A vulnerability scanner may produce thousands of findings, but treating every vulnerability equally is inefficient.

Traditional prioritization based primarily on CVSS severity can also be misleading.

For example, a vulnerability with:

- CVSS 9.8
- low exploitation probability
- no known exploitation
- an internally isolated low-criticality asset

may not necessarily deserve remediation before a vulnerability with:

- CVSS 8.1
- high EPSS probability
- confirmed inclusion in CISA KEV
- an internet-facing mission-critical asset

Northstar therefore requires a risk-based remediation strategy that incorporates both external threat intelligence and internal asset context.

---

## Primary Business Question

> Which vulnerabilities should Northstar Health remediate first in order to achieve the greatest reduction in organizational cyber risk with limited remediation resources?

---

## Supporting Questions

The project will investigate:

1. Which vulnerabilities affect the most business-critical assets?
2. Which vulnerabilities are listed in the CISA Known Exploited Vulnerabilities catalogue?
3. Which vulnerabilities have the highest probability of exploitation according to EPSS?
4. Which vulnerabilities exist on internet-facing systems?
5. Which business units have the greatest concentration of vulnerability exposure?
6. Which assets carry the greatest cumulative cybersecurity risk?
7. Which vulnerabilities have remained unresolved for the longest period?
8. Which vulnerabilities affect multiple critical systems?
9. How much organizational risk could be reduced under different remediation-capacity scenarios?
10. Does risk-based prioritization outperform CVSS-only remediation prioritization?

---

## Simulated Organization

Northstar Health Network is modelled as a fictional healthcare organization containing approximately 1,000 technology assets.

The simulated environment includes:

- 2 hospitals
- 8 outpatient clinics
- Corporate administrative operations
- Remote employees
- Employee workstations
- Clinical workstations
- Application servers
- Database servers
- Identity infrastructure
- Network devices
- Security appliances
- Internet-facing systems
- Selected clinical technology systems

Assets are assigned organizational characteristics such as:

- Business unit
- Location
- Asset type
- Business criticality
- Internet exposure
- Production status
- Sensitive-data exposure
- Patient-care dependency

All of these organizational attributes are synthetic.

---

## Threat Intelligence Sources

### NIST National Vulnerability Database

Used for vulnerability information including:

- CVE identifiers
- Vulnerability descriptions
- CVSS severity information
- Publication dates
- Modification dates
- Weakness classifications
- Product and vulnerability metadata

### CISA Known Exploited Vulnerabilities

Used to identify vulnerabilities known to have been exploited in real-world attacks.

### FIRST EPSS

Used to provide estimates of the probability that a vulnerability will be exploited in the near term.

---

## Analytical Concept

The project distinguishes between several different concepts.

### Vulnerability Severity

Measured primarily using CVSS.

This represents the potential technical severity of a vulnerability.

### Exploitation Probability

Measured using EPSS.

This represents the estimated likelihood of exploitation.

### Known Exploitation

Measured using CISA KEV membership.

This indicates that exploitation has already been observed.

### Organizational Exposure

Derived from the fictional Northstar asset environment.

Factors may include:

- Internet exposure
- Asset criticality
- Production status
- Sensitive-data exposure
- Patient-care dependency

### Vulnerability Age

Measures how long a vulnerability has remained unresolved.

### Organizational Risk

The project will develop a risk-prioritization model combining external vulnerability intelligence with internal organizational context.

The resulting score is intended as an analytical prioritization mechanism for this fictional environment and should not be considered a universal cybersecurity risk standard.

---

## Technology Stack

### Python

Used for:

- Data extraction
- API interaction
- Data cleaning
- Transformation
- Synthetic data generation
- Quality assurance
- Exploratory data analysis
- Database loading

### Pandas

Used for structured data manipulation and transformation.

### NumPy

Used for:

- Vectorized risk calculations
- Scenario modelling
- Remediation-capacity simulations
- Quantitative analysis

### Matplotlib

Used for exploratory visual analysis before dashboard development.

### SQL

Used as the analytical data-storage and querying layer.

Planned SQL techniques include:

- Joins
- CTEs
- Aggregations
- Window functions
- Views
- Subqueries
- Ranking
- Conditional logic
- Analytical queries

### Power BI

Used to create the final interactive decision-support dashboard.

Planned functionality includes:

- DAX measures
- KPI cards
- Drill-down analysis
- Filters and slicers
- Risk segmentation
- Remediation queues
- Executive reporting

### Git and GitHub

Used for:

- Version control
- Project documentation
- Portfolio presentation
- Development history

---

## Proposed Data Model

The analytical model will include tables such as:

### `dim_asset`

One row represents one Northstar technology asset.

### `dim_vulnerability`

One row represents one unique CVE.

### `dim_software`

One row represents one software or product definition.

### `fact_asset_software`

One row represents one software installation on one asset.

### `fact_asset_vulnerability`

One row represents one vulnerability detected on one asset.

### `fact_remediation`

One row represents one remediation action or remediation-state change.

### `fact_risk_snapshot`

One row represents an asset-vulnerability risk observation at a specific point in time.

---

## Key Analytical Distinction

A vulnerability and a vulnerability exposure are not the same thing.

For example:

`CVE-XXXX-12345`

may be one unique vulnerability.

However, if that CVE affects 150 Northstar assets, it represents:

- 1 unique vulnerability
- 150 asset-vulnerability exposures

This distinction is important when calculating vulnerability counts, affected assets, remediation effort, and organizational risk.

---

## Planned Power BI Report

The final Power BI report will contain several analytical views.

### Executive Risk Overview

Designed for senior security leadership.

Potential KPIs include:

- Open vulnerabilities
- Critical vulnerabilities
- KEV exposure
- Internet-exposed KEVs
- Weighted organizational risk
- Assets above risk threshold
- Average vulnerability age
- Past-due remediation items

### Remediation Priority

Designed to answer:

> What should be fixed first?

This page will provide a prioritized remediation queue using multiple risk factors.

### Asset Exposure

Designed to identify:

- Highest-risk assets
- Highest-risk locations
- Highest-risk business units
- Internet-facing exposure
- Critical systems requiring attention

### Threat Intelligence

Designed to compare:

- CVSS
- EPSS
- CISA KEV
- Vulnerability age
- Vulnerability prevalence

---

## Remediation Strategy Simulation

A later stage of the project will compare different remediation strategies.

Examples include:

- Highest CVSS first
- Highest EPSS first
- CISA KEV first
- Oldest vulnerability first
- Highest organizational-risk score first

The project will simulate different remediation capacities, such as:

- 10 vulnerability exposures per day
- 25 per day
- 50 per day

The analysis will compare how quickly each strategy reduces total organizational risk.

---

## Project Objectives

By completing this project, I aim to demonstrate the ability to:

1. Translate a cybersecurity problem into analytical questions.
2. Integrate multiple public threat-intelligence sources.
3. Generate realistic synthetic organizational data.
4. Design a relational analytical data model.
5. Build reproducible Python ETL workflows.
6. Perform rigorous data validation.
7. Analyze complex datasets using SQL.
8. Conduct exploratory analysis using Python.
9. Apply NumPy to quantitative risk modelling.
10. Build decision-support dashboards in Power BI.
11. Translate technical findings into actionable business recommendations.
12. Communicate analytical limitations and assumptions clearly.

---

## Repository Structure

```text
Northstar_Vulnerability_Intelligence/
│
├── data/
│   ├── raw/
│   ├── interim/
│   ├── processed/
│   └── synthetic/
│
├── sql/
│
├── src/
│
├── notebooks/
│
├── powerbi/
│
├── docs/
│
├── screenshots/
│
├── tests/
│
└── README.md