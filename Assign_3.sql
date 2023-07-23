create table CITY (ID integer, NAME varchar(17), COUNTRYCODE varchar(3), DISTRICT varchar(20), POPULATION integer);
desc city;

insert into city value(3878,"Scottsdale","USA","ARIZONA",202705);
insert into city value(3965,"Corona","USA","CALIFORNIA",90000);
insert into city value(3973,"Concord","USA","CALIFORNIA",121780);
insert into city value(3977,"Cedar Rapids","USA","IOWA",120758);
insert into city value(3982,"Coral Springs","USA","FLORIDA",87456);

select * from city;
 
 -- ANSWERS BEGIN HERE
 -- 1
select * from city where population > 100000;
-- 2
select sum(population) from city where district = "California";
-- 3
select Round(avg(population),0) from city;