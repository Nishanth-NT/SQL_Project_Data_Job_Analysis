/*
What Are the Most In-Demand Skills for Data Analyst/scientist?

Focus: 

Perform an inner join on job postings to identify the top 5 most in-demand skills for data analysts.

Criteria:

Analyze all job postings to determine the skills that are most frequently required.

Purpose:

-Retrieve the top 5 skills that are in the highest demand in the current job market.
-Provide data-driven insights into the key competencies employers are seeking.

Benefits:

-Helps job seekers focus on high-value skills that improve their chances of landing desirable roles.
-Offers a clear direction for skill development to enhance employability in a competitive market.
*/

select skills, count (skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' or job_title_short like '%Scien%')
    AND
    job_location='Anywhere' 
    
GROUP BY skills
ORDER BY demand_count DESC
limit 5
