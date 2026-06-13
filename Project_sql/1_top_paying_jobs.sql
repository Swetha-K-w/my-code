/*
Question 1: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

-- QUERY

SELECT	
	jpf.job_id,
	jpf.job_title,
	jpf.job_location,
	jpf.job_schedule_type,
	jpf.salary_year_avg ,
	jpf.job_posted_date,
	cd.name AS company_name 
FROM 
    job_postings_fact AS jpf
	LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE
	jpf.job_title_short = 'Data Analyst'
	AND jpf.job_location = 'Anywhere'
	AND jpf.salary_year_avg IS NOT NULL 
ORDER BY
	jpf.salary_year_avg  DESC
LIMIT 10;


/*

-- ANALYSIS

    Analysis of the top 10 data analyst jobs in 2023 shows:
		Salaries range from $184,000 to $650,000, (average: $264,500), highlighting substantial earning potential
		Employers span diverse industries, including SmartAsset, Meta, and AT&T 
		Titles vary considerably, from Data Analyst to Director of Analytics 

Result Set [Top 10 Remote Data Analyst Jobs in 2023] :
-------------------------
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 650000,
    "job_posted_date": "2023-02-20T15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 336500,
    "job_posted_date": "2023-08-23T12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 255829.5,
    "job_posted_date": "2023-06-18T16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 232423,
    "job_posted_date": "2023-12-05T20:00:40",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 217000,
    "job_posted_date": "2023-01-17T00:17:23",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 205000,
    "job_posted_date": "2023-08-09T11:00:01",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 189309,
    "job_posted_date": "2023-12-07T15:00:13",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 189000,
    "job_posted_date": "2023-01-05T00:00:25",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 186000,
    "job_posted_date": "2023-07-11T16:00:05",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": 184000,
    "job_posted_date": "2023-06-09T08:01:04",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/