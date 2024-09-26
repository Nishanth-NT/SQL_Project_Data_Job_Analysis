# INTRODUCTION


Explore the data job market with a focus on data analyst roles! This project covers top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics. The reason for this analysis is to guide my transition from a mechanical/automotive engineering background into the data field, as data is becoming increasingly important across industries.
 
Check out the SQL queries in [The Project_sql folder](/Project_SQL/)


# BACKGROUND


This project explores the data analyst job market, aiming to identify top-paying and in-demand skills to help streamline the job search process.

The data, drawn from my SQL course, provides insights into job titles, salaries, locations, and essential skills.

Key questions answered:

1. Top-paying data analyst jobs?
2. Skills required for high-paying roles?
3. Most in-demand skills for data analysts/scientist ?
4. Skills linked to higher salaries?
5. Most optimal skills to learn?


# Tools I Used


For my deep dive into the data analysts/scientist  job market, I used the following tools:

- SQL: For querying the data and extracting key insights.
- PostgreSQL: The database system for managing job posting data.
- Visual Studio Code: For executing and managing SQL queries.
- Git & GitHub: For version control and sharing my SQL scripts, enabling  collaboration and tracking.


# The Analysis


Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

``` SQL
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
```

Conclusion:
1. Top-paying roles: Positions like Staff Data Scientist/Quant Researcher and Senior Data Scientist offer salaries ranging from $288,000 to $550,000, with the highest compensation found in finance and business analytics.

2. Remote flexibility: All listed positions are remote, highlighting the growing trend of high-paying data science roles offering location flexibility.

3. Diverse industries: Opportunities span various sectors, including finance, business analytics, product management, and technology, reflecting the broad demand for data science expertise.



![top](/Project_SQL/top%20paying%20jobs.png)




### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

``` SQL
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
```

Conclusion:

1. SQL and Python Dominate: SQL and Python are the most frequently required skills for data scientist positions, indicating their foundational importance in the field.

2. Diverse Skill Requirements: While SQL and Python are leading, there is a wide range of additional skills like Java, Spark, AWS, and Tableau, showing that data scientists are expected to have a diverse technical toolkit.

3. Cloud and Big Data Technologies: Cloud platforms (AWS, Azure, GCP) and big data tools (Spark, Hadoop) are commonly sought, reflecting the industry's growing reliance on scalable cloud and data processing technologies.

![top](/Project_SQL/top%20frequency%20skills.png)

