# DATABASE
CREATE database OutPutGeneration;

# TABLES
CREATE TABLE Tabla1
(
    A varchar(2)  NOT NULL,
    B varchar(10) NOT NULL,
    D varchar(2)
);

CREATE TABLE Tabla2
(
    A varchar(2) NOT NULL,
    C int        NOT NULL
);

# INSERT
INSERT INTO Tabla1 (A, B, D)
VALUES ('a1', 'blue', 'd1'),
       ('a2', 'blue', 'd2'),
       ('a3', 'black', 'd3'),
       ('a4', 'red', null);

INSERT INTO Tabla2 (A, C)
VALUES ('a1', 100),
       ('a3', 200);


#QUERIES
select t1.A,
       t1.B,
       t2.C
from Tabla1 t1
         left join Tabla2 t2 on t1.A = t2.A;

select t1.B,
       t1.A
from Tabla1 t1
group by t1.B;

select t1.B,
       count(t1.D) as conteo
from Tabla1 t1
group by t1.B;

select A,
       C
from Tabla2
order by C desc;
