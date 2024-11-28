USE MiniProject_ESS;

-- Check the countries
SELECT DISTINCT country
FROM sociodemographics;

-- Filtering data with Where clause. España y hombres
SELECT respondent_id, country, gender, birth_year
FROM sociodemographics
WHERE country = 'ES' AND gender = 1;

-- Aggregating data with count and group by. Number of interviews per country (any year)
SELECT country, COUNT(respondent_id) AS respondent_count
FROM sociodemographics
GROUP BY country;

-- Joining tables. Sociodemo with internet_use
SELECT sd.respondent_id, sd.country, sd.gender, iu.internet_use, iu.internet_freq
FROM sociodemographics sd
JOIN internet_use iu ON sd.respondent_id = iu.respondent_id;

SELECT
    sd.respondent_id,
    sd.country,
    sd.gender,
    sd.birth_year,
    sd.household_members,
    sd.children_in_house,
    sd.marital_status,
    sd.household_income,
    sd.paid_work,
    sd.retired,
    sd.unemployed_active,
    sd.community_service,
    sd.housework,
    sd.disabled,
    sd.education_status,
    sd.activity_other,
    sd.activity_refusal,
    sd.activity_unknown,
    sd.activity_no_answer,
    pw.happiness,
    sm.interview_year
FROM
    sociodemographics sd
JOIN
    personal_wellbeing pw ON sd.respondent_id = pw.respondent_id
JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    sd.country = 'ES'  -- Filtrar por España (código 'ES')
    AND sm.interview_year = 2023;  -- Filtrar por el año 2023

-- Checking the interview year data - it doesn't work to temorary analysis (it doesn't include all the years)
SELECT DISTINCT interview_year FROM survey_metadata;

-- Filtering by year using the dataset title (which is a good variable that have a year equivalence)
SELECT
    sd.respondent_id,
    sd.country,
    sd.gender,
    sd.birth_year,
    pw.happiness,
    sm.dataset_title
FROM
    sociodemographics sd
JOIN
    personal_wellbeing pw ON sd.respondent_id = pw.respondent_id
JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    sd.country = 'ES'  -- Filtrar por España (código 'ES')
    AND pw.happiness NOT IN (77, 88); 
    
-- Average hapiness in Spain by interview name (as variable for interview year)
SELECT
    sm.dataset_title,
    ROUND(AVG(pw.happiness), 2) AS avg_happiness
FROM
    sociodemographics sd
JOIN
    personal_wellbeing pw ON sd.respondent_id = pw.respondent_id
JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    sd.country = 'ES'  -- Filtrar solo los datos de España
    AND pw.happiness NOT IN (77, 88)  -- Excluir respuestas "Refusal" y "Don't know"
GROUP BY
    sm.dataset_title
ORDER BY
    avg_happiness DESC;  -- Ordenar de mayor a menor felicidad promedio
    
-- Average hapiness in Norway by interview name (as variable for interview year)
SELECT
	sd.country,
    sm.dataset_title,
    ROUND(AVG(pw.happiness), 2) AS avg_happiness
FROM
    sociodemographics sd
JOIN
    personal_wellbeing pw ON sd.respondent_id = pw.respondent_id
JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    sd.country = 'NO'  -- Filtrar solo los datos de España
    AND pw.happiness NOT IN (77, 88)  -- Excluir respuestas "Refusal" y "Don't know"
GROUP BY
    sm.dataset_title
ORDER BY
    avg_happiness DESC;  -- Ordenar de mayor a menor felicidad promedio
    
-- Average hapiness by country and by interview name (as variable for interview year)
SELECT
    sd.country,
    sm.dataset_title,
    ROUND(AVG(pw.happiness), 2) AS avg_happiness
FROM
    sociodemographics sd
JOIN
    personal_wellbeing pw ON sd.respondent_id = pw.respondent_id
JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    pw.happiness NOT IN (77, 88)  -- Excluir respuestas "Refusal" y "Don't know"
GROUP BY
    sd.country, sm.dataset_title  -- Agrupar por país y nombre de encuesta
ORDER BY
    sd.country, avg_happiness DESC;  -- Ordenar por país y luego por felicidad promedio

-- Analysing the evolution of internet use by country
SELECT
    sd.country,
    sm.dataset_title,
    COUNT(iu.internet_freq) AS daily_internet_users
FROM
    sociodemographics sd
INNER JOIN
    internet_use iu ON sd.respondent_id = iu.respondent_id
INNER JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
WHERE
    iu.internet_freq = 5  -- Filtrar por "uso diario" (5 en internet_freq)
GROUP BY
    sd.country, sm.dataset_title
ORDER BY
    sd.country, daily_internet_users DESC;

SELECT
    sd.country,
    sm.dataset_title,
    COUNT(iu.internet_freq) AS total_responses,  -- Total answers
    COUNT(CASE WHEN iu.internet_freq = 5 THEN 1 END) AS daily_users,  -- Answeres = 5 (daily users)
    ROUND(
        (COUNT(CASE WHEN iu.internet_freq = 5 THEN 1 END) / COUNT(iu.internet_freq)) * 100, 
        2
    ) AS percentage_daily_internet_users  -- % Answers = 5 (daily users)
FROM
    sociodemographics sd
INNER JOIN
    internet_use iu ON sd.respondent_id = iu.respondent_id
INNER JOIN
    survey_metadata sm ON sd.respondent_id = sm.respondent_id
GROUP BY
    sd.country, sm.dataset_title
ORDER BY
    sd.country, percentage_daily_internet_users DESC;
    
    
    