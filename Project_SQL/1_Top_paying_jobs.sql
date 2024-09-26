/* 
What Are the Top-Paying Data Analyst/scientist Jobs?

Focus: 

Identifying the top 10 highest-paying remote data Analyst/scientist  roles based on job postings that explicitly list salary ranges (excluding those with unspecified salaries).

Criteria:

-Only include remote roles.
-Focus on jobs with defined salary information.

Purpose:

-To highlight the best-paying opportunities for data Analyst/scientist .
-Offer insights into high-paying career paths across industries.
-Emphasize the benefits of location flexibility in remote roles.

Benefits:

-Helps data professionals maximize their earning potential.
-Allows job seekers to explore lucrative remote positions without geographical restrictions.
-Aids in making informed career decisions based on salary and job flexibility.
*/

SELECT
    job_postings_fact.job_id,
    Job_title,
    job_title_short ,
    job_location,
    Job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as Company_name

FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    (job_title_short = 'Data Analyst' or job_title_short like '%Scien%')
    AND
    job_location='Anywhere' 
    AND
    salary_year_avg is not NULL
GROUP BY job_postings_fact.job_id ,company_dim.name
ORDER BY
    salary_year_avg DESC
LIMIT 10


    

    
