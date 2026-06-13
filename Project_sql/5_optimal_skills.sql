/*
Question 5 : What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/
/*
Methodology Summary:
- HAVING COUNT > 10: Filters out statistical outliers with negligible job postings
- optimal_score = 0.5*(normalized demand) + 0.5*(normalized salary)
- Equal weighting (0.5/0.5) balances job security (demand) vs financial benefit (salary)
- Weights can be adjusted: e.g. 0.6/0.4 to prioritize demand for job seekers
-                                  0.4/0.6 to prioritize salary for career switchers

Full methodology documented in README.*/

WITH Base as (
    SELECT 
        s.skills AS skill_name,
        COUNT(sj.job_id) AS demand_count,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact AS jpf 
        INNER JOIN skills_job_dim AS sj ON jpf.job_id = sj.job_id
        INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
    GROUP BY
        s.skills
    HAVING
        COUNT(sj.job_id) > 10 
)
SELECT 
    skill_name,
    demand_count,
    avg_salary,
    ROUND(
           (demand_count::NUMERIC / MAX(demand_count) OVER ()) * 0.5 +
           (avg_salary::NUMERIC / MAX(avg_salary) OVER ()) * 0.5,
           4
       ) AS optimal_score
   FROM base
   ORDER BY optimal_score DESC
   LIMIT 10;


/*
ANALYSIS:
    SQL :  the most demanded and most reliably compensated skill in data analysis. 
    Core Analytics Stack: Python, Excel, Tableau -provide similar optimal scores despite different demand/salary tradeoffs. 
                          Python pays more; Excel has more jobs.
    Statistical Tools: R, Power BI, SAS with optimal_ score between 0.52–0.55, reflecting solid but more specialized demand.
                       SAS and R  skew toward industries like finance, pharma, and academia, while Power BI dominates Microsoft-heavy corporate environments.
    Niche technical skills :Kafka, PyTorch, Perl command premium pay but limited demand — ideal for specialization after mastering the core stack.

RESULT SET [Top 10 Optimal Skills for Data Analysts] :
-------------------------
[
  {
    "skill_name": "sql",
    "demand_count": 3083,
    "avg_salary": 96435,
    "optimal_score": 0.8709
  },
  {
    "skill_name": "python",
    "demand_count": 1840,
    "avg_salary": 101512,
    "optimal_score": 0.6888
  },
  {
    "skill_name": "excel",
    "demand_count": 2143,
    "avg_salary": 86419,
    "optimal_score": 0.6799
  },
  {
    "skill_name": "tableau",
    "demand_count": 1659,
    "avg_salary": 97978,
    "optimal_score": 0.6459
  },
  {
    "skill_name": "r",
    "demand_count": 1073,
    "avg_salary": 98708,
    "optimal_score": 0.5537
  },
  {
    "skill_name": "power bi",
    "demand_count": 1044,
    "avg_salary": 92324,
    "optimal_score": 0.5244
  },
  {
    "skill_name": "sas",
    "demand_count": 1000,
    "avg_salary": 93707,
    "optimal_score": 0.5226
  },
  {
    "skill_name": "kafka",
    "demand_count": 40,
    "avg_salary": 129999,
    "optimal_score": 0.5065
  },
  {
    "skill_name": "pytorch",
    "demand_count": 20,
    "avg_salary": 125226,
    "optimal_score": 0.4849
  },
  {
    "skill_name": "perl",
    "demand_count": 20,
    "avg_salary": 124686,
    "optimal_score": 0.4828
  }
]
*/