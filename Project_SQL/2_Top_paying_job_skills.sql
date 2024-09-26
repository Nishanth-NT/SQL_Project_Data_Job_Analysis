/*
What Skills Are Required for the Top-Paying Data Analyst/scientist Jobs?
Focus: Identifying the specific skills required for the top 10 highest-paying remote data Analyst/scientist jobs (based on the previous analysis).

Criteria:

-Analyze the skill sets demanded by high-paying roles.
-Map these skills to the top-paying job opportunities.

Purpose:

-Provide a clear understanding of the skills needed for high-paying data Analyst/scientist positions.
-Help job seekers identify and develop key competencies that align with the most lucrative roles.

Benefits:

-Assists professionals in focusing on in-demand skills that lead to higher salaries.
-Enables job seekers to align their skill development with the requirements of top-paying positions, increasing their career growth potential.
*/

With top_paying_jobs as (
    SELECT
    job_postings_fact.job_id,
    Job_title,
    job_title_short ,
    job_location,
    salary_year_avg
    
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
GROUP BY job_postings_fact.job_id 
ORDER BY
    salary_year_avg DESC
LIMIT 10
    
)
   

select top_paying_jobs.*,skills_dim.skills
from top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id



/*
The analysis of the skills column for the top 10 data analyst and scientist roles in 2023 reveals the following insights about the frequency of each skill:

Python is the most in-demand skill, mentioned in 7 job openings.
SQL follows closely, being needed in 6 job openings.
AWS (Amazon Web Services), Java, and Spark each appear in 4 job openings.
Tableau is necessary in 3 job openings.
GCP (Google Cloud Platform), SAS, PyTorch, TensorFlow, Azure, Hadoop, and Cassandra are required in 2 job openings each.
Skills like Oracle, Snowflake, R, Scala, and several others are mentioned only once.
[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "550000.0",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "550000.0",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "525000.0",
    "skills": "sql"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "c++"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_title_short": "Senior Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "320000.0",
    "skills": "datarobot"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "numpy"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "sql"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "python"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "nosql"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "r"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "matlab"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "azure"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "databricks"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "aws"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "redshift"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "oracle"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "spark"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "tableau"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "salary_year_avg": "288000.0",
    "skills": "qlik"
  }
]
*/


