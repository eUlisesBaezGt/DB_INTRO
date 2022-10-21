INSERT INTO Pelicula (peliculaNo, pelicula, categoriaNo, directorNo)
VALUES (1, 'Señor de los anillos', 1, 200),
       (2, 'Avengers', 2, 100),
       (3, 'El payaso eso', null, 300);

INSERT INTO Personaje(peliculaNo, personaje, edad)
VALUES (1, 'Gandalf', 1000),
       (1, 'Frodo', 80),
       (2, 'Iron-Man', 40);

INSERT INTO Categoria(categoriaNo, categoria)
VALUES (1, 'Fantasia'),
       (2, 'Acción'),
       (3, 'Aventura');

INSERT INTO Director(directorNo, director)
VALUES(100, 'Joss Whedon'),(200, 'Peter Jackson'),(300, 'Tommy Lee Wallace');