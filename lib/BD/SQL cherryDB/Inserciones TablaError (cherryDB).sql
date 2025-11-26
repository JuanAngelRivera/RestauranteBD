use cherryDb;
/*delete  from TablaError
where id != "miau";
select * from 	TablaError;*/

INSERT INTO TablaError (id, descripcion) VALUES
-- MetodoPago
('MetodopagoPK', 'Ocurre cuando se intenta insertar un método de pago con un id que ya existe en la tabla MetodoPago.'),

-- CherryLocal
('LocalPK', 'Error por insertar un id de CherryLocal que ya está registrado.'),

-- Rol
('RolPK', 'Se genera cuando se intenta registrar un rol con un id ya existente.'),

-- Turno
('TurnoPK', 'Error al insertar un turno con un id duplicado.'),

-- Bonus
('BonusPK', 'Sucede cuando se intenta crear un bonus con un id que ya existe.'),

-- Empleado
('EmpleadoPK', 'Ocurre al intentar registrar un empleado con un id repetido.'),
('EmpleadoFK1', 'Se genera al intentar asignar a un empleado un Rol que no existe en la tabla Rol.'),
('EmpleadoFK2', 'Aparece cuando se intenta asignar un Turno inexistente a un empleado.'),
('CURP', 'Error por intentar registrar un empleado con un CURP ya existente en la base de datos.'),
('RFC', 'Se produce al intentar insertar un RFC que ya está registrado para otro empleado.'),
('NSS', 'Ocurre cuando se intenta registrar un NSS duplicado para empleados.'),

-- Nomina
('NominaPK', 'Se genera cuando se intenta insertar una nómina duplicada para el mismo empleado y misma fecha de pago.'),
('NominaFK', 'Error por intentar crear una nómina para un empleado que no existe.'),

-- Beneficios
('BeneficiosFK1', 'Ocurre cuando se intenta asignar beneficios a una nómina que no existe.'),
('BeneficiosFK2', 'Error por intentar asociar un bonus inexistente a un beneficio.'),

-- Cuenta
('CuentaPK', 'Se genera cuando se intenta crear una cuenta repetida para el mismo empleado y nombre de usuario.'),
('CuentaFK1', 'Ocurre al intentar asignar una cuenta a un empleado que no está registrado.'),

-- Orden
('OrdenPK', 'Error por insertar una orden con combinación de id e id_CherryLocal ya existente.'),
('OrdenFK1', 'Se genera al intentar asignar una orden a un local inexistente.'),
('OrdenFK2', 'Error por intentar asignar una orden a un empleado no existente.'),

-- Pago
('PagoPK', 'Se genera al intentar registrar un pago con un id ya existente.'),
('PagoFK1', 'Ocurre cuando se intenta registrar un pago con un método de pago inexistente.'),
('PagoFK2', 'Error al intentar asignar un pago a una orden que no existe.'),

-- Categoria
('CategoriaPK', 'Ocurre al intentar registrar una categoría con un id ya existente.'),

-- Producto
('ProductoPK', 'Error por insertar un producto con id duplicado.'),
('ProductoFK', 'Se genera al intentar asignar un producto a una categoría que no existe.'),

-- Contiene
('ContienePK', 'Error por intentar insertar un registro en Contiene con la misma combinación de orden, local y producto.'),
('ContieneFK1', 'Ocurre cuando se intenta registrar un detalle de orden para una orden inexistente.'),
('ContieneFK2', 'Error al intentar asociar un producto inexistente dentro de un pedido.'),

-- Descuento
('DescuentoPK', 'Error al insertar un descuento con un id ya existente.'),
('DescuentoFK', 'Se genera cuando se intenta asignar un descuento a un producto que no existe.'),

-- Medida
('MedidaPK', 'Ocurre cuando se intenta insertar una medida con id duplicado.'),

-- Proveedor
('ProveedorPK', 'Error al intentar registrar un proveedor con id repetido.'),

-- Insumo
('InsumoPK', 'Se genera al intentar insertar un insumo con id duplicado.'),
('InsumoFK1', 'Ocurre cuando se intenta asignar una medida inexistente a un insumo.'),

-- Ingredientes
('IngredientesFK1', 'Error por intentar agregar un insumo que no existe como ingrediente.'),
('IngredientesFK2', 'Ocurre cuando se intenta asignar a un ingrediente un producto inexistente.'),

-- Contacto
('ContactoFK1', 'Ocurre cuando se intenta registrar un contacto para un proveedor que no existe.');


