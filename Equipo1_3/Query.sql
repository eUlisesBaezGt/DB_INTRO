-- Listar: Nombres de clientes, Nombre del representante de venta, Apellido del representante de venta.

select cu.customername, e.firstname, e.lastname
from customers cu
join employees e on cu.salesrepemployeenumber  = e.employeenumber;

-- Listar, Nombres de clientes, Nombre del representante de venta, Apellido del representante de venta de clientes de 'Hong Kong'.

select cu.customername, e.firstname, e.lastname
from customers cu
join employees e on cu.salesrepemployeenumber  = e.employeenumber
where cu.country = 'Hong Kong';

-- Listar, Nombres de clientes, Nombre del representante de venta, Apellido del representante de venta de clientes de 'Hong Kong' que tengan asociada alguna orden.

select cu.customername, e.firstname, e.lastname
from customers cu
join employees e on cu.salesrepemployeenumber  = e.employeenumber
join orders o on cu.customernumber = o.customernumber
where cu.country = 'Hong Kong';


-- Listar ordenes que tengan productos de la línea 'Motorcycles'
-- Campos a mostrar:
--  ordernumer
-- orderdate
--  product name
--  status

select o.ordernumber, o.orderdate, p.productname, o.status
from orders o
join orderdetails od on o.ordernumber = od.ordernumber
join products p on od.productcode = p.productcode
where p.productline = 'Motorcycles';


-- Proponer el uso de la operación unión:
SELECT ORDERNUMBER, PRODUCTCODE from orderdetails union SELECT ORDERNUMBER, PRODUCTCODE from orderdetails; -- EJEMPLO OTRA TABLA


--  Proponer el uso de la operación producto cartesiano:
SELECT ORDERNUMBER, PRODUCTCODE from orderdetails cross join orderdetails; -- EJEMPLO OTRA TABLA
