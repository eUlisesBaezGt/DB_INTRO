CREATE TABLE IF NOT EXISTS studen(
    stud_id varchar(7) NOT NULL primary key,
    birthdate date NOT NULL,
    fist_name varchar not null,
    last_name_1 varchar not null,
    last_name_2 varchar not null
) CREATE TABLE IF NOT EXISTS course(
    stud_id varchar(7) NOT NULL primary key references student(stud_id),
    class_id varchar(4) NOT NULL primary key references class(class_id),
) CREATE TABLE IF NOT EXISTS class(
    class_id varchar(4) NOT NULL primary key,
    class_name varchar not null,
    teacher varchar not null
) CREATE TABLE IF NOT EXISTS emergency_tel(
    stud_id varchar(7) NOT NULL primary key references student(stud_id),
    phone_number varchar(10) not null
) CREATE TABLE IF NOT EXISTS exam(
    exam_date date not null primary key,
    grade float not null,
    class_id varchar(4) NOT NULL primary key references class(class_id),
    stud_id varchar(7) NOT NULL primary key references student(stud_id)
)

-----------------------------------

CREATE TABLE student (
    stud_id varchar(7) NOT NULL primary key,
    birthdate varchar NOT NULL,
    fist_name varchar not null,
    last_name_1 varchar not null,
    last_name_2 varchar not null
);
insert into student (stud_id,birthdate,fist_name,last_name_1,last_name_2)
values (02123,'2003-11-22','Sant','Val','Uri')
