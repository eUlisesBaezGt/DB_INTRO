CREATE TABLE IF NOT EXISTS student
(
    stud_id     varchar(7) NOT NULL primary key,
    birthdate   date       NOT NULL,
    fist_name   varchar    not null,
    last_name_1 varchar    not null,
    last_name_2 varchar    not null
);


CREATE TABLE IF NOT EXISTS course
(
    stud_id   varchar(7) NOT NULL references student (stud_id),
    class_id  varchar(4) NOT NULL references class (class_id),
    course_id varchar(4) NOT NULL primary key
);


CREATE TABLE IF NOT EXISTS class
(
    class_id   varchar(4) NOT NULL primary key,
    class_name varchar    not null,
    teacher    varchar    not null
);


CREATE TABLE IF NOT EXISTS emergency_tel
(
    stud_id      varchar(7)  NOT NULL primary key references student (stud_id),
    phone_number varchar(10) not null
);


CREATE TABLE IF NOT EXISTS exam
(
    exam_date date       not null primary key,
    grade     float      not null,
    class_id  varchar(4) NOT NULL references class (class_id),
    stud_id   varchar(7) NOT NULL references student (stud_id)
);


------------------------------------------------------------------------------------
INSERT INTO student (stud_id,
                     birthdate,
                     fist_name,
                     last_name_1,
                     last_name_2)
VALUES ('0241823',
        '2003-09-27',
        'Enrique Ulises',
        'Báez',
        'Gómez Tagle'),
       ('0212570',
        '2003-11-22',
        'Santiago',
        'Valdés',
        'Uriarte'),
       ('0212508',
        '2003-01-12',
        'Carlos',
        'Isunza',
        'Frank'),
       ('0239907',
        '2002-07-11',
        'Guillermo Alejandro',
        'Hernández',
        'Sosa');


INSERT INTO class (class_id, class_name, teacher)
VALUES ('A001',
        'Estructura de Datos',
        'Francisco Aguilar'),
       ('A002', 'Bases de Datos', 'Sofía Ortiz'),
       ('A003',
        'Cálculo Vectorial',
        'Antonieta Velasco'),
       ('A004',
        'Programación Avanzada',
        'David Escobar');


-------------------------------- OBTAIN DATA FROM FOREIGN KEYS TO CONSTRUCT COURSE TABLE
INSERT INTO course(stud_id, class_id, course_id)
VALUES ('0241823', 'A001', 'A001-0241823'),
       ('0212570', 'A001', 'A001-0212570'),
       ('0212508', 'A001', 'A001-0212508'),
       ('0239907', 'A001', 'A001-0239907');


-------------------------------- GET STUDENT ID FROM STUDENT TABLE AND CREATE EMERGENCY_TEL TABLE
INSERT INTO emergency_tel (stud_id, phone_number)
VALUES ('0241823', '987654321'),
       ('0212570', '987654321'),
       ('0212508', '987654321'),
       ('0239907', '987654321');


-------------------------------- GET STUDENT ID AND CLASSS ID FROM STUDENT TABLE AND CREATE EXAM TABLE
INSERT INTO exam (exam_date, grade, class_id, stud_id)
VALUES ('2020-01-01', 10, 'A001', '0241823'),
       ('2020-01-02', 9.2, 'A001', '0212570'),
       ('2020-01-03', 9.3, 'A001', '0212508'),
       ('2020-01-04', 9.0, 'A001', '0239907');


-------------------------- SELECT
SELECT *
FROM student;
SELECT *
FROM class;
SELECT *
FROM course;
SELECT *
FROM emergency_tel;
SELECT *
FROM exam;

