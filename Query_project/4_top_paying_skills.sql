SELECT skills,
--count(skills_job_dim.job_id) AS skill_count,
--max(salary_hour_avg) as highest_salary,
--min(salary_hour_avg) as lowest_salary,
round(avg(job_postings_fact.salary_hour_avg),2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_postings_fact.job_title_short='Data Analyst'
AND job_postings_fact.salary_year_avg is not null
GROUP BY(skills)
ORDER BY average_salary DESC
LIMIT 25