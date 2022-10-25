-- DDL
CREATE DATABASE IF NOT EXISTS STORE;

use STORE;

CREATE TABLE IF NOT EXISTS SALESPERSON(
    Name VARCHAR(20),
    Age INT,
    Salary DECIMAL,
    PRIMARY KEY(Name)
);

CREATE TABLE IF NOT EXISTS CUSTOMER(
    Name VARCHAR(20),
    City VARCHAR(20),
    IndustryType VARCHAR(20),
    PRIMARY KEY(Name)
);

CREATE TABLE IF NOT EXISTS `ORDER`
(
    Number INT,
    CustName VARCHAR(20),
    SalesPersonName VARCHAR(20),
    Amount DECIMAL,
    PRIMARY KEY(Number),
    FOREIGN KEY(CustName) REFERENCES CUSTOMER(Name),
    FOREIGN KEY(SalesPersonName) REFERENCES SALESPERSON(Name)
);

-- DML
-- INSERTS
INSERT INTO SALESPERSON VALUES('John', 25, 10000);
INSERT INTO SALESPERSON VALUES('Paul', 27, 11000);
INSERT INTO SALESPERSON VALUES('Ringo', 29, 12000);
INSERT INTO SALESPERSON VALUES('George', 31, 13000);

INSERT INTO CUSTOMER VALUES('C1', 'London', 'IT');
INSERT INTO CUSTOMER VALUES('C2', 'Paris', 'IT');
INSERT INTO CUSTOMER VALUES('C3', 'Rome', 'IT');
INSERT INTO CUSTOMER VALUES('C4', 'MEMPHIS', 'IT');

INSERT INTO `ORDER` VALUES(1, 'C1', 'John', 1000);
INSERT INTO `ORDER` VALUES(2, 'C2', 'Paul', 2000);
INSERT INTO `ORDER` VALUES(3, 'C3', 'Ringo', 3000);
INSERT INTO `ORDER` VALUES(4, 'C1', 'George', 4000);
INSERT INTO `ORDER` VALUES(5, 'C2', 'John', 5000);
INSERT INTO `ORDER` VALUES(6, 'C4', 'Paul', 6000);
INSERT INTO `ORDER` VALUES(7, 'C4', 'Ringo', 7000);
INSERT INTO `ORDER` VALUES(8, 'C4', 'George', 8000);

-- SELECTS
-- 1) Calcula el promedio de las edades de las personas de ventas.
SELECT AVG(Age) as PromedioEdad
FROM SALESPERSON;

-- 2) Muestra el nombre de la persona de ventas y cuantas órdenes ha generado.
SELECT SALESPERSON.Name, COUNT(`ORDER`.Number) as OrdenesGeneradas
FROM SALESPERSON
INNER JOIN `ORDER` ON SALESPERSON.Name = `ORDER`.SalesPersonName
GROUP BY SALESPERSON.Name;

-- 3) Muestra
# a) El nombre del cliente.
# b) Tipo de industria  del cliente.
# c) El nombre de la persona de ventas.
# d) Edad de la persona ventas.
# e) Importe (Amount) de las órdenes generadas
--  Para clientes ubicados en la ciudad de MEMPHIS, muestra los datos ordenados por el importe en forma descendente.
SELECT CUSTOMER.Name as NombreCliente, CUSTOMER.IndustryType as TipoIndustria, SALESPERSON.Name as NombreVentas, SALESPERSON.Age as Edad, `ORDER`.Amount as Importe
FROM CUSTOMER
INNER JOIN `ORDER` ON CUSTOMER.Name = `ORDER`.CustName
INNER JOIN SALESPERSON ON SALESPERSON.Name = `ORDER`.SalesPersonName
WHERE CUSTOMER.City = 'MEMPHIS'
ORDER BY `ORDER`.Amount DESC;
