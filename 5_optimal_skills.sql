SELECT 
skills_dim.skill_id,
skills_dim.skills,
count(skills_job_dim.job_id) as skill_count,
round(avg(job_postings_fact.salary_year_avg),0) as average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
job_title_short='Data Analyst'
AND salary_year_avg is not NULL
AND job_work_from_home=TRUE
GROUP BY
skills_dim.skill_id
HAVING
count(skills_job_dim.job_id)>10
ORDER BY
average_salary desc,
skill_count DESC
limit 20