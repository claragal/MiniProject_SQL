-- Paso 1: Crear la base de datos
CREATE DATABASE IF NOT EXISTS MiniProject_ESS;

-- Paso 2: Seleccionar la base de datos
USE MiniProject_ESS;

-- Paso 3: Crear las tablas (ya proporcionadas anteriormente)

-- Creación de la tabla 'respondents'
CREATE TABLE respondents (
    respondent_id INT AUTO_INCREMENT PRIMARY KEY
);

-- Creación de la tabla 'sociodemographics'
CREATE TABLE sociodemographics (
    respondent_id INT,
    country VARCHAR(2),
    gender INT,
    birth_year INT,
    household_members INT,
    children_in_house INT,
    marital_status FLOAT,
    marital_status_a FLOAT,
    household_income FLOAT,
    household_income_a FLOAT,
    paid_work INT,
    retired INT,
    unemployed_active INT,
    unemployed_inactive INT,
    community_service INT,
    housework INT,
    disabled INT,
    education_status INT,
    activity_other INT,
    activity_refusal FLOAT,
    activity_unknown FLOAT,
    activity_no_answer INT,
    highest_education_level FLOAT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'social_identity'
CREATE TABLE social_identity (
    respondent_id INT,
    minority_ethnic_group FLOAT,
    discriminated_group INT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'internet_use'
CREATE TABLE internet_use (
    respondent_id INT,
    internet_use FLOAT,
    internet_freq FLOAT,
    internet_time FLOAT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'opinions_values'
CREATE TABLE opinions_values (
    respondent_id INT,
    trust_scientists FLOAT,
    value_new_experiences FLOAT,
    value_new_experiences_a FLOAT,
    value_help_others FLOAT,
    value_help_others_a FLOAT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'personal_wellbeing'
CREATE TABLE personal_wellbeing (
    respondent_id INT,
    happiness INT, -- Escala de felicidad (puedes definir el rango)
    health_status INT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'religion_social_life'
CREATE TABLE religion_social_life (
    respondent_id INT,
    religiosity INT,
    social_activities INT,
    social_meetings INT,
    discuss_matters FLOAT,
    PRIMARY KEY (respondent_id),
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);

-- Creación de la tabla 'survey_metadata'
CREATE TABLE survey_metadata (
    metadata_id INT AUTO_INCREMENT PRIMARY KEY,
    respondent_id INT,
    dataset_title VARCHAR(255),
    interview_length FLOAT,
    interview_year FLOAT,
    FOREIGN KEY (respondent_id) REFERENCES respondents(respondent_id)
);