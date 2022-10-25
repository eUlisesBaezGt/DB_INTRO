select NombreVehiculo,
    Vendedor,
    Categoria
from Vehiculos veh
    JOIN Vendedor vend on veh.VendedorNo = vend.VendedorNo
    JOIN Categoria cat on veh.CategoriaNo = cat.CategoriaNo;
----------------------------------------------------------------
select NombreVehiculo,
    anio
from Vehiculos veh
    JOIN Vendedor vend on veh.VendedorNo = vend.VendedorNo
WHERE veh.VendedorNo = 100;
---------------------------
select Vendedor
from Vendedor vend
    LEFT JOIN Vehiculos veh on vend.VendedorNo = veh.VendedorNo
WHERE veh.VendedorNo is NULL;
----------------------------------------------------------------
select Vendedor
from Vendedor ven
    JOIN Vendedor vend on ven.Jefe = vend.VendedorNo;
