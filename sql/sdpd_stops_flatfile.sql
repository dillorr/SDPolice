-- start with: mysql --local-infile=1 -u dillorr -p

-- GENERAL CONFIGURATION AND SETUP
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

-- ADDITIONAL SETTINGS {I'm not familiar with the specifics on these...}
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 'ON';
SHOW VARIABLES LIKE 'secure_file_priv';
​
/*
+----------------------------+
| Tables_in_policeData       |
+----------------------------+
| actions_taken              |
| basis_for_property_seizure |
| basis_for_search           |
| disability                 |
| gender                     |
| property_seized            |
| race                       |
| reason_for_stop            |
| result_of_stop             |
| stop_details               |
+----------------------------+
10 rows in set (0.00 sec)
*/
​
DROP TABLE IF EXISTS actions_taken;
DROP TABLE IF EXISTS basis_for_property_seizure;
DROP TABLE IF EXISTS basis_for_search;
DROP TABLE IF EXISTS disability;
DROP TABLE IF EXISTS gender;
DROP TABLE IF EXISTS property_seized;
DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS reason_for_stop;
DROP TABLE IF EXISTS result_of_stop;
DROP TABLE IF EXISTS stop_details;
​
​
-- actions taken
CREATE TABLE actions_taken 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        [action]                        VARCHAR(100)                    NULL,
        consented                       VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_actionstaken             PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );

-- {I've almost never had good luck with this when importing to a server; awesome you go this running!}​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/actionsTaken/ripa_actions_taken_datasd.csv" 
INTO TABLE actions_taken 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- basis for propery seizure
CREATE TABLE basis_for_property_seizure 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        basis_for_property_seizure      VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_basisforpropertyseizure  PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/basisForPropertySeizure/ripa_prop_seize_basis_datasd.csv" 
INTO TABLE basis_for_property_seizure 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- basis for search
CREATE TABLE basis_for_search 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        basis_for_search                VARCHAR(100)                    NULL,
        basis_for_search_explanation    VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_basisforsearch           PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/basisForSearchesConducted/ripa_search_basis_datasd.csv" 
INTO TABLE basis_for_search 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- disability of persons
CREATE TABLE disability 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        disability                      VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_disability               PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/disabilityOfPersons/ripa_disability_datasd.csv"
INTO TABLE disability 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- gender of persons
CREATE TABLE gender 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        gender                          VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_gender                   PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/genderOfPersons/ripa_gender_datasd.csv" 
INTO TABLE gender 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- property seized
CREATE TABLE property_seized 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        type_of_property_seized         VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_propertyseized           PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/propertySeized/ripa_prop_seize_type_datasd.csv"
INTO TABLE property_seized 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- race of persons
CREATE TABLE race 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        race                            VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_race                     PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/raceOfPersons/ripa_race_datasd.csv"
INTO TABLE race 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- reason for stop
CREATE TABLE reason_for_stop 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        reason_for_stop                 VARCHAR(100)                    NULL,
        reason_for_stopcode             INT                             NULL,
        reason_for_stop_code_text       VARCHAR(100)                    NULL,
        reason_for_stop_detail          VARCHAR(100)                    NULL,
        reason_for_stop_explanation     VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_reasonforstop            PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/reasonForStop/ripa_stop_reason_datasd.csv"
INTO TABLE reason_for_stop 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- result of stop
CREATE TABLE result_of_stop 
    (
        stop_id                         INT                         NOT NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        result_key                      INT                             NULL,
        result                          VARCHAR(100)                    NULL,
        code                            INT                             NULL,
        result_text                     VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_resultofstop             PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/resultOfStop/ripa_stop_result_datasd.csv" 
INTO TABLE result_of_stop 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
​
-- details of stop
CREATE TABLE stop_details 
    (
        stop_id                         INT                         NOT NULL,
        ori                             VARCHAR(100)                    NULL,
        agency                          VARCHAR(100)                    NULL,
        exp_years                       VARCHAR(100)                    NULL,
        date_stop                       VARCHAR(100)                    NULL,
        time_stop                       VARCHAR(100)                    NULL,
        stop_duration                   INT                             NULL,
        stop_idn_response_to_cfs        INT                             NULL,
        officer_assignment_key          INT                             NULL,
        assignment                      VARCHAR(100)                    NULL,
        intersection                    VARCHAR(100)                    NULL,
        address_block                   FLOAT                           NULL, -- {I've never seen this used in SQL... is this right for adress instead of INT?}
        landmark                        VARCHAR(100)                    NULL,
        address_street                  VARCHAR(100)                    NULL,
        highway_exit                    VARCHAR(100)                    NULL,
        is_school                       INT                             NULL,
        school_name                     VARCHAR(100)                    NULL,
        address_city                    VARCHAR(100)                    NULL,
        beat                            INT                             NULL,
        beat_name                       VARCHAR(100)                    NULL,
        pid                             INT                         NOT NULL, -- are there any records where this is NULL?  I thought this was NOT NULL, but am unsure
        is_student                      INT                             NULL,
        perceived_limited_english       INT                             NULL,
        perceived_age                   INT                             NULL,
        perceived_gender                VARCHAR(100)                    NULL,
        gender_non_conforming           INT                             NULL,
        gender2                         INT                             NULL,
        gender_nc                       INT                             NULL,
        perceived_lgbt                  VARCHAR(100)                    NULL,
        CONSTRAINT                      PK_stopdetails              PRIMARY KEY CLUSTERED (stop_id, pid) -- if PID can be NULL then just (stop_id) here
    );
​
LOAD DATA LOCAL INFILE "~/projects/SDTechHub/policeData/stopDetails/ripa_stops_datasd.csv"
INTO TABLE stop_details 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;
​
/*
+----------------------------+
| Tables_in_policeData       |
+----------------------------+
| actions_taken              |
| basis_for_property_seizure |
| basis_for_search           |
| disability                 |
| gender                     |
| property_seized            |
| race                       |
| reason_for_stop            |
| result_of_stop             |
| stop_details               |
+----------------------------+
10 rows in set (0.00 sec)
​
​
*/
​
-- left outer join all

SELECT  stops.stop_id,                      -- unique identifier for stop
        stops.date_stop,                    -- date stop occurred
        stops.time_stop,                    -- time stop began
        stops.stop_duration,                -- duration of time for stop in minutes
        stops.stop_idn_response_to_cfs,     -- was the stop made in response to a call for service? (0=No; 1=Yes)

        stops.address_city,                 -- name of city where stop occurred
        stops.beat,                         -- location of stop - SDPD beat
        stops.beat_name,                    -- location of stop - SDPD beat/neighborhood name
        stops.highway_exit,                 -- location of stop - highway exit
        stops.address_street,               -- location of stop - street name
        stops.intersection,                 -- location of stop - intersecting street name
        stops.address_block,                -- location of stop - hundred block
        stops.landmark,                     -- location of stop - landmark
        stops.is_school,                    -- did stop occur at a school?
        stops.school_name,                  -- name of school where stop occurred

        stops.ori,                          -- agency originating identifier (CA0371100)
        stops.agency,                       -- agency (SD)
        stops.officer_assignment_key,       -- type of officer assignment at time of stop (code)
        stops.assignment,                   -- type of officer assignment at time of stop (description)
        stops.exp_years,                    -- officer years of experience in law enforcement

        stops.pid,                          -- unique identifer for person on a stop
        stops.is_student,                   -- was person stopped a student? (0=No; 1=Yes)
        stops.perceived_limited_english,    -- officer's perception that the person stopped has limited or no fluency in English (0=No; 1=Yes)
        stops.perceived_age,                -- officer's perception of the approximate age of the person stopped (0=No; 1=Yes)
        stops.gender2,                      -- officer's perception of the gender of the person stopped (code)
        stops.perceived_gender,             -- officer's perception of the gender of the person stopped (description)
        stops.gender_nc,                    -- officer's perception of whether the person stopped is gender nonconforming (NoData=No; 5=Yes)
        stops.gender_non_conforming,        -- officer's perception of whether the person stopped is gender nonconforming (0=No; 1=Yes)
        gndr.gender,                        -- officer's perception of the gender of the person stopped
        stops.perceived_lgbt,               -- officer's perception of whether the person stopped is lesbian, gay, bisexual or transgender (Yes; No)
        race.race,                          -- officer's perception of the race(s) of the person stopped
        dsbl.disability,                    -- officer's perception the person stopped displayed signs of listed condition(s)

        reason.reason_for_stopcode,         -- specific violation if reason for stop is traffic violation or reasonable suspicion of criminal activity (code)
        reason.reason_for_stop_code_text,   -- specific violation if reason for stop is traffic violation or reasonable suspicion of criminal activity (description)
        reason.reason_for_stop,             -- primary reason the officer stopped the person
        reason.reason_for_stop_detail,      -- detailed primary reason the officer stopped the person
        reason.reason_for_stop_explanation, -- brief narrative explaining the reason for the stop
        
        actn.[action],                      -- officer's actions toward the person stopped
        actn.consented,                     -- response by person stopped if officer asked for consent to search (blank=No; Yes=Yes)

        srch.basis_for_search,              -- basis for search, if officer searched person or property
        srch.basis_for_search_explanation,  -- brief narrative explaining the reason for the search
        
        seiz.basis_for_property_seizure,    -- basis for property seizure        
        prsz.type_of_property_seized,       -- typeOfPropertySeized

        rslt.result_key,                    -- outcome(s) of stop (code)
        rslt.result,                        -- outcome(s) of stop (description)
        rslt.code,                          -- specific violation if stop outcome is warning, citation or custodial arrest (code)
        result.result_text                  -- specific violation if stop outcome is warning, citation or custodial arrest (description)

INTO    sdpd_stops_flatfile                 ---{previously CREATE TABLE merged}
FROM    stop_details AS stops
        LEFT OUTER JOIN gender AS gndr ON stops.stop_id = gndr.stop_id
            AND stops.pid = gndr.pid
        LEFT OUTER JOIN race ON stops.stop_id = race.stop_id
            AND stops.pid = race.pid
        LEFT OUTER JOIN disability AS dsbl ON stops.stop_id = dsbl.stop_id
            AND stops.pid = dsbl.pid
        LEFT OUTER JOIN reason_for_stop AS reason ON stops.stop_id = reason.stop_id
            AND stops.pid = reason.pid
        LEFT OUTER JOIN actions_taken AS actn ON stops.stop_id = actn.stop_id
            AND stops.pid = actn.pid
        LEFT OUTER JOIN basis_for_search AS srch ON stops.stop_id = srch.stop_id
            AND stops.pid = srch.pid
        LEFT OUTER JOIN basis_for_property_seizure AS seiz ON stops.stop_id = seiz.stop_id
            AND stops.pid = seiz.pid
        LEFT OUTER JOIN property_seized AS prsz ON stops.stop_id = prsz.stop_id
            AND stops.pid = prsz.pid
        LEFT OUTER JOIN result_of_stop AS rslt ON stops.stop_id = rslt.stop_id
            AND stops.pid = rslt.pid