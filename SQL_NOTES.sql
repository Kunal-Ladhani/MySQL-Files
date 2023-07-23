select * from persons where age < 40 order by age; 

-- Ctrl + Enter to run in MySQL

insert into persons value ("NULL-Person",0);

-- delete from persons where age = 0;

insert into persons value ("NULL-Person",0);

insert into persons(fname, age) value ("NULL-Person",0);

select count(*) from persons;

select fname from persons where age = 0 order by age desc;

select fname from persons where fname = "NULL-Person";

delete from person where fname = "NULL-Person";

select * from persons limit 2;

insert into persons value (null,0);

select * from persons where fname is null;

select * from persons order by age desc limit 1;

select * from persons where fname like '_%' order by age asc;
select * from persons order by age asc;

select * from persons where fname in ("kunal","rohit","chunni");

select * from persons where age > 20 and age < 40;	-- both are same 
select * from persons where age between 20 and 40;	-- just used a keyword here

create table temp (employee_id int, employee_salary int, employee_code int);

select * from temp; 

/*
	DML - data manipulation language
	create, read, update, delete -> CRUD operations
 
	DDL - data defination language
	you use keyword table, or database there
	create or remove entire structures that can hold data
		
	DML - Data Manipulation Language
    update, insert, delete, these are DML queries
*/

alter table temp drop column employee_code;
-- be very cautious about drop
-- it will delete entire column

select * from temp;

delete from temp;
-- clears all the rows of the temp table
-- table will still be there

drop table temp;
-- removed the entire table from existance -> be careful!
-- table will not be there

desc temp;
-- what is extra in description

/*
Primary key -> it has a constraint or a condition

- uniquely defines a row/record in the table
- its value should not be null 
- its value must be unique

- a table can have only one primary key
- in a table this primary key can consist of single or multiple columns


UUID - universal unique identifier
- at many places UUID is used as primary key
- it will always be unique
- based on location, time stamp, ip address, etc.
- no one can generate the same UUID
- can be generated in Java

*/

select * from temp;
select * from persons;

update persons set age = 10 where fname is null;

delete from persons where fname is null;

create table Student(ID int NOT NULL, name varchar(15), PRIMARY KEY(ID));

select * from student;
insert into student values(1,"one");
Insert into student values(null,"two");
-- cant put null in ID as it is pry key

insert into student values(2,"two");
insert into student values(3,"three");
insert into student values(4,"four");
insert into student values(5,"five");

/*
	ID - pry key of student table (PK).
    
    lets say score_ID is primary key(PK) of score table.
	and it has student_ID too. 
    so, here student id is FOREIGN KEY (FK)
	-> used to connect two tables
    -> it is a normal column in this table but PRIMARY KEY is aother table
*/

create table parent (parent_id int not null, parent_name varchar(15), primary key (parent_id));

select * from parent; 

insert into parent values (1,"ramesh");
insert into parent values (2,"suresh");
insert into parent values (3,"mahesh");
insert into parent values (4,"sarvesh");

select * from parent;

create table child (child_id int not null, parent_id int, primary key(child_id), foreign key(parent_id) references parent(parent_id));

select * from parent;
desc parent;

select * from child;
desc child;

insert into child values (11,1),(12,2),(13,3);
insert into child value (14,4);
insert into child value (15,null);

delete from parent where parent_id = 1;

select * from parent;
delete from child where parent_id = 1;

-- you cannot delete a primary key which is a foreign key in some other table
-- you cannot delete or update a column that is referenced in some other table
-- first make the changes in child table, only then come to the parent table
-- to ensure data consistency

-- this is rule -> foreign key constraint

-- to remove this foreign key constraint from child table
alter table child drop foreign key parent_id;

-- never store image etc in your db
-- always store it in file system
-- it will give you a url, store that in table

/*
-- primary key is always indexed
-> searching using primary key is very easy
-> otw in a table searching without pry key is very difficult

/*
-- to add primary key
alter table student add primary key(s_id);

-- to drop primary key
alter table student drop primary key;
*/



INDEXING

-> indexing is like hashmap, you can access the right address in one go
-> if you dont have index you have to iterate it from top to bottom -> linear search -> O(N) time
-> uses B-Tree data structures
*/

/*
we can get to child_id = 3 in constant time
like in array we can get to any data item in O(1) time
similarly, in db primary key is always indexed, so search will be in O(1) time

for not indexed columns, search will be in O(N) time -> linear search

indexes are implemented using different DS, B-Trees are used mostly. -> makes searching very easy

query on not indexed column will be slow -> always! will be visible in large tables
*/

-- you can ingest data from files into the DB (REMEMBER THIS)

-- to create index
create index idx_fname on persons(fname);

select * from persons;

select * from persons where fname = "kunal";

-- to delete index
drop index idx_fname on persons;

-- no need to create index on primary key -> already indexed
-- helps with search in large table
-- helps when main operation is read query
-- helps when main operation is where query

/*
DRAWBACK OF INDEXES

its like maintaining a sorted array
for any insertion or deletion in table, operation is costly
this is called reindexing, it is a performance drag

it causes a lot of load on memory -> DS is created that has is lot of memory overhead

-- only helpful when READ is the major operation.
-- like -> maintaining a sorted array is costly
*/

-- JOINS
-- when we want to see data from multiple tables in one place we use joins

select * from parent;
select * from child;

select * from parent join child;

-- we can perform join in two ways -

-- 1. explicit join
-- INNER JOIN -> intersection
select parent.parent_id ,child_id, parent_name from parent INNER JOIN child on parent.parent_id = child.parent_id;

-- LEFT JOIN
select parent.parent_id ,child_id, parent_name from parent LEFT JOIN child on parent.parent_id = child.parent_id;

-- RIGHT JOIN
select parent.parent_id ,child_id, parent_name from parent RIGHT JOIN child on parent.parent_id = child.parent_id;

-- in MySQL full outer join is not fully supported
-- so we do (left join) union (right join)
(SELECT 
    parent.parent_id, child_id, parent_name
FROM
    parent
        LEFT JOIN
    child ON parent.parent_id = child.parent_id) UNION (SELECT 
    parent.parent_id, child_id, parent_name
FROM
    parent
        RIGHT JOIN
    child ON parent.parent_id = child.parent_id);

-- 2. implicit join
select parent.parent_id ,child.child_id, parent.parent_name from parent,child where parent.parent_id = child.parent_id;

-- subquery or Nested Query
-- insert into child values(select parent_id from parent where parent_id = 1);

select * from child;

create table child_name (firstName varchar(20), lastName varchar(20), child_id int);

insert into child_name values ("Kunal", "Ladhani", 15);
insert into child_name values ("Rohit", "Ladhani", 12);
insert into child_name values ("Simran", "Ladhani", 13);
insert into child_name values ("Kinjal", "Ladhani", 14);

select * from child_name;

select * from child;

select firstName, lastName, parent_id from child_name, child where child.child_id = child_name.child_id and parent_id in (1,2,3);

update child set parent_id = 1 where child_id = 15;

/*
1. delete (dml) - delete will delete specified or all the rows of a table (table still there, doesnt delete schema, indexpk, fk)
-- table keyword not used
delete from table_name

2. truncate (ddl) - delete all the rows of table (table still there, doesnt delete schema, indexpk, fk)
-- table keyword used
truncate table table_name

3. drop (ddl) - deletes the table itself (table gone, deletes schema, indexpk, fk)
-- table keyword used
drop table table_name


In DDL please be careful, you might lose the whole table.
*/

