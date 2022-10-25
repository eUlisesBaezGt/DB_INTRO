# (16 puntos) Las siguientes preguntas se refieren a las siguientes tres relaciones:
#
# SALESPERSON (Name, Age, Salary)
# PK(Name)
#
# ORDER (Number, CustName, SalesPersonName, Amount)
# PK(Number)
# FK(CustName) references CUSTOMER(Name)
# FK(SalesPersonName) references SALESPERSON(Name)
#
# CUSTOMER (Name, City, IndustryType)
# PK(Name)

CREATE TABLE SALESPERSON
(
    Name   VARCHAR(20) NOT NULL,
    Age    INTEGER,
    Salary INTEGER,
    PRIMARY KEY (Name)
);

CREATE TABLE CUSTOMER
(
    Name         VARCHAR(20) NOT NULL,
    City         VARCHAR(20),
    IndustryType VARCHAR(20),
    PRIMARY KEY (Name)
);

CREATE TABLE ORDER
(
    Number          INTEGER     NOT NULL,
    CustName        VARCHAR(20) NOT NULL,
    SalesPersonName VARCHAR(20) NOT NULL,
    Amount          INTEGER,
    PRIMARY KEY (Number),
    FOREIGN KEY (CustName) REFERENCES CUSTOMER (Name),
    FOREIGN KEY (SalesPersonName) REFERENCES SALESPERSON (Name)
);

# Resuelve las siguientes solicitudes utilizando SQL:
# (4 pts) Calcula el promedio de las edades de las personas de ventas.
SELECT AVG(Age)
FROM SALESPERSON;

# (4 pts) Muestra el nombre de la persona de ventas y cuantas órdenes ha generado.
SELECT SalesPersonName, COUNT(Number)
FROM ORDER
GROUP BY SalesPersonName;

# (8 pts) Muestra, el nombre del cliente, tipo de industria  del cliente, el nombre de la persona de ventas, edad de la
# persona ventas e importe (amount) de las órdenes generadas, para clientes ubicados en la ciudad de MEMPHIS, muestra
# los datos ordenados por el importe en forma descendente.
SELECT CustName, IndustryType, SalesPersonName, Age, Amount
FROM CUSTOMER,
     SALESPERSON,
     ORDER
WHERE CUSTOMER.Name = ORDER.CustName
  AND SALESPERSON.Name = ORDER.SalesPersonName
  AND City = 'MEMPHIS'
ORDER BY Amount DESC;


# PREGUNTA 2 sobre la misma base de datos
# (16 Puntos)  Describe el resultado de las siguientes consultas.  Imagina que describes el resultado a una persona que no sabe SQL.
# Consulta 1: (8 pts)
# SELECT Name FROM SALESPERSON
# WHERE Age > 40
# ORDER BY Name
# 1) En esta consulta se muestran los nombres de las personas de ventas que tienen una edad mayor a 40 años, ordenados por nombre.

# Consulta 2: (8 pts)
# SELECT SUM(Amount)
# FROM ORDER
# WHERE Amount>500
# 2) En esta consulta se muestra la suma de los importes de las órdenes que tienen un importe mayor a 500.

# 1) En esta consulta se muestran los nombres de las personas de ventas que tienen una edad mayor a 40 años, ordenados por nombre.
# 2) En esta consulta se muestra la suma de los importes de las órdenes que tienen un importe mayor a 500.