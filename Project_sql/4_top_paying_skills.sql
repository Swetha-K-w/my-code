/*
Question 4 : What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

--QUERY

SELECT 
    s.skills AS skill_name,
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
ORDER BY        
    avg_salary DESC
LIMIT 25;
/*
--ANALYSIS

Top-paying skills for Data Analysts show distinct patterns:

    Niche & Emerging Technologies Lead:
        - SVN ($400K) and Solidity ($179K) top the list, though these appear in few postings.
        - Blockchain (Solidity) and version control (SVN) command premium rates in specialized roles.

    Big Data & Database Skills:
        - Couchbase ($160K), Cassandra ($118K), Kafka ($130K) highlight value of distributed systems
        - These skills appear in data-intensive, high-scale environments.

    ML & AI Tools:
        - DataRobot ($155K), MXNet ($149K), Keras ($127K), PyTorch ($125K), TensorFlow ($120K)
        - Strong demand for predictive modeling and deep learning capabilities.

    DevOps & Cloud:
        - Terraform ($147K), VMware ($147K), Ansible ($124K), GitLab ($134K)
        - Infrastructure-as-code and deployment skills command high salaries.

Note: Some high-paying skills (e.g., SVN at $400K) appear in very few job postings, 
representing niche opportunities rather than market-wide trends.

RESULT SET [Top Skills by Average Salary for Data Analysts] :
-------------------------
[
  {
    "skill_name": "svn",
    "avg_salary": 400000
  },
  {
    "skill_name": "solidity",
    "avg_salary": 179000
  },
  {
    "skill_name": "couchbase",
    "avg_salary": 160515
  },
  {
    "skill_name": "datarobot",
    "avg_salary": 155486
  },
  {
    "skill_name": "golang",
    "avg_salary": 155000
  },
  {
    "skill_name": "mxnet",
    "avg_salary": 149000
  },
  {
    "skill_name": "dplyr",
    "avg_salary": 147633
  },
  {
    "skill_name": "vmware",
    "avg_salary": 147500
  },
  {
    "skill_name": "terraform",
    "avg_salary": 146734
  },
  {
    "skill_name": "twilio",
    "avg_salary": 138500
  },
  {
    "skill_name": "gitlab",
    "avg_salary": 134126
  },
  {
    "skill_name": "kafka",
    "avg_salary": 129999
  },
  {
    "skill_name": "puppet",
    "avg_salary": 129820
  },
  {
    "skill_name": "keras",
    "avg_salary": 127013
  },
  {
    "skill_name": "pytorch",
    "avg_salary": 125226
  },
  {
    "skill_name": "perl",
    "avg_salary": 124686
  },
  {
    "skill_name": "ansible",
    "avg_salary": 124370
  },
  {
    "skill_name": "hugging face",
    "avg_salary": 123950
  },
  {
    "skill_name": "tensorflow",
    "avg_salary": 120647
  },
  {
    "skill_name": "cassandra",
    "avg_salary": 118407
  },
  {
    "skill_name": "notion",
    "avg_salary": 118092
  },
  {
    "skill_name": "atlassian",
    "avg_salary": 117966
  },
  {
    "skill_name": "bitbucket",
    "avg_salary": 116712
  },
  {
    "skill_name": "airflow",
    "avg_salary": 116387
  },
  {
    "skill_name": "scala",
    "avg_salary": 115480
  }
]

*/