use cherryDB;

/*delete  from TablaError
where id != "miau";*/

INSERT INTO MetodoPago (descripcion) VALUES 
('Tarjeta.'),
('Efectivo');
 select * from 	MetodoPago;

INSERT INTO CherryLocal (direccion,nombre,telefono) VALUES
('Antonio Garcia Cubas,Nuevo Tecnologico','CherryLocal','4611020976');
select * from  CherryLocal;

INSERT INTO Rol (descripcion, sueldo) VALUES 
('Gerente', 2939.16),
('Ayudante General', 1951.60);
select * from Rol;


INSERT INTO Turno (horaInicio, horaFin, descripcion) VALUES
('07:00:00', '15:00:00', 'Turno Matutino'),
('15:00:00', '21:00:00', 'Turno Vespertino ');
select * from Turno;

INSERT INTO Bonus (valor, descripcion) VALUES
('100.00','Bonus por puntualidad');
select * from Bonus;

-- 


INSERT INTO Categoria (nombre,descripcion) VALUES
('Bebidas Calientes (Café)', 'Espresso, Americano, Lattes, Cappuccinos y métodos de extracción.'),
('Otras Bebidas Calientes', 'Tés, infusiones, chocolate caliente y bebidas tradicionales no basadas en café.'),
('Bebidas Frías', 'Iced Lattes, Frappés, Smoothies, jugos naturales y refrescos.'),
('Panadería y Repostería', 'Pan dulce, croissants, muffins, panqués, galletas y postres varios.'),
('Alimentos Salados', 'Sándwiches, paninis, bagels, quiches, empanadas y opciones de desayuno/comida.'),
('Artículos Adicionales', 'Venta de café en grano/molido, tazas, termos y merchandising de la cafetería.');
select * from Categoria;
 
INSERT INTO Medida (descripcion) VALUES
('Gramos'),
('Mililitros'),
('Piezas');
select * from Medida;

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
('Café en Grano', 200.00, 'Café sin moler', 1, 8000);
select * from Insumo;


INSERT INTO Producto (nombre, precio, id_Categoria, foto) VALUES
('Café Americano', 35.00, 1, 'americano.jpg'),
('Cappuccino', 55.00, 1, 'cappuccino.jpg'),
('Té Verde', 30.00, 2, 'teverde.jpg'),
('Frappé de Chocolate', 60.00, 3, 'frappe.jpg'),
('Muffin de Chocolate', 28.00, 4, 'muffin.jpg'),
('Sándwich Jamón y Queso', 50.00, 5, 'sandwich.jpg'),
('Café en Grano 250g', 120.00, 6, 'cafegrano.jpg');
select* from Producto;


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
 (7,12,250);  -- Café en grano

select * from Ingredientes;













