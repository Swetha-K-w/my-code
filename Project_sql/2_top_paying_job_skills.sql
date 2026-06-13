/*
Question 2 : What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

--QUERY

WITH top_paying_jobs AS (
    SELECT jpf.job_id,
        jpf.job_title,
        jpf.salary_year_avg,
        cd.name AS company_name
    FROM job_postings_fact AS jpf
        LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
    WHERE jpf.job_title_short = 'Data Analyst'
        AND jpf.job_location = 'Anywhere'
        AND jpf.salary_year_avg IS NOT NULL
    ORDER BY jpf.salary_year_avg DESC
    LIMIT 10
)
SELECT 
    tpj.*,
     s.skills as skill
FROM top_paying_jobs AS tpj
    INNER JOIN skills_job_dim AS sj ON tpj.job_id = sj.job_id
    INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
ORDER BY tpj.salary_year_avg DESC

/*
--ANALYSIS
SKILL DEMAND FINDINGS (based on top 10 highest-paying Data Analyst jobs):

    Programming Languages:
        - SQL (8 occurrences)
        - Python (7 occurrences)
    Analyst Tools:
        - Tableau (6) leads, surpassing Excel and Power BI
    Cloud Platforms:
        - Snowflake (3) most sought-after, ahead of AWS, Azure, and Oracle
    Libraries:
        - Pandas (3) demanded more than NumPy, PySpark, and others

INSIGHT: Among high-paying Data Analyst roles, SQL and Python dominate programming 
requirements, while Tableau is the preferred visualization tool. Snowflake leads 
cloud platforms, and Pandas is the top library in high-paying roles.


RESULT SET [the skills required for the top-paying data analyst jobs are]:
--------

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": 255829.5,
    "company_name": "AT&T",
    "skill": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skill": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skill": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skill": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skill": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": 232423,
    "company_name": "Pinterest Job Advertisements",
    "skill": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": 217000,
    "company_name": "Uclahealthcareers",
    "skill": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": 217000,
    "company_name": "Uclahealthcareers",
    "skill": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": 217000,
    "company_name": "Uclahealthcareers",
    "skill": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": 217000,
    "company_name": "Uclahealthcareers",
    "skill": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": 217000,
    "company_name": "Uclahealthcareers",
    "skill": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": 205000,
    "company_name": "SmartAsset",
    "skill": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": 189309,
    "company_name": "Inclusively",
    "skill": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": 189000,
    "company_name": "Motional",
    "skill": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": 186000,
    "company_name": "SmartAsset",
    "skill": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": 184000,
    "company_name": "Get It Recruit - Information Technology",
    "skill": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": 184000,
    "company_name": "Get It Recruit - Information Technology",
    "skill": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": 184000,
    "company_name": "Get It Recruit - Information Technology",
    "skill": "r"
  }
]
*/