-- DDL

CREATE DATABASE IF NOT EXISTS Car_Selling;

USE Car_Selling;

CREATE TABLE IF NOT EXISTS Categoria
(
    CategoriaNo VARCHAR(2),
    Categoria   VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Vendedor
(
    VendedorNo INT(3),
    Vendedor   VARCHAR(30),
    Jefe       INT(3),
    PRIMARY KEY (VendedorNo),
    FOREIGN KEY (Jefe) REFERENCES Vendedor (VendedorNo)
);

CREATE TABLE IF NOT EXISTS Vehiculos
(
    VehiculoNo     VARCHAR(2),
    NombreVehiculo VARCHAR(30),
    VendedorNo     INT(3),
    CategoriaNo    VARCHAR(2),
    Anio           INT(4),
    PRIMARY KEY (VehiculoNo),
    FOREIGN KEY (VendedorNo) REFERENCES Vendedor (VendedorNo),
    FOREIGN KEY (CategoriaNo) REFERENCES Categoria (CategoriaNo)
);

-- DML
-- INSERTS
INSERT INTO Categoria
VALUES ('c1', 'Classic Cars'),
       ('c2', 'Trains'),
       ('c3', 'Planes'),
       ('c4', 'Trucks and Buses'),
       ('c5', 'Vintage Cars');

INSERT INTO Vendedor
VALUES (100, 'Ken Miles', 200),
       (200, 'Lee Iacocca', 500),
       (300, 'Mollie Miles', 200),
       (400, 'Leo Beebe', 200),
       (500, 'Henry Ford', NULL);

INSERT INTO Vehiculos
VALUES ('v1', 'Corvair Monza', 100, 'c1', 1969),
       ('v2', 'Dodge Charger', 100, 'c5', 1968),
       ('v3', 'Ford Falcon', 200, 'c1', 1969),
       ('v4', 'Plymouth Hemi Cuda', 300, 'c1', 1970),
       ('v5', 'Chevy Pickup', 300, 'c4', 1957);

-- SELECTS
-- 1) Escriba en SQL como obtendría el nombre del vehículo, nombre del vendedor y el nombre de la categoría del vehículo.

SELECT NombreVehiculo, Vendedor, Categoria
FROM Vehiculos
         INNER JOIN Vendedor
                    ON Vehiculos.VendedorNo = Vendedor.VendedorNo
         INNER JOIN Categoria ON Vehiculos.CategoriaNo = Categoria.CategoriaNo
GROUP BY NombreVehiculo, Vendedor, Categoria
         ORDER BY Vendedor, NombreVehiculo, Categoria;


select NombreVehiculo, Vendedor, Categoria
from Vehiculos veh
         JOIN Vendedor vend
              on veh.VendedorNo = vend.VendedorNo
         JOIN Categoria cat on veh.CategoriaNo = cat.CategoriaNo
group by NombreVehiculo, Vendedor, Categoria
order by Vendedor, NombreVehiculo;

-- --------------------------------------------------------------
-- 2) Escriba en SQL como obtendría el nombre y año de los vehículos vendidos por ‘Ken Miles

SELECT NombreVehiculo, Anio
FROM Vehiculos
         INNER JOIN Vendedor
                    ON Vehiculos.VendedorNo = Vendedor.VendedorNo
WHERE Vendedor = 'Ken Miles';


select NombreVehiculo,
       anio
from Vehiculos veh
         JOIN Vendedor vend on veh.VendedorNo = vend.VendedorNo
WHERE veh.VendedorNo = 100;

-- --------------------------------------------------------------
-- 3) Escriba en SQL como obtendría el nombre de los vendedores que no hayan realizado ventas.

SELECT Vendedor
FROM Vendedor
WHERE VendedorNo NOT IN (SELECT VendedorNo
                         FROM Vehiculos);


select Vendedor
from Vendedor vend
         LEFT JOIN Vehiculos veh on vend.VendedorNo = veh.VendedorNo
WHERE veh.VendedorNo is NULL;

-- --------------------------------------------------------------
-- 4) Escriba en SQL como obtendría nombre del vendedor y de su jefe.

SELECT vend.Vendedor as Vendedor, vend2.Vendedor as Jefe
FROM Vendedor vend
         LEFT JOIN Vendedor vend2 ON vend.Jefe = vend2.VendedorNo;
