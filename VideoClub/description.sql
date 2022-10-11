# Describe la consulta dada, no parafrasear la consulta.
# ------------------------------------------------------

# 1)
SELECT title, price
from video
where price > 10;
# Esta consulta crea una proyección de los títulos y precios de los videos que cuestan más de 10 dólares.

# 2)
select fname,
       lname
from members
where datejoined > '1998-01-01'
order by datejoined desc;
# Esta consulta crea una proyección de los nombres y apellidos de los miembros que se unieron después del 1 de
# enero de 1998, ordenados por fecha de ingreso descendente.

# 3)
select distinct d.directorname
              , v.title
from video v
         left join videoforrent vf on v.catalogno = vf.catalogno
         left join rentalagreement ra on vf.videono = ra.videono
         left join members me on ra.memberno = me.memberno
         left join director d on v.directorno = d.directorno
where me.lname = 'Parker';
# Esta consulta genera una proyección de los nombres de directores y títulos de videos, con un left join de la tabla
# videoforrent donde el número de catalogo del video sea igual en la tabla video y en la tabla videoforrent,
# un left join de la tabla rentalagreement donde el número de video sea igual en la tabla videoforrent y en la tabla rentalagreement,
# un left join de la tabla members donde el número de miembro sea igual en la tabla rentalagreement y en la tabla members,
# un left join de la tabla director donde el número de director sea igual en la tabla video y en la tabla director,
# y donde el apellido del miembro sea Parker.

# 4)
select title
from video
EXCEPT
select title from Video v, VideoForRent vr, RentalAgreement ra
where v.catalogNo = vr.catalogNo
and vr.videoNo = ra.videoNo;
# Esta consulta genera una proyección de los títulos de los videos que están en la tabla video, a excepcion de los
# videos que están en la tabla video, la tabla videoforrent y la tabla rentalagreement donde el número de catalogo del video
# sea igual en la tabla video y en la tabla videoforrent, y el número de video sea igual en la tabla videoforrent y en la tabla rentalagreement.