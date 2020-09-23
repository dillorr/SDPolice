SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 'ON';
show variables like 'secure_file_priv';

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

drop table if exists actions_taken;
drop table if exists basis_for_property_seizure;
drop table if exists basis_for_search;
drop table if exists disability;
drop table if exists gender;
drop table if exists property_seized;
drop table if exists race;
drop table if exists reason_for_stop;
drop table if exists result_of_stop;
drop table if exists stop_details;


-- actions taken

create table actions_taken (
stop_id0 int not null,
pid0 int,
action varchar(100),
consented varchar(100),
primary key (stop_id0)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/actionsTaken/ripa_actions_taken_datasd.csv" 
INTO TABLE actions_taken 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- basis for propery seizure

create table basis_for_property_seizure (
stop_id1 int not null,
pid1 int,
basis_for_property_seizure varchar(100),
primary key (stop_id1)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/basisForPropertySeizure/ripa_prop_seize_basis_datasd.csv" 
INTO TABLE basis_for_property_seizure 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- basis for search

create table basis_for_search (
stop_id2 int not null,
pid2 int,
basis_for_search varchar(100),
basis_for_search_explanation varchar(100),
primary key (stop_id2)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/basisForSearchesConducted/ripa_search_basis_datasd.csv" 
INTO TABLE basis_for_search 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- disability of persons

create table disability (
stop_id3 int not null,
pid3 int,
disability varchar(100),
primary key (stop_id3)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/disabilityOfPersons/ripa_disability_datasd.csv"
INTO TABLE disability 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- gender of persons

create table gender (
stop_id4 int not null,
pid4 int,
gender varchar(100),
primary key (stop_id4)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/genderOfPersons/ripa_gender_datasd.csv" 
INTO TABLE gender 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- property seized

create table property_seized (
stop_id5 int not null,
pid5 int,
type_of_property_seized varchar(100),
primary key (stop_id5)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/propertySeized/ripa_prop_seize_type_datasd.csv"
INTO TABLE property_seized 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- race of persons

create table race (
stop_id6 int not null,
pid6 int,
race varchar(100),
primary key (stop_id6)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/raceOfPersons/ripa_race_datasd.csv"
INTO TABLE race 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- reason for stop
create table reason_for_stop (
stop_id7 int not null,
pid7 int,
reason_for_stop varchar(100),
reason_for_stopcode int,
reason_for_stop_code_text varchar (100),
reason_for_stop_detail varchar(100),
reason_for_stop_explanation varchar(100),
primary key (stop_id7)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/reasonForStop/ripa_stop_reason_datasd.csv"
INTO TABLE reason_for_stop 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- result of stop
create table result_of_stop (
stop_id8 int not null,
pid8 int,
result_key int,
result varchar(100),
code int,
result_text varchar(100),
primary key (stop_id8)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/resultOfStop/ripa_stop_result_datasd.csv" 
INTO TABLE result_of_stop 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


-- details of stop
create table stop_details (
stop_id9 int not null,
ori varchar(100),
agency varchar(100),
exp_years varchar(100),
date_stop varchar(100),
time_stop varchar(100),
stop_duration int,
stop_in_response_to_cfs int,
officer_assignment_key int,
assignment varchar(100),
intersection varchar(100),
address_block float,
landmark varchar(100),
address_street varchar(100),
highway_exit varchar(100),
is_school int,
school_name varchar(100),
address_city varchar (100),
beat int,
beat_name varchar(100),
pid9 int,
is_student int,
perceived_limited_english int,
perceived_age int,
perceived_gender varchar(100),
gender_non_conforming int,
gender2 int,
gender_nc int,
perceived_lgbt varchar(100),
primary key (stop_id9)
);

LOAD DATA LOCAL INFILE "/home/dillorr/shared-drives/C:/Users/dillon/projects/SDTechHub/policeData/stopDetails/ripa_stops_datasd.csv"
INTO TABLE stop_details 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

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

-- left outer join all

create table merged
	select * from actions_taken as at
		left join basis_for_property_seizure as bp on at.stop_id0 = bp.stop_id1
		left join basis_for_search as bs on at.stop_id0 = bs.stop_id2
		left join disability as di on at.stop_id0 = di.stop_id3
		left join gender as ge on at.stop_id0 = ge.stop_id4
		left join property_seized as ps on at.stop_id0 = ps.stop_id5
		left join race as ra on at.stop_id0 = ra.stop_id6
		left join reason_for_stop as rf on at.stop_id0 = rf.stop_id7
		left join result_of_stop as ro on at.stop_id0 = ro.stop_id8
		left join stop_details as sd on at.stop_id0 = sd.stop_id9;









