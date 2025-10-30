WITH january_jobs AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
select * 
from january_jobs;


select  company_id,
name AS company_name
FROM company_dim
WHERE company_id IN(

    select
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
    company_id
);


/**CTE**/

WITH comapny_job_count AS (

select company_id,
    COUNT(*) AS total_jobs
from job_postings_fact
GROUP BY
    company_id
)
SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
from company_dim
left join company_job_count on
company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;




WITH company_job_count AS (
    SELECT company_id,
           COUNT(*) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT *
FROM company_job_count;
