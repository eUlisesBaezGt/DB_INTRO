CREATE DATABASE IF NOT EXISTS `norm_memberships`;

USE `norm_memberships`;

DROP TABLE IF EXISTS `alquiler`;

CREATE TABLE IF NOT EXISTS `alquiler`
(
    Cod_Alquiler     INT(1)      NOT NULL,
    Num_Membresia    INT(3)      NOT NULL,
    Cod_Cliente      INT(1)      NOT NULL,
    Nom_Cliente      VARCHAR(50) NOT NULL,
    Dir_Cliente      VARCHAR(50) NOT NULL,
    Telef_Cliente    INT(10)     NOT NULL,
    Cod_Cassete      INT(3)      NOT NULL,
    Fecha_Alquiler   DATE        NOT NULL,
    Fecha_Devolucion DATE        NOT NULL,
    Valor_Alquiler   INT(2)      NOT NULL,
    Cantidad         INT(1)      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `alquiler`
VALUES (1, 234, 4, 'Romero Arellano,Andrés Gabriel', 'Calle Prin', 5555, 777, '2021/11/08', '2021/11/10', 30, 1),
       (1, 234, 4, 'Romero Arellano,Andrés Gabriel', 'Calle Prin', 5555, 946, '2021/11/08', '2021/11/10', 35, 1),
       (2, 234, 5, 'Pérez Echeverría,Alexia Elizabeth', 'CAlle Sec', 5554, 777, '2021/11/08', '2021/11/09', 30, 1),
       (3, 234, 4, 'Romero Arellano,Andrés Gabriel', 'Calle Prin', 5555, 879, '2021/11/10', '2021/11/11', 30, 1);


-- 1FN USE FIRST NORMAL FORM TO SIMPLIFY THE TABLE
DROP TABLE IF EXISTS `alquiler_1FN`;

