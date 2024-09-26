
/*
What Are the Top Skills Based on Salary?

Focus: 
Analyze the average salary associated with each skill for data analyst/scientist roles.

Criteria:

Include only positions with specified salary information, regardless of job location.

Purpose:

-Identify the skills that are linked to higher salary levels in data analyst/scientist positions.
-Offer insights into which skills are the most financially rewarding to acquire or enhance.

Benefits:

-Helps job seekers focus on high-paying skills that can maximize earning potential.
-Provides a data-backed guide for skill development based on salary impact, aiding career growth in a competitive field.
*/

select skills, round (avg(salary_year_avg),0) as Average_salary
from job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' or job_title_short like '%Scien%')
     AND
     job_location = 'Anywhere'
     and
    salary_year_avg is not NULL
   
    
GROUP BY skills
ORDER BY average_salary DESC
limit 10

/*

Key Takeaways:
-Cloud & Enterprise Solutions: Skills like Redhat and RingCentral offer the highest salaries, averaging over $180,000, making them valuable for roles in cloud infrastructure and enterprise system management.

-Blockchain & Niche Programming Languages: Skills such as Solidity (for blockchain) and Elixir (functional programming) provide salaries above $160,000, reflecting their demand in cutting-edge tech sectors like blockchain and fintech.

AI & Data-Driven Tools: Tools like Watson, Hugging Face, and TensorFlow offer salaries ranging from $146,000 to $167,000, showing their importance in AI, machine learning, and advanced data analysis roles.

[
  {
    "skills": "redhat",
    "average_salary": "189500"
  },
  {
    "skills": "ringcentral",
    "average_salary": "182500"
  },
  {
    "skills": "elixir",
    "average_salary": "170824"
  },
  {
    "skills": "lua",
    "average_salary": "170500"
  },
  {
    "skills": "solidity",
    "average_salary": "168983"
  },
  {
    "skills": "watson",
    "average_salary": "167761"
  },
  {
    "skills": "objective-c",
    "average_salary": "164500"
  },
  {
    "skills": "dplyr",
    "average_salary": "160667"
  },
  {
    "skills": "neo4j",
    "average_salary": "157529"
  },
  {
    "skills": "haskell",
    "average_salary": "157500"
  },
  {
    "skills": "rshiny",
    "average_salary": "154712"
  },
  {
    "skills": "hugging face",
    "average_salary": "154622"
  },
  {
    "skills": "airtable",
    "average_salary": "152252"
  },
  {
    "skills": "codecommit",
    "average_salary": "151747"
  },
  {
    "skills": "dynamodb",
    "average_salary": "151696"
  },
  {
    "skills": "theano",
    "average_salary": "151556"
  },
  {
    "skills": "airflow",
    "average_salary": "149242"
  },
  {
    "skills": "pytorch",
    "average_salary": "149046"
  },
  {
    "skills": "svn",
    "average_salary": "148127"
  },
  {
    "skills": "kotlin",
    "average_salary": "147925"
  },
  {
    "skills": "cassandra",
    "average_salary": "147903"
  },
  {
    "skills": "ruby on rails",
    "average_salary": "147260"
  },
  {
    "skills": "tensorflow",
    "average_salary": "146223"
  },
  {
    "skills": "notion",
    "average_salary": "145482"
  },
  {
    "skills": "gitlab",
    "average_salary": "145317"
  }
]

*/