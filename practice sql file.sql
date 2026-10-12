create database student_db;


use student_db;

create table student(
studentid int auto_increment primary key,
firstname varchar(50),
lastname varchar(50),
birthdate date, 
gender varchar(10))

create table courses(
courseid int auto_increment primary key,
coursename varchar(50),
credits int);

create table enrollment(
enrollmentid int auto_increment primary key,
studentid int,
courseid int,
enrollmentdate date,
foreign key (studentid) references student (studentid),
foreign key (courseid) references courses (courseid));

create table courses(
courseid int auto_increment primary key,
coursename varchar(50),
credits int);

insert into student(firstname,lastname,birthdate,gender)
values 
('john', 'doe', '2005-05-15','male'),
('jane', 'smith','2002-11-09','female'),
('emily','johnson','2001-07-22','female'),
('michael','williams','2000-12-30','male'),
('sarah','brown','1998-10-10','female');

insert into courses(coursename,credits)
values
('mathematics','3'),
('computer science','4'),
('biology','3'),
('chemistry','4'),
('physics','3');

insert into enrollment(studentid,courseid,enrollmentdate)
values
('1','1','2021-08-20'),
('1','2','2021-08-20'),
('2','1','2021-08-20'),
('2','3','2021-08-20'),
('2','4','2021-08-20');

select * from student;

select * from courses;

select firstname, lastname from student;

select studentid,courseid,enrollmentdate from enrollment
order by courseid desc;

select studentid,courseid,enrollmentdate from enrollment
order by courseid asc;

select studentid,courseid,enrollmentdate from enrollment
where studentid < 9 ;

select studentid,courseid,enrollmentdate from enrollment
where studentid < 9 and enrollmentdate = 20
limit 5;

select studentid,courseid,enrollmentdate from enrollment
order by courseid desc
limit 5;

alter table student
drop birthdate;

select * from student;

select * from enrollment;

select count(*) as total_student
from student;

select count(*)
from enrollment;

select sum(credits) as total_credits
from  courses;

 select min(credits) as total_minimum
from  courses;

select 
max(credits) as total_maximum
from  courses;

select group_concat(credits) 
from  courses;

select variance(credits) 
from  courses;

select var_pop(credits)
from  courses;

select var_samp(courseid)
from  enrollment;

select std(courseid)
from  enrollment;

select stddev(courseid)
from  enrollment;

select stddev_pop(courseid)
from  enrollment;

select stddev_samp(courseid)
from  enrollment;

select count(*) 
from student
where gender = male;

select sum(credits) as total_credits
from courses
where coursename = 2;

select  studentid, count(*) as total_enrollment
from enrollment
group by studentid;

select coursename, count(*) as total_enrollment
from enrollment
groupby coursename;

select  studentid, count(*) as total_enrollment
from enrollment
group by studentid
having total_enrollment > 2;

select courseid, credits
from courses
where credits = (
   select  max(credits)
   from courses
);

select courseid, credits
from courses
where credits = (
   select  min(credits)
   from courses
);

select courseid
from courses
where  credits in (
    select courseid
    from courses
);




