# Introduction


Explore the data job market with a focus on data analyst roles! This project covers top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics. The reason for this analysis is to guide my transition from a mechanical/automotive engineering background into the data field, as data is becoming increasingly important across industries.
 
Check out the SQL queries in [The Project_sql folder](/Project_SQL/)


# Background


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

*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*




### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

``` SQL
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
```

Conclusion:

1. SQL and Python Dominate: SQL and Python are the most frequently required skills for data scientist positions, indicating their foundational importance in the field.

2. Diverse Skill Requirements: While SQL and Python are leading, there is a wide range of additional skills like Java, Spark, AWS, and Tableau, showing that data scientists are expected to have a diverse technical toolkit.

3. Cloud and Big Data Technologies: Cloud platforms (AWS, Azure, GCP) and big data tools (Spark, Hadoop) are commonly sought, reflecting the industry's growing reliance on scalable cloud and data processing technologies.

![top](/Project_SQL/top%20frequency%20skills.png)

*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*


### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

``` SQL
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
```

Conclusion:

1. Python and SQL are in Highest Demand: Python leads in demand with 17,676 job listings, closely followed by SQL with 16,964 listings, highlighting their critical role in data science and analytics.

2. R as a Specialized Tool: While not as widely demanded as Python or SQL, R is still a significant skill with over 8,000 listings, indicating its continued relevance, especially in statistical and academic contexts.

3. Visualization and Spreadsheet Tools: Tableau (6,831) and Excel (6,146) are also highly sought after, underscoring the importance of data visualization and basic spreadsheet skills in data science-related roles.
 

    | Skills   | Demand Count |
    |----------|--------------|
    | Python   | 17676        |
    | SQL      | 16964        |
    | R        | 8123         |
    | Tableau  | 6831         |
    | Excel    | 6146         |

*Table of the demand for the top 5 skills in data analyst job postings*



### 4. Skills Based on Salary


Exploring the average salaries associated with different skills revealed which skills are the highest paying.



``` SQL
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
```

Conclusion:

1. High-Demand Tools for Specialized Roles: Tools like Bitbucket, Splunk, and GDPR-related expertise command some of the highest average salaries, indicating that these skills are in demand for specialized roles, particularly in version control, security compliance, and data management.

2. Strong Demand for Programming and Database Technologies: Skills such as Golang, Neo4j, Cassandra, Redis, and DynamoDB offer high average salaries, reflecting the value of expertise in modern programming languages and NoSQL/graph databases in tech-driven industries.

3. Automation and Cloud Expertise is Valued: Selenium (automation tool) and Atlassian (project management tools) are also highly compensated, suggesting a strong need for skills related to software development, testing, and cloud-based project management solutions.
 

    | Skills      | Average Salary ($) |
    |-------------|--------------------|
    | Bitbucket   | 189,155            |
    | Splunk      | 185,000            |
    | GDPR        | 184,742            |
    | Selenium    | 180,000            |
    | Neo4j       | 179,517            |
    | Golang      | 179,375            |
    | Cassandra   | 177,872            |
    | Redis       | 173,750            |
    | DynamoDB    | 172,335            |
    | Atlassian   | 170,192            |

*Table of the average salary for the top 10 paying skills for data analysts*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.



``` SQL
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
    average_salary DESC,
    demand_count DESC
LIMIT 10
```

Conclusion:

1. Machine Learning and Data Science Tools are Highly Valued: Skills like PyTorch, TensorFlow, Numpy, Scikit-learn, and Pandas, which are essential in machine learning and data science, have high demand and command strong average salaries, all above $150,000.

2. Big Data Technologies in High Demand: Spark and AWS lead in demand count (234 and 323 respectively), showing that expertise in big data processing and cloud infrastructure is critical in modern data and software engineering roles, although their average salaries are slightly lower than specialized machine learning tools.

3. Diverse Programming and Data Tools in Demand: Programming languages like Go and Java, and cloud data platforms like Snowflake, also appear on the list with solid demand and competitive salaries, indicating the broad technical requirements in today’s data-driven industries.
 

    | Skill ID | Skills       | Demand Count | Average Salary ($) |
    |----------|--------------|--------------|--------------------|
    | 94       | Numpy        | 105          | 155,859            |
    | 101      | PyTorch      | 163          | 155,662            |
    | 99       | TensorFlow   | 183          | 155,190            |
    | 106      | Scikit-learn | 111          | 153,404            |
    | 92       | Spark        | 234          | 151,632            |
    | 8        | Go           | 116          | 151,109            |
    | 93       | Pandas       | 155          | 150,502            |
    | 76       | AWS          | 323          | 146,446            |
    | 4        | Java         | 107          | 144,297            |
    | 80       | Snowflake    | 146          | 143,503            |


*Table of the most optimal skills for data analyst sorted by salary*


# Conclusions

High Demand for Foundational and Specialized Skills: Python and SQL consistently top the list in both demand and average salary, with additional specialized skills like PyTorch, TensorFlow, and Spark highly valued in machine learning and big data roles. Cloud platforms (AWS, Azure) and big data tools (Hadoop, Spark) are increasingly important across industries.

Diverse and Lucrative Opportunities Across Industries: Data science roles offer competitive salaries ranging from $288,000 to $550,000, particularly in finance, business analytics, and technology sectors. Specialized tools like Bitbucket, Splunk, and GDPR-related expertise command top salaries, reflecting the demand for both general and niche technical skills across a broad range of industries.

Remote Work and Flexibility on the Rise: All roles analyzed offer remote flexibility, highlighting the growing trend of high-paying data science positions being available to remote workers. The demand for roles with diverse skillsets, from automation to cloud expertise, showcases the dynamic and flexible nature of modern data science careers.


# What I Learned


Throughout this journey, I've significantly enhanced my SQL skillset and gained a deeper understanding of the data analyst job market:

- Advanced Query Mastery: I sharpened my ability to craft complex SQL queries, effortlessly joining tables and utilizing WITH clauses to handle temporary tables with precision.
- Data Aggregation Expertise: I became proficient in using GROUP BY and aggregate functions like COUNT() and AVG() to summarize data efficiently, turning raw information into actionable insights.
- Analytical Problem-Solving: I honed my real-world problem-solving skills, translating complex questions into clear, insightful SQL queries that drive data-driven decision-making.


This project not only strengthened my SQL abilities but also provided valuable insights into the skills and salary trends within the data analyst job market. The analysis serves as a strategic guide for prioritizing skill development and job search efforts. By focusing on high-demand, high-paying skills, aspiring data analysts can better position themselves in a competitive market. This experience underscored the importance of continuous learning and adapting to new trends in the ever-evolving field of data analytics