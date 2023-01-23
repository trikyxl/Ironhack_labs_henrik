USE sakila;
#1. Review the tables in the database.
SELECT*FROM Film;
SELECT * FROM Actor;
SELECT * FROM Country; 
Select Title From Film;
#4. unique languages
select distinct name as 'language' from Language;
#5.1
select max(Store_ID) from store;
#5.2
select max(Staff_id) from staff;
#5.3
select first_name from staff;