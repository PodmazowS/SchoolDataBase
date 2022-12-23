use master
go
create database school;
go
use school

create table marks (
mark decimal(2,1) primary key);

insert into marks values (2);
insert into marks values (3);
insert into marks values (3.5);
insert into marks values (4);
insert into marks values (4.5);
insert into marks values (5);
insert into marks values (5.5);
insert into marks values (6);

create table year_of_study (
year_no char(10) primary key);

insert into year_of_study values ('1');
insert into year_of_study values ('2');
insert into year_of_study values ('3');
insert into year_of_study values ('4');
insert into year_of_study values ('5');
insert into year_of_study values ('6');
insert into year_of_study values ('7');
insert into year_of_study values ('8');
insert into year_of_study values ('9');
insert into year_of_study values ('10');


create table classes (
class varchar(100) primary key);
insert into classes values
('Class of Mathematics'),
('Class of Chemistry'),
('Class of Biology'),
('Class of History'),
('Class of English');


create table teachers (
teacher_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone_number varchar(11) not null,
class varchar(100) not null,
foreign key (class) references classes (class) on delete no action on update cascade
);

insert into teachers values (1, 'Anna', 'Jackson', '122321321', 'Class of Mathematics');
insert into teachers values (2, 'Jimmy', 'Clarckson', '2132132', 'Class of History');
insert into teachers values(3, 'Tommy', 'Clarckson', '321321321', 'Class of Biology');
insert into teachers values(4, 'Tommy', 'Jackson', '321321321', 'Class of Chemistry');
insert into teachers values(5, 'Tommy', 'Jordan', '321321321', 'Class of English');



create table pupils (
pupil_id int identity primary key,
surname varchar(30) not null,
first_name varchar(25),
date_of_birth date,
year_no char(10),
foreign key (year_no) references year_of_study
on delete no action on update cascade
);

set identity_insert pupils on;
insert into pupils(pupil_id, surname, first_name, date_of_birth, year_no)
values (1, 'Kemeron', 'Genrick', '20001027', '6');
insert into pupils(pupil_id, surname, first_name, date_of_birth, year_no)
values (2, 'Genrick', 'Johny', '20001027', '7');
insert into pupils(pupil_id, surname, first_name, date_of_birth, year_no)
values (3, 'Poter', 'Harry', '20001027', '10');
insert into pupils(pupil_id, surname, first_name, date_of_birth, year_no)
values (4, 'Bowen', 'Harry', '20001027', '9');
insert into pupils(pupil_id, surname, first_name, date_of_birth, year_no)
values (5, 'Bowen', 'Sara', '20051122', '4');
set identity_insert pupils off;



create table lessons (
lesson_id int identity primary key,
pupil_id int not null,
lesson_name varchar(50) unique not null,
teacher_id int,
foreign key (teacher_id) references teachers
on delete no action on update no action,
foreign key (pupil_id) references pupils on delete cascade
);

set identity_insert lessons on
insert into lessons(lesson_id, pupil_id, lesson_name, teacher_id)
values (1, 1,'Algebra' ,1);
insert into lessons(lesson_id, pupil_id, lesson_name, teacher_id)
values (2, 2,'History' ,2);
insert into lessons(lesson_id, pupil_id, lesson_name, teacher_id)
values (3, 3,'Biology' ,3);
insert into lessons(lesson_id, pupil_id, lesson_name, teacher_id)
values (4, 4,'Chemistry' ,4);
insert into lessons(lesson_id, pupil_id, lesson_name, teacher_id)
values (5, 5,'English' ,5);
set identity_insert lessons off

create table pupil_marks (
pupil_id int,
lesson_id int,
Date_of_receiving date,
mark decimal(2,1) not null,
foreign key (lesson_id) references lessons on delete no action on update cascade,
foreign key (mark) references marks on delete no action on update cascade,
);

insert into pupil_marks values (2, 1, '20180221', 2);
insert into pupil_marks values (1, 1, '20180221', 5);
insert into pupil_marks values (3, 1, '20180221', 2);
insert into pupil_marks values (5, 4, '20180221', 3);
insert into pupil_marks values (3, 5, '20180221', 2);
