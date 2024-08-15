WITH  top_paying_job_skils as(
    select job_id,
    job_title,
    salary_year_avg,
    name as company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE
salary_year_avg is not NULL
ORDER BY
salary_year_avg DESC
limit 10
)
SELECT top_paying_job_skils.* , skills 
FROM top_paying_job_skils
INNER JOIN skills_job_dim ON top_paying_job_skils.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
salary_year_avg DESC