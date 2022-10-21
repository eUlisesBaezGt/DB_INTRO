-- Create database
CREATE Database REPASO2_Movies;

--  Create tables

CREATE TABLE Director
(
    directorNo INT(3),
    director   VARCHAR(30),
    PRIMARY KEY (DirectorNo)
);

CREATE TABLE Categoria
(
    categoriaNo INT(1),
    categoria   VARCHAR(30),
    PRIMARY KEY (categoria)
);

CREATE table Personaje
(
    peliculaNo INT(1),
    personaje  VARCHAR(30),
    edad       INT(4),
    PRIMARY KEY (personaje),
    FOREIGN KEY (peliculaNo) REFERENCES Pelicula (peliculaNo)
);


CREATE TABLE Pelicula
(
    peliculaNo  INT(1),
    pelicula    VARCHAR(30),
    categoriaNo INT(1),
    directorNo  INT(3),
    PRIMARY KEY (peliculaNo),
    FOREIGN KEY (categoriaNo) REFERENCES Categoria (categoriaNo),
    FOREIGN KEY (directorNo) REFERENCES Director (directorNo)
);

