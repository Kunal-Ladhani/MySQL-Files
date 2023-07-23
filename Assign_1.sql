
create table student(s_id varchar(2),s_name varchar(10),s_address varchar(10), s_phone bigint, s_age int);
create table course(c_id varchar(2),c_name varchar(4));
create table student_course(s_id varchar(2),c_id varchar(2));

insert into course value("C1","DSA");
insert into course value("C2","JAVA");
insert into course value("C3","MERN");

insert into student_course value("S1","C1");
insert into student_course value("S1","C3");
insert into student_course value("S2","C1");
insert into student_course value("S3","C2");
insert into student_course value("S4","C2");
insert into student_course value("S4","C3");
insert into student_course value("S5","C2");


insert into student value("S1","RAM","DELHI",9455123451,18);
insert into student value("S2","RAMESH","DURGAON",9455123451,18);
insert into student value("S3","SUJIT","CHANDIGARH",9455123451,20);
insert into student value("S4","SURESH","DELHI",9455123451,18);
insert into student value("S5","RATAN","DELHI",9455123451,20);

select * from student;
select * from course;
SELECT * FROM student_course;

desc student;

-- ANSWERS BEGIN HERE
-- Q1
select * from student where s_address = "DELHI" and s_id in (select s_id from student_course where c_id in (select c_id from course where c_name = "JAVA"));

-- Q2
select movie.title, movie_rating.domestic_sales, movie_rating.international_sales from movie, movie_rating where id in (select movie_id from movie_rating where domestic_sales > international_sales);

-- Q3
select * from movies where id in (select movie_id from movie_rating order by rating desc);

-- Q4
select person.firstName,person.lastName,address.city,address.state from address,person right join address on person where person.personId = address.personId;