# NorthStar Health Vulnerability Remediation Intelligence — Project Brief

## Status

In progress. The analytical problem, synthetic environment, SQL Server schemas, core dimensions, core fact table, and validation queries are committed. Data generation, public-source integration, risk analysis, and dashboarding remain future phases.

## Business Problem

Security teams often identify more vulnerability exposures than available remediation capacity can address immediately. Prioritizing solely by CVSS can direct effort toward technically severe vulnerabilities that present less immediate organizational risk while exploitable, exposed, or business-critical findings remain unresolved.

NorthStar needs an analytical method that combines external threat intelligence with internal asset context to decide what should be remediated first.

## Primary Question

> Given limited remediation capacity, which vulnerability exposures should NorthStar Health remediate first to produce the greatest reduction in organizational cyber risk?

## Supporting Questions

1. Which findings affect the most business-critical or patient-care-supporting assets?
2. Which findings involve CVEs listed in CISA KEV?
3. Which CVEs have the highest EPSS exploitation probability?
4. Which urgent findings affect internet-facing or sensitive-data systems?
5. Which assets, locations, and business units carry the greatest cumulative exposure?
6. Which unresolved findings are oldest or past their remediation due dates?
7. How much risk could be reduced at different remediation capacities?
8. Does risk-based prioritization outperform CVSS-only ordering?

## Intended Users

- CISO and security leadership
- Vulnerability Management Lead
- SOC Manager
- IT Infrastructure Manager
- Remediation owners and operational teams

## Intended Decision Outputs

- Prioritized remediation queue
- Highest-risk assets and business units
- Internet-facing KEV exposure
- Vulnerability-age and overdue-remediation analysis
- CVSS, EPSS, KEV, and organizational-context comparison
- Remediation-capacity scenarios
- Executive and operational reporting requirements

## Analytical Principles

- Analyze vulnerability exposures at asset-CVE grain.
- Keep technical severity distinct from exploitation probability and known exploitation.
- Make organizational context visible in every priority decision.
- Document weighting assumptions and limitations.
- Compare the proposed score with simpler baselines such as CVSS-only and KEV-first ordering.
- Validate counts and joins before interpreting risk.

## Tools

**Currently committed:** Microsoft SQL Server, T-SQL, Git, and GitHub.

**Planned:** Python, Pandas, NumPy, Requests, SQLAlchemy, Matplotlib, and Power BI.
