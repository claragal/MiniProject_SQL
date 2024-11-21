LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/respondents.csv'
INTO TABLE respondents
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/internet_use.csv'
INTO TABLE internet_use
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @internet_use, @internet_freq, @internet_time)
SET respondent_id = @respondent_id,
    internet_use = NULLIF(@internet_use, ''),
    internet_freq = NULLIF(@internet_freq, ''),
    internet_time = NULLIF(@internet_time, '');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/opinions_values.csv'
INTO TABLE opinions_values
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @trust_scientists, @value_new_experiences, @value_new_experiences_a, @value_help_others, @value_help_others_a)
SET respondent_id = @respondent_id,
    trust_scientists = NULLIF(@trust_scientists, ''),
    value_new_experiences = NULLIF(@value_new_experiences, ''),
    value_new_experiences_a = NULLIF(@value_new_experiences_a, ''),
    value_help_others = NULLIF(@value_help_others, ''),
    value_help_others_a = NULLIF(@value_help_others_a, '');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personal_wellbeing.csv'
INTO TABLE personal_wellbeing
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/religion_social_life.csv'
INTO TABLE religion_social_life
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @religiosity, @social_activities, @social_meetings, @discuss_matters)
SET respondent_id = @respondent_id,
    religiosity = @religiosity,
    social_activities = @social_activities,
    social_meetings = @social_meetings,
    discuss_matters = NULLIF(@discuss_matters, '');
    

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/social_identity.csv'
INTO TABLE social_identity
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @minority_ethnic_group, @discriminated_group)
SET respondent_id = @respondent_id,
    minority_ethnic_group = NULLIF(@minority_ethnic_group, ''),
    discriminated_group = @discriminated_group;
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sociodemographics.csv'
INTO TABLE sociodemographics
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @country, @gender, @birth_year, @household_members, @children_in_house, 
 @marital_status, @marital_status_a, @household_income, @household_income_a, 
 @paid_work, @retired, @unemployed_active, @unemployed_inactive, @community_service, 
 @housework, @disabled, @education_status, @activity_other, @activity_refusal, 
 @activity_unknown, @activity_no_answer, @highest_education_level)
SET respondent_id = @respondent_id,
    country = @country,
    gender = @gender,
    birth_year = @birth_year,
    household_members = @household_members,
    children_in_house = @children_in_house,
    marital_status = NULLIF(@marital_status, ''),
    marital_status_a = NULLIF(@marital_status_a, ''),
    household_income = NULLIF(@household_income, ''),
    household_income_a = NULLIF(@household_income_a, ''),
    paid_work = @paid_work,
    retired = @retired,
    unemployed_active = @unemployed_active,
    unemployed_inactive = @unemployed_inactive,
    community_service = @community_service,
    housework = @housework,
    disabled = @disabled,
    education_status = @education_status,
    activity_other = @activity_other,
    activity_refusal = NULLIF(@activity_refusal, ''),
    activity_unknown = NULLIF(@activity_unknown, ''),
    activity_no_answer = @activity_no_answer,
    highest_education_level = NULLIF(@highest_education_level, '');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/survey_metadata.csv'
INTO TABLE survey_metadata
FIELDS TERMINATED BY ','         -- Comma as the delimiter
IGNORE 1 LINES
(@respondent_id, @dataset_title, @interview_length, @interview_year)
SET respondent_id = @respondent_id,
    dataset_title = @dataset_title,
    interview_length = NULLIF(@interview_length, ''),
    interview_year = NULLIF(@interview_year, '');
