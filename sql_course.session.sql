/*
Find the count of the number of remote job postings per skill
    -Display the top 5 skills by their demand in remote job
    -Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_job_skills as (
SELECT
    skill_id,
    COUNT(*) as skill_count
from 
    skills_job_dim as skills_to_job
INNER JOIN
job_postings_fact as job_postings ON
job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = True AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY skill_id)
SELECT * 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM 
remote_job_skills
INNER JOIN skills_dim as skill ON
skills.skill_id = remote_job_skills.skill_id
order BY skill_sount DESC
LIMIT 5;

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN
        job_postings_fact AS job_postings 
        ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = TRUE
        AND job_postings.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)
SELECT
    skill.skill_id,
    skill.skill_name,
    remote_job_skills.skill_count
FROM 
    remote_job_skills
INNER JOIN 
    skills_dim AS skill 
    ON skill.skill_id = remote_job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5;







