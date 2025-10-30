
select
    job_id,
    skill_id,
    
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON
    job_postings.job_id = skills_to_job.job_id