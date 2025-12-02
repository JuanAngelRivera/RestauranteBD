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

INSERT INTO MetodoPago (descripcion) VALUES 
('Tarjeta.'),
('Efectivo');

INSERT INTO CherryLocal (direccion,nombre,telefono) VALUES
('Antonio Garcia Cubas,Nuevo Tecnologico','CherryLocal','4611020976');

INSERT INTO Rol (descripcion, sueldo) VALUES 
('Gerente', 2939.16),
('Ayudante General', 1951.60);

INSERT INTO Turno (horaInicio, horaFin, descripcion) VALUES
('07:00:00', '15:00:00', 'Turno Matutino'),
('15:00:00', '21:00:00', 'Turno Vespertino');

INSERT INTO Bonus (valor, descripcion) VALUES
(100.00,'Bonus por Puntualidad'),
(200.00,'Bonus por Empleado el mes');

INSERT INTO Categoria (nombre,descripcion) VALUES
('Bebidas Calientes (Café)', 'Espresso, Americano, Lattes, Cappuccinos y métodos de extracción.'),
('Otras Bebidas Calientes', 'Tés, infusiones, chocolate caliente y bebidas tradicionales no basadas en café.'),
('Bebidas Frías', 'Iced Lattes, Frappés, Smoothies, jugos naturales y refrescos.'),
('Panadería y Repostería', 'Pan dulce, croissants, muffins, panqués, galletas y postres varios.'),
('Alimentos Salados', 'Sándwiches, paninis, bagels, quiches, empanadas y opciones de desayuno/comida.'),
('Artículos Adicionales', 'Venta de café en grano/molido, tazas, termos y merchandising de la cafetería.');
 
INSERT INTO Medida (descripcion) VALUES
('Gramos'),
('Mililitros'),
('Piezas');

INSERT INTO Insumo (nombre, costo, descripcion, id_Medida, enAlmacen) VALUES
('Café Molido', 180.00, 'Café tostado y molido', 1, 5000),
('Agua', 10.00, 'Agua purificada', 2, 20000),
('Leche', 25.00, 'Leche entera', 2, 15000),
('Té Verde', 120.00, 'Té verde natural', 1, 2000),
('Hielo', 5.00, 'Hielo en cubos', 1, 10000),
('Chocolate', 90.00, 'Chocolate en polvo', 1, 3000),
('Harina', 20.00, 'Harina de trigo', 1, 10000),
('Huevo', 4.00, 'Huevo blanco', 3, 300),
('Pan', 6.00, 'Pan blanco', 3, 200),
('Jamón', 70.00, 'Jamón de pavo', 1, 3000),
('Queso', 85.00, 'Queso manchego', 1, 3000),
('Café en Grano', 200.00, 'Café sin moler', 1, 8000),
('Canela', 60.00, 'Canela en polvo', 1, 1500),
('Azúcar', 18.00, 'Azúcar estándar', 1, 8000),
('Plátano', 12.00, 'Plátano maduro', 3, 200),
('Fresa', 15.00, 'Fresa fresca', 1, 2500),
('Jamón Serrano', 95.00, 'Jamón serrano', 1, 2000),
('Mantequilla', 40.00, 'Mantequilla sin sal', 1, 3000),
('Vainilla', 70.00, 'Esencia de vainilla', 2, 2000),     -- id 19
('Caramelo', 85.00, 'Jarabe de caramelo', 2, 1800),     -- id 20
('Yogur', 30.00, 'Yogur natural', 2, 5000),             -- id 21
('Avena', 25.00, 'Avena en hojuelas', 1, 6000),         -- id 22
('Pollo', 95.00, 'Pechuga de pollo', 1, 4000),          -- id 23
('Lechuga', 18.00, 'Lechuga fresca', 1, 3000),          -- id 24
('Tomate', 20.00, 'Tomate rojo', 1, 2500),              -- id 25
('Crema', 28.00, 'Crema para café', 2, 3000);           -- id 26

INSERT INTO Producto (nombre, precio, id_Categoria, foto) VALUES
('Café Americano', 35.00, 1, 'americano.png'),  -- imagen 
('Cappuccino', 55.00, 1, 'cappuccino.png'), -- imagen 
('Té Verde', 30.00, 2, 'teverde.png'),  -- imagen 
('Frappé de Chocolate', 60.00, 3, 'frappe.png'), -- imagen 	
('Muffin de Chocolate', 28.00, 4, 'muffin.png'),  -- imagen 
('Sándwich Jamón y Queso', 50.00, 5, 'sandwich.png'),  -- imagen 
('Café en Grano 250g', 120.00, 6, 'cafegrano.png'),  -- imagen 
('Latte Vainilla', 58.00, 1, 'lattevainilla.png'),  -- imagen 
('Chocolate Caliente', 40.00, 2, 'chocolatecaliente.png'), -- imagen
('Smoothie de Fresa', 55.00, 3, 'smoothiefresa.png'), -- imagen
('Croissant de Mantequilla', 32.00, 4, 'croissant.png'), -- imagen
('Panini de Jamón Serrano', 65.00, 5, 'panini.png'), -- imagen
('Latte Caramelo', 60.00, 1, 'lattecaramelo.png'),         -- 13 imagen
('Espresso Doble', 45.00, 1, 'espressodoble.png'),        -- 14 imagen
('Avena con Fruta', 42.00, 2, 'avena.png'),               -- 15 imagen
('Malteada de Chocolate', 58.00, 3, 'malteada.png'),      -- 16 imagen
('Galletas de Avena', 25.00, 4, 'galletas.png'),          -- 17 imagen
('Baguette de Pollo', 70.00, 5, 'baguette.png'),          -- 18 imagen
('Ensalada de Pollo', 68.00, 5, 'ensalada.png'),          -- 19  imagen
('Frappe de Caramelo', 62.00, 3, 'frappecaramelo.png'),   -- 20 imagen
('Taza Cherry', 95.00, 6, 'taza.png'),                    -- 21 imagen
('Termo Cherry', 180.00, 6, 'termo.png');                 -- 22 

INSERT INTO Ingredientes (id_Producto, id_Insumo, cantidad) VALUES
-- Café Americano
(1, 1, 10),  -- Café Molido
(1, 2, 250), -- Agua
-- Cappuccino
(2, 1, 10),  -- Café Molido
(2, 3, 200), -- Leche
-- Té Verde
(3, 4, 5),   -- Té Verde
(3, 2, 250), -- Agua
-- Frappé
(4, 3, 200), -- Leche
(4, 5, 150), -- Hielo
(4, 6, 20),  -- Chocolate
-- Muffin
(5, 7, 100), -- Harina
(5, 8, 1),   -- Huevo
(5, 6, 30),  -- Chocolate
-- Sándwich
(6, 9, 2),   -- Pan
(6,10,50),   -- Jamón
(6,11,40),   -- Queso
-- Café en Grano
 (7,12,250),  -- Café en grano
 -- Latte Vainilla (Producto 8)
(8, 1, 10),   -- Café molido
(8, 3, 200),  -- Leche
(8, 14, 15),  -- Azúcar
-- Chocolate Caliente (Producto 9)
(9, 6, 25),   -- Chocolate
(9, 3, 200),  -- Leche
(9, 13, 3),   -- Canela
-- Smoothie de Fresa (Producto 10)
(10, 3, 200),  -- Leche
(10, 16, 80),  -- Fresa
(10, 15, 1),   -- Plátano
(10, 5, 120),  -- Hielo
-- Croissant de Mantequilla (Producto 11)
(11, 7, 90),   -- Harina
(11, 18, 20),  -- Mantequilla
(11, 8, 1),   -- Huevo
-- Panini de Jamón Serrano (Producto 12)
(12, 9, 2),   -- Pan
(12, 17, 60),  -- Jamón serrano
(12, 11, 40),  -- Queso
-- Producto 13: Latte Caramelo
(13, 1, 10),   -- Café
(13, 3, 200),  -- Leche
(13, 20, 20),  -- Caramelo
-- Producto 14: Espresso Doble
(14, 1, 20),   -- Café molido
(14, 2, 60),   -- Agua
-- Producto 15: Avena con Fruta
(15, 22, 80),  -- Avena
(15, 21, 150), -- Yogur
(15, 16, 50),  -- Fresa
(15, 14, 10),  -- Azúcar
-- Producto 16: Malteada de Chocolate
(16, 3, 250),  -- Leche
(16, 6, 30),   -- Chocolate
(16, 5, 120),  -- Hielo
-- Producto 17: Galletas de Avena
(17, 22, 90),  -- Avena
(17, 7, 80),   -- Harina
(17, 18, 20),  -- Mantequilla
(17, 14, 15),  -- Azúcar
-- Producto 18: Baguette de Pollo
(18, 9, 2),   -- Pan
(18, 23, 80),  -- Pollo
(18, 11, 40),  -- Queso
(18, 25, 30),  -- Tomate
-- Producto 19: Ensalada de Pollo
(19, 23, 90),  -- Pollo
(19, 24, 40),  -- Lechuga
(19, 25, 25), -- Tomate
-- Producto 20: Frappé de Caramelo
(20, 3, 200),  -- Leche
(20, 5, 150),  -- Hielo
(20, 20, 25);  -- Caramelo

INSERT INTO Descuento (descripcion, porcentaje, id_Producto) VALUES
('Promoción Café Americano', 10, 1),
('Descuento Cappuccino', 15, 2),
('Oferta Té Verde', 10, 3),
('Frappé en promoción', 12, 4),
('Descuento Muffin', 8, 5),
('Sándwich en combo', 10, 6),
('Termo Cherry por temporada', 7, 22);

INSERT INTO Proveedor (nombre, direccion, descripcion) VALUES
('Cafés del Sur', 'Av. Central 120, CDMX', 'Proveedor de café en grano y molido'),
('Lácteos San Juan', 'Carr. Nacional Km 5, Guanajuato', 'Proveedor de leche, yogur y crema'),
('Panadería El Trigo', 'Calle Hidalgo 45, Celaya', 'Proveedor de pan, harina y repostería'),
('Distribuidora La Huerta', 'Mercado de Abastos, Celaya', 'Proveedor de frutas y verduras'),
('Abarrotes La Económica', 'Av. Revolución 88, Celaya', 'Proveedor de insumos generales'),
('Carnes Selectas del Bajío', 'Blvd. Industrial 210, Irapuato', 'Proveedor de pollo y carnes frías'),
('Suministros Cherry', 'Zona Industrial 300, Querétaro', 'Artículos promocionales y termos'),
('Cítricos del Centro', 'Km 12 Carr. Celaya–Salamanca', 'Proveedor de naranjas, limón y cítricos'),
('Dulces y Sabores MX', 'Av. Tecnológico 455, Querétaro', 'Proveedor de jarabes, caramelo y saborizantes'),
('Hielos del Bajío', 'Zona Refrigeración 22, Celaya', 'Proveedor de hielo industrial'),
('Envases y Empaques SA', 'Parque Industrial Apaseo, Apaseo el Grande', 'Proveedor de vasos, tapas y empaques'),
('Granja Avícola La Palma', 'Ejido San José, Salvatierra', 'Proveedor de huevo fresco');

INSERT INTO Contacto (id_Proveedor, numero, nombre, telefono) VALUES
-- Proveedor 1: Cafés del Sur
(1, 1, 'Carlos Méndez', '5512345678'),
(1, 2, 'Ventas Cafés del Sur', '5511122233'),
-- Proveedor 2: Lácteos San Juan
(2, 1, 'Laura Gómez', '4612233445'),
(2, 2, 'Distribución Lácteos', '4619988776'),
-- Proveedor 3: Panadería El Trigo
(3, 1, 'Miguel Torres', '4613344556'),
-- Proveedor 4: Distribuidora La Huerta
(4, 1, 'Ana López', '4615566778'),
-- Proveedor 5: Abarrotes La Económica
(5, 1, 'Jorge Ramírez', '4616677889'),
-- Proveedor 6: Carnes Selectas del Bajío
(6, 1, 'Luis Hernández', '4627788990'),
-- Proveedor 7: Suministros Cherry
(7, 1, 'Erika Flores', '4428899001'),
(7, 2, 'Soporte Cherry', '4421100223'),
-- Proveedor 8: Cítricos del Centro
(8, 1, 'Raúl Pérez', '4619011223'),
(8, 2, 'Ventas Cítricos', '4619011445'),
-- Proveedor 9: Dulces y Sabores MX
(9, 1, 'Mariana Soto', '4423457788'),
(9, 2, 'Atención a Clientes', '4425678899'),
-- Proveedor 10: Hielos del Bajío
(10, 1, 'Roberto Díaz', '4617788990'),
-- Proveedor 11: Envases y Empaques SA
(11, 1, 'Paola Ríos', '4132233445'),
(11, 2, 'Ventas Empaques', '4139988776'),
-- Proveedor 12: Granja Avícola La Palma
(12, 1, 'José Martínez', '4663344556'),
(12, 2, 'Pedidos Avícola', '4665566778');