# Solicitud 1) Para iniciar a conocer el inventario solicita la cantidad de películas diferentes. Nota: revisar en el
# diagrama, que una película puede tener varios videos (en stock) asociados.
SELECT COUNT(DISTINCT title) as Cantidad
FROM video;

# Solicitud 2) Lista los titulos de peliculas ordenados por nombre de pelicula
SELECT title
FROM video
ORDER BY title;

# Solicitud 3) Desea conocer el inventario actual. Por lo que requiere el listado de películas y cantidad de videos por
# cada película, ordenado por cantidad de vídeos de forma descendiente.
SELECT title, available as Cantidad
FROM video,
     videoforrent
WHERE video.catalogNo = videoforrent.catalogNo
ORDER BY Cantidad DESC;

# Solicitud 4) Desea conocer conocer el comportamiento de las rentas, para lo que quiere un listado de las películas y
# el número de veces que se ha rentado cada película, el listado debe estar ordenado de mayor a menor por la cantidad
# de rentas.
SELECT title, COUNT(rentalNo) as Cantidad
FROM video,
     rentalagreement,
     videoforrent
WHERE video.catalogNo = videoforrent.catalogNo
  AND rentalagreement.videoNo = videoforrent.videoNo
GROUP BY title
ORDER BY Cantidad DESC;


# Solicitud 5) Desea conocer quienes son los mejores clientes, para lo que solicita un listado de clientes: nombre,
# apellido, género, fecha de nacimiento de los clientes y el número de rentas realizadas.
# El listado debe estar ordenado por rentas realizadas de mayor a menor. Los primeros en la lista
# le permitirán conocer quienes son los mejores clientes.
SELECT fName, lName, sex, DOB as FechaNacimiento, COUNT(rentalNo) as NumRenta
FROM members,
     rentalagreement
WHERE members.memberNo = rentalagreement.memberNo
GROUP by fName
ORDER BY NumRenta DESC;


# Solicitud 7) Para propósitos de marketing quiere saber el nombre del director y la cantidad de mujeres y hombres que
# han rentado sus películas.
SELECT DirectorName, COUNT(*) as Male
FROM director,
     video,
     videoforrent,
     rentalagreement,
     members

WHERE (director.DirectorNo = video.DirectorNo AND video.catalogNo = videoforrent.catalogNo AND
       videoforrent.videoNo = rentalagreement.videoNo AND rentalagreement.memberNo = members.memberNo AND members.sex = 'M')
GROUP BY DirectorName;

SELECT DirectorName, COUNT(*) as Female
FROM director,
     video,
     videoforrent,
     rentalagreement,
     members
WHERE (director.DirectorNo = video.DirectorNo AND video.catalogNo = videoforrent.catalogNo AND
       videoforrent.videoNo = rentalagreement.videoNo AND rentalagreement.memberNo = members.memberNo AND members.sex = 'F')
GROUP BY DirectorName

# PUT TWO TABLES TOGETHER