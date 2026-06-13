
# Data Analyst Job Market Analysis
📊 A SQL-based analysis of the data analyst job market, exploring top-paying roles, in-demand skills, and the intersection of high demand and high salary.

🔍 SQL queries: [project_sql folder](/project_sql/)

---

## Background
This project was built to answer a practical question: **what should an aspiring data analyst actually learn?**

Using a dataset of real job postings with titles, salaries, locations, and required skills, five SQL queries were written to systematically answer that question — from raw salary data down to a composite optimality score.

Data sourced from [Luke Barousse's SQL Course](https://lukebarousse.com/sql).

---

## Tools Used
- **SQL** — core analysis language
- **PostgreSQL** — database management
- **Visual Studio Code** — query development
- **Git & GitHub** — version control and project sharing

---

## The Analysis

### Question 1 — What are the top-paying Data Analyst jobs?
Filtered for remote roles (`job_location = 'Anywhere'`) with non-null salaries, ordered by salary descending.

**Key findings:**
- Salaries range from **$184,000 to $650,000** (average: ~$264,500)
- Employers span diverse industries: Mantys, Meta, AT&T, SmartAsset, Pinterest
- Titles range from "Data Analyst" to "Director of Analytics" — seniority matters

| Job Title | Company | Salary |
|---|---|---|
| Data Analyst | Mantys | $650,000 |
| Director of Analytics | Meta | $336,500 |
| Associate Director - Data Insights | AT&T | $255,830 |
| Data Analyst, Marketing | Pinterest | $232,423 |
| Data Analyst (Hybrid/Remote) | UCLA Health | $217,000 |

---

### Question 2 — What skills do top-paying jobs require?
Used the top 10 jobs from Q1 as a CTE, then joined to skills tables to see what each role demanded.

**Key findings:**
- **SQL** (8/10 jobs) and **Python** (7/10 jobs) are near-universal requirements
- **Tableau** (6/10) is the dominant visualization tool at the top end
- **Snowflake** leads cloud platforms (3 appearances), ahead of AWS and Azure
- **Pandas** (3) is the most demanded Python library in high-paying roles

---

### Question 3 — What skills are most in demand overall?
Counted skill appearances across **all** Data Analyst job postings (no WFH or salary filter), giving a true market-wide demand picture.

> Note: Unlike Luke's approach which filtered to remote-only roles, this query covers the full job market for a broader demand signal.

**Top 5 in-demand skills:**

| Skill | Job Postings |
|---|---|
| SQL | 92,628 |
| Excel | 67,031 |
| Python | 57,326 |
| Tableau | 46,554 |
| Power BI | 39,468 |

---

### Question 4 — Which skills command the highest salaries?
Calculated average salary per skill across all Data Analyst roles with specified salaries, regardless of location.

**Key findings:**
- **SVN ($400K)** and **Solidity ($179K)** top the list but represent niche/outlier roles
- **Big Data tools** (Kafka $130K, Cassandra $118K, Couchbase $161K) reward distributed systems expertise
- **ML/AI libraries** (PyTorch $125K, TensorFlow $121K, Keras $127K) show strong premium for predictive modeling skills
- **DevOps tools** (Terraform $147K, Ansible $124K, GitLab $134K) reflect the growing crossover between data and engineering roles

---

### Question 5 — What are the most optimal skills to learn?
Combined demand and salary into a single **optimal score** using normalized min-max scaling with equal weighting.

#### Methodology
```
optimal_score = 0.5 × (demand / max_demand) + 0.5 × (avg_salary / max_avg_salary)
```
- `HAVING COUNT > 10` removes statistical outliers with negligible postings
- **Equal weighting (0.5/0.5)** assumes job security and salary are equally important for career planning
- Weights are adjustable: 0.6/0.4 favors job seekers; 0.4/0.6 favors salary maximizers

> Luke's approach sorted by `avg_salary DESC, demand_count DESC` — salary first, demand as tiebreaker — which implicitly prioritizes salary over demand. This project replaces that with a single normalized composite score, allowing fair comparison across skills with different demand/salary tradeoffs.

**Top 10 optimal skills:**

| Skill | Demand Count | Avg Salary | Optimal Score |
|---|---|---|---|
| SQL | 3,083 | $96,435 | 0.8709 |
| Python | 1,840 | $101,512 | 0.6888 |
| Excel | 2,143 | $86,419 | 0.6799 |
| Tableau | 1,659 | $97,978 | 0.6459 |
| R | 1,073 | $98,708 | 0.5537 |
| Power BI | 1,044 | $92,324 | 0.5244 |
| SAS | 1,000 | $93,707 | 0.5226 |
| Kafka | 40 | $129,999 | 0.5065 |
| PyTorch | 20 | $125,226 | 0.4849 |
| Perl | 20 | $124,686 | 0.4828 |

---

## Key Differences from Luke's Approach

| Aspect | Luke | This Project |
|---|---|---|
| Q3 demand filter | Remote only (WFH) | All job postings (broader signal) |
| Q4 salary filter | Remote only | All locations |
| Q5 ranking method | Two-column sort (salary DESC, demand DESC) | Single normalized optimal score |
| Outlier handling | HAVING COUNT > 10 | Same |

---

## What I Learned

- **CTEs** (`WITH` clauses) make complex multi-step queries readable and reusable
- **Window functions** (`OVER()`) enable row-level calculations against aggregate values — essential for normalization
- **Normalization before combining metrics** prevents scale bias in composite scores
- **Filtering decisions matter** — including all locations (vs. remote-only) surfaces meaningfully different demand numbers
- **`HAVING COUNT > 10`** — filtering out skills with 10 or fewer postings removed statistical outliers like SVN ($400K, 1 posting) and Solidity ($179K, 1 posting) that skewed salary rankings, surfacing more actionable skills like Kafka and PyTorch instead

---

## How to Use This

| Your Goal | Focus On | Weight Adjustment |
|---|---|---|
| Get hired fast | SQL → Excel → Tableau | 0.6 demand / 0.4 salary |
| Maximize salary | SQL → Python → Kafka/PyTorch | 0.4 demand / 0.6 salary |
| Early career | SQL + Excel → Python + Tableau → Specialize | Stick with 0.5/0.5 |

---

## Conclusions

1. **SQL is non-negotiable** — it leads in demand, appears in nearly all top-paying roles, and scores highest on the optimal score metric
2. **Python + Tableau** form the practical core alongside SQL for most analyst roles
3. **Niche skills pay premiums** (Kafka, PyTorch, Perl) but have limited openings — best pursued after mastering the core stack
4. **Cloud skills** (Snowflake, Azure, AWS) are increasingly expected at senior/director levels
5. **The optimal score approach** reveals that Excel, despite a lower salary ceiling than Python, remains highly competitive due to its massive demand volume