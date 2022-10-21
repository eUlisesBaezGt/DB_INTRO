create schema tablas;

create table tablas.tabla1 (
	A varchar(250),
  	B varchar(250)
);

create table tablas.tabla2 (
	B varchar(250),
  	C varchar(250)
);

create table tablas.tabla3 (
	B varchar(250),
  	C varchar(250)
);

create table tablas.tabla4 (
	A1 varchar(250)
);


INSERT INTO tablas.tabla1 (A, B) VALUES ('A1', 'B1');
INSERT INTO tablas.tabla1 (A, B) VALUES ('A2', 'B1');
INSERT INTO tablas.tabla1 (A, B) VALUES ('A3', 'B3');
INSERT INTO tablas.tabla1 (A, B) VALUES ('A4', 'B5');
INSERT INTO tablas.tabla1 (A) VALUES ('A5');

INSERT INTO tablas.tabla2 (B, C) VALUES ('B1', 'C1');
INSERT INTO tablas.tabla2 (B, C) VALUES ('B2', 'C2');
INSERT INTO tablas.tabla2 (B, C) VALUES ('B3', 'C3');
INSERT INTO tablas.tabla2 (B, C) VALUES ('B4', 'C5');

INSERT INTO tablas.tabla3 (B, C) VALUES ('B5', 'C1');
INSERT INTO tablas.tabla3 (B, C) VALUES ('B2', 'C2');

INSERT INTO tablas.tabla4 (A1) VALUES ('A2');
INSERT INTO tablas.tabla4 (A1) VALUES ('A3');
INSERT INTO tablas.tabla4 (A1) VALUES ('A4');



select * from tablas.tabla3, tablas.tabla4;


select * from tablas.tabla2 except select * from tablas.tabla3;