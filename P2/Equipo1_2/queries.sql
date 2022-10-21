/*Realizar un copia de la tabla offices y llamarla offices_copy*/
CREATE TABLE offices_copy AS SELECT * FROM offices;

/*Agregar una columna a la nueva tabla: offices_copy*/
ALTER TABLE offices_copy ADD COLUMN id int;

/*Editar un registro de la tabla offices_copy*/
UPDATE offices_copy SET id = 1 WHERE officeCode = '1';

/* Borrar un registro de offices_copy */
DELETE FROM offices_copy where OFFICECODE=1;

/*Borrar to do el contenido de la tabla offices_copy */
DELETE FROM offices_copy;

/*Borrar la tabla  offices_copy */
DROP TABLE IF EXISTS offices_copy