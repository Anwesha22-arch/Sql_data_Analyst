SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date::DATE AS date
FROM
job_postings_fact;

SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date
FROM
job_postings_fact
LIMIT 5;

SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
EXTRACT(MONTH FROM job_posted_date) AS date_month,
EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
job_postings_fact
LIMIT 5;

SELECT
COUNT(job_id) AS job_posted_count,
EXTRACT(MONTH FROM job_posted_date) AS month
FROM
job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;


/** write a query to find the avg salary both yearly and hourly for job postings that were posted after june 1,2023 and then
group the results b job schedule type**/

SELECT
job_schedule_type,
ROUND(AVG(salary_year_avg),2) AS avg_yearly_salary,
ROUND(AVG(salary_hour_avg),2) AS avg_hourly_salary
FROM
    job_postings_fact
GROUP BY
    job_schedule_type
ORDER BY
    job_schedule_type DESC;

/**write a query to count the number of job postings for each month in 2023
adjusting the job_posted_date**/

SELECT * FROM job_postings_fact
limit 10;

SELECT
EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) AS month,
COUNT(*) AS postings
FROM job_postings_fact
WHERE EXTRACT(YEAR  FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) = 2023
GROUP BY month
ORDER BY month;


