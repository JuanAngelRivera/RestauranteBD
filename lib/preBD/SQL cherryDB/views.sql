use cherrydb;

create view Vista_Empleados AS
select Empleado.id "id empleado", Empleado.nombre nombre, Empleado.telefono telefono, Empleado.CURP curp, Empleado.RFC rfc,
Empleado.fechaIngreso 'fecha de ingreso', Empleado.NSS nss, Rol.descripcion rol , Turno.descripcion turno
from Empleado
inner join Rol ON Empleado.id_Rol = Rol.id
inner join Turno ON Empleado.id_Turno = Turno.id;
select * from Vista_Empleados; -- listo


create view Vista_Nomina AS
select Empleado.nombre "nombre del empleado", Nomina.fechaPago "fecha de pago",Nomina.salarioTotal "salario total"
from Nomina 
inner join Empleado ON Nomina.id_Empleado = Empleado.id;
select * from Vista_Nomina;   -- listo


create view Vista_Beneficios AS
select Empleado.nombre AS "nombre empleado", Beneficios.fechaPago_Nomina 'fecha de pago',
Bonus.descripcion AS "bonus", Bonus.valor AS "monto del bonus"
FROM Beneficios 
inner join Empleado ON Beneficios.id_Empleado = Empleado.id
inner join Bonus ON Beneficios.id_Bonus = Bonus.id;
select * from Vista_Beneficios;      -- listo    


create view Vista_Cuenta AS
select Empleado.nombre AS "nombre empleado", Cuenta.nombreUsuario AS "nombre de la cuenta"
from Cuenta
inner join Empleado ON Cuenta.id_Empleado = Empleado.id;
select * from Vista_Cuenta;   -- listo


create view Vista_Orden AS
select Orden.id_CherryLocal "id del local", "Local" AS NombreLocal, Orden.id AS "Numero de Orden",
    Orden.total,Orden.fechaRealizada,Orden.id_Empleado,Empleado.nombre AS "Nombre Empleado"
from Orden 
inner join CherryLocal ON Orden.id_CherryLocal = CherryLocal.id
inner join Empleado ON Orden.id_Empleado = Empleado.id;
select * from Vista_Orden;   -- pendiente a aprobar


create view Vista_Pago AS
select Pago.id AS "Id_Pago", Pago.descripcion, MetodoPago.descripcion AS "Metodo de Pago",
    Pago.id_orden AS "Id_Orden", Pago.id_cherryLocal AS "Local",Orden.total AS "Total Orden",
    Orden.fechaRealizada
from Pago
inner join MetodoPago ON Pago.id_metodoPago = MetodoPago.id
inner join Orden ON Pago.id_orden = Orden.id AND Pago.id_cherryLocal = Orden.id_CherryLocal;
select * from Vista_Pago;   -- pendiente  a aprobar


create view Vista_Producto AS
select Producto.id, Producto.nombre, Producto.precio, Categoria.nombre AS "Categoria" -- Producto.foto
from Producto 
inner join Categoria  ON Producto.id_Categoria = Categoria.id;
select * from Vista_Producto;     -- pendiente a aprobar

create view Vista_Contiene AS
select Contiene.id_Orden, Contiene.id_CherryLocal "Local", Contiene.id_Producto, Producto.nombre AS "Nombre del Producto",
    Orden.fechaRealizada -- ,Producto.precio, Orden.total AS TotalOrden
from Contiene 
inner join Producto  ON Contiene.id_Producto = Producto.id
inner join Orden  ON Contiene.id_Orden = Orden.id AND Contiene.id_CherryLocal = Orden.id_CherryLocal;
select * from Vista_Contiene;        -- pendiente a aprobar

create view Vista_Insumo AS
select Insumo.id AS "Id_Insumo", Insumo.nombre, Insumo.costo, Insumo.descripcion,
Medida.descripcion AS "Unidad de Medida", Insumo.enAlmacen As "En Almacen"
from Insumo 
inner join Medida ON Insumo.id_Medida = Medida.id;
select * from Vista_Insumo;     -- pendiente a aprobar

drop view Vista_Ingredientes;
create view Vista_Ingredientes AS
select Ingredientes.id_Producto, Producto.nombre AS Producto, Ingredientes.id_Insumo, Insumo.nombre AS Insumo,
    Ingredientes.cantidad, Insumo.costo -- (ing.cantidad * i.costo) AS CostoTotalInsumo
from Ingredientes 
inner join Producto ON Ingredientes.id_Producto = Producto.id
inner join Insumo ON Ingredientes.id_Insumo = Insumo.id;
select * from Vista_Ingredientes;     -- pendiente a aprobar

drop view Vista_Contacto;
create view Vista_Contacto AS
select Contacto.id_Proveedor, Proveedor.nombre AS "Proveedor", Contacto.numero AS "Numeros de Contacto",
Contacto.nombre AS "Nombre Contacto",Contacto.telefono
from Contacto 
inner join Proveedor ON Contacto.id_Proveedor = Proveedor.id;
select * from Vista_Contacto;      -- pendiente a aprobar








    


