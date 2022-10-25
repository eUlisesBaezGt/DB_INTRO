CREATE DATABASE IF NOT EXISTS Pregunta_5;

Create table IF NOT EXISTS Tabla1
(
    A VARCHAR(2),
    B VARCHAR(2)
);

Create table IF NOT EXISTS Tabla2
(
    B VARCHAR(2),
    C VARCHAR(2)
);

Create table IF NOT EXISTS Tabla3
(
    B VARCHAR(2),
    C VARCHAR(2)
);

Create table IF NOT EXISTS Tabla4
(
    A VARCHAR(2)
);

INSERT INTO Tabla1
VALUES ('a1', 'b1'),
       ('a2', 'b2'),
       ('a3', 'b3'),
       ('a4', 'b5'),
       ('a5', NULL);

INSERT INTO Tabla2
VALUES ('b2', 'c1'),
       ('b4', 'c3'),
       ('b3', 'c3'),
       ('b5', 'c2');

INSERT INTO Tabla3
VALUES ('b2', 'c1'),
       ('b5', 'c2');

INSERT INTO Tabla4
VALUES ('a1'),
       ('a2'),
       ('a3');


# 1) Tabla1 UNION Tabla4
SELECT *
FROM Tabla1
UNION
SELECT *
FROM Tabla4;
# NO se puede porque tienes diferente número de columnas en cada tabla y no se puede hacer unión de tablas con diferente número de columnas

# 2) Tabla1 NATURAL JOIN Tabla3
SELECT *
FROM Tabla1
         NATURAL JOIN Tabla3;


# 3) Tabla3 PRODUCTO CARTESIANO Tabla4
SELECT *
FROM Tabla3
         CROSS JOIN Tabla4;

# SELECCION B='b3' (Tabla2 DIFERENCIA Tabla3)   => Aquí indique los resutlados intermedios.

select * from Tabla2
WHERE B = 'b3' OR B = 'b4';