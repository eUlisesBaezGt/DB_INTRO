
-- Cómo obtenría el nombre de la pelicula, personaje y director
select pelicula, personaje, director
from Pelicula p
         JOIN Personaje per on p.peliculaNo = per.peliculaNo
         JOIN Director D on p.directorNo = D.directorNo;

-- BASE
# select *
# from tabla_p p
# join tabla_m m on p.a = m.pa
# join tabla_q q on p.c = q.a

-- Cómo obtendría las categorías de peliculas de los cuáles no se tienen peliculas asociadas
select c.categoriaNo
from categoria c
         LEFT JOIN pelicula p
                   on c.categoriaNo = p.categoriaNo
where p.pelicula is null;

-- Calcula el avg de la edad de todos los personajes
select AVG(edad) as PromedioEdad
from Personaje;

-- Calcula el número de personajes por pelicula.
select Pelicula, COUNT(*) as NumeroPersonajes
from Pelicula pel,
     Personaje pers
where pel.peliculaNo = pers.peliculaNo
GROUP BY Pelicula
ORDER BY NumeroPersonajes;

Select pelicula, count(p.peliculaNo) as total
FROM pelicula p
JOIN Personaje per on p.peliculaNo = per.peliculaNo
group by pelicula;