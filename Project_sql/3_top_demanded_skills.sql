/*
Question 3 : What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

-- QUERY

SELECT 
    s.skills AS skill_name,
    COUNT(*) AS no_of_postings
FROM 
    job_postings_fact AS jpf 
    INNER JOIN skills_job_dim AS sj ON jpf.job_id = sj.job_id
    INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
GROUP BY
    s.skills
ORDER BY        
    no_of_postings DESC
LIMIT 5;
    
/*
-- ANALYSIS
        The top 5 most in-demand skills for data analysts are exclusively from Programming (SQL, Python) 
    and Analyst Tools (Excel, Tableau, Power BI). 
        SQL and Excel remain foundational, while Python, Tableau, and Power BI reflect the growing 
    technical demands of data storytelling and decision support.
        Cloud and database skills, while valuable, appear in fewer postings and are more role-dependent.

RESULT SET [Top 5 In-Demand Skills for Data Analysts] :
-------------------------
[  {
    "skill_name": "sql",
    "no_of_postings": 92628
  },
  {
    "skill_name": "excel",
    "no_of_postings": 67031
  },
  {
    "skill_name": "python",
    "no_of_postings": 57326
  },
  {
    "skill_name": "tableau",
    "no_of_postings": 46554
  },
  {
    "skill_name": "power bi",
    "no_of_postings": 39468
  }
]
*/
