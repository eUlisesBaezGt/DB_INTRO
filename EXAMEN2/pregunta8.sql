CREATE DATABASE IF NOT EXISTS pregunta8;

USE pregunta8;

CREATE TABLE IF NOT EXISTS R1
(
    A INT,
    B INT,
    C INT,
    PRIMARY KEY (A),
    FOREIGN KEY (C) REFERENCES R1 (A)
);

CREATE TABLE IF NOT EXISTS R3
(
    H INT,
    I INT,
    J INT,
    K INT,
    PRIMARY KEY (H)
);
CREATE TABLE IF NOT EXISTS R2
(
    E INT,
    F INT,
    G INT,
    PRIMARY KEY (E, F),
    FOREIGN KEY (E) REFERENCES R1 (A),
    FOREIGN KEY (F) REFERENCES R3 (H)
);
#
# (16 pts) Dada las siguientes tablas, dónde las letras en negritas son los nombres de los atributos.
#
# Del inciso 3 al 8, indica si las siguientes aseveraciones son verdadero o falso y explica la justificación de tu respuesta.
#
#
# Indica la cardinalidad de R2:
#
# Indica el grado de R3:
#
#
# Tabla R1, tupla 4, atributo B: El valor NULL viola la integridad. V F _______
#
#
# Tabla R3, tupla 3, atributo H: El valor 5 viola la integridad. V F _________
#
#
# Tabla R1, tupla 4, atributo C: El valor NULL viola la integridad. V F _______
#
#
# Tabla R3, tupla 4, atributo H: El valor NULL viola la integridad. V F  _______
#
#
# Tabla R2, tupla 3, atributo E: El valor 6 viola la integridad. V F _________
#
#
#    8. Tabla R2, tupla 5, atributo E y F: Los valores 5 y NULL violan la integridad. V F ____

# Cardinalidad de R2: