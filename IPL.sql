create database sports;
use sports;

#1. Create a table named ‘matches’ with appropriate data types for columns
create table matches
(
Id varchar(100), city varchar(100), date varchar(100), player_of_match varchar(100), venue varchar(100), 
neutral_venue varchar(100), team1 varchar(100), team2 varchar(100), toss_winner varchar(100), toss_decision varchar(100), 
winner varchar(100), result varchar(100), result_margin varchar(100), eliminator varchar(100), method varchar(100), umpire1 varchar(100), 
umpire2 varchar(100)
);

#3. Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’
set global local_infile=1;
load data local infile
"/Users/mehakkamra/Downloads/IPL_matches.csv"
into table matches
fields terminated by ','
lines Terminated by '\n'
ignore 1 lines;

select * from matches;
truncate table matches;

#2. Create a table named ‘deliveries’ with appropriate data types for columns
create table deliveries
(
Id varchar(100), inning varchar(100), overs varchar(100), ball varchar(100), batsman varchar(100), non_striker varchar(100), 
bowler varchar(100), batsman_runs varchar(100), extra_runs varchar(100), total_runs varchar(100), is_wicket varchar(100),
 dismissal_kind varchar(100), player_dismissed varchar(100), fielder varchar(100), extras_type varchar(100), batting_team varchar(100),
 bowling_team varchar(100)
 );
 
#4. Import data from CSV file ’IPL_Ball.csv’ attached in resources to ‘deliveries’
load data local infile
"/Users/mehakkamra/Downloads/IPL_Ball.csv"
into table deliveries
fields terminated by ','
lines Terminated by '\n'
ignore 1 lines;

select * from deliveries;

#5. Select the top 20 rows of the deliveries table.
select * from deliveries limit 20;

#6. Select the top 20 rows of the matches table.
select * from matches limit 20;

#7. Fetch data of all the matches played on 2nd May 2013.
desc matches;
SET sql_mode = '';
select date, STR_TO_DATE(date, '%d-%m-%Y') from matches;
select * from matches where date = "02-05-2013";

#8. Fetch data of all the matches where the margin of victory is more than 100 runs.
select * from matches where result_margin > 100;

#9. Fetch data of all the matches where the final scores of both teams are tied and order it in descending order of the date.
select * from matches
where result='tie' 
order by YEAR(STR_TO_DATE(date, '%d-%m-%Y')) desc,
MONTH(STR_TO_DATE(date, '%d-%m-%Y')) desc,
DAY(STR_TO_DATE(date, '%d-%m-%Y')) desc ;

#10. Get the count of cities that have hosted an IPL match.
select count(distinct city) from matches;

