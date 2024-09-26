/*
What Are the Most Optimal Skills to Learn?

Focus: 

Identify skills that are both in high demand and associated with high average salaries for data analyst/scientist roles.

Criteria:

Concentrate on remote positions with specified salary information.

Purpose:

Highlight skills that offer a combination of job security (due to high demand) and financial rewards (from high salaries).

Benefits:

Provides strategic insights for career development, helping professionals focus on acquiring skills that maximize both employment opportunities and earning potential in the data analysis field.
*/



with skills_demand as (
    select skills_dim.skill_id,skills_dim.skills, count (skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        (job_title_short = 'Data Analyst' or job_title_short like '%Scien%')
        AND
        job_location='Anywhere'
        AND 
        salary_year_avg IS NOT NULL 
        
    GROUP BY skills_dim.skill_id
  
), avg_salary as 
(
    select skills_job_dim.skill_id, round (avg(salary_year_avg),0) as average_salary
    from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        (job_title_short = 'Data Analyst' or job_title_short like '%Scien%')
        AND
        salary_year_avg is not NULL
         AND
        job_location='Anywhere'
    
        
    GROUP BY skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN  avg_salary ON skills_demand.skill_id = avg_salary.skill_id
WHERE
    demand_count > 100
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25