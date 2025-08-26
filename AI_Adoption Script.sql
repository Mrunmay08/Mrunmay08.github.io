SELECT * FROM ai_adoption_dataset;
SELECT * FROM world.city;
SELECT * FROM world.country;
SELECT * FROM world.countrylanguage;

-- Top 5 AI tools by adoption rate

SELECT 
    ai_tool, AVG(adoption_rate) AS avg_adoption
FROM
    ai_adoption_dataset
GROUP BY ai_tool
ORDER BY avg_adoption DESC
LIMIT 5;

-- AI adoption by industry and year

SELECT 
    industry, year, AVG(adoption_rate) AS avg_adoption
FROM
    ai_adoption_dataset
GROUP BY industry , year
ORDER BY year , avg_adoption DESC;

 -- Daily active users by country
 SELECT 
    country, SUM(daily_active_users) AS total_users
FROM
    ai_adoption_dataset
GROUP BY country
ORDER BY total_users DESC;

-- Adoption by company size
SELECT 
    company_size, AVG(adoption_rate) AS avg_adoption
FROM
    ai_adoption_dataset
GROUP BY company_size
ORDER BY avg_adoption DESC;

-- Adoption by age group
SELECT 
    age_group, AVG(adoption_rate) AS avg_adoption
FROM
    ai_adoption_dataset
GROUP BY age_group
ORDER BY avg_adoption DESC;

 -- Compare enterprise vs startups in AI adoption
 SELECT 
    company_size, ai_tool, AVG(adoption_rate) AS avg_adoption
FROM
    ai_adoption_dataset
WHERE
    company_size IN ('Enterprise' , 'Startup')
GROUP BY company_size , ai_tool
ORDER BY ai_tool , avg_adoption DESC;

Drop table city;
drop table country
