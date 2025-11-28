DROP DATABASE IF EXISTS cherryDB;


create  database cherryDB;
use cherryDB;
                  
CREATE TABLE TablaError (id varchar(20) NOT NULL,
					descripcion TEXT,
                    constraint ErrorPK primary key (id)
                    ); -- 🐑	🐑

CREATE TABLE MetodoPago (id INTEGER AUTO_INCREMENT not null,
						 descripcion TEXT,
                         constraint MetodopagoPK primary key (id)
                         ); -- 🐑	🐑

CREATE TABLE CherryLocal (id INTEGER AUTO_INCREMENT NOT NULL,
					direccion VARCHAR(50),
                    nombre VARCHAR(40),
                    telefono VARCHAR(15),
                    constraint LocalPK primary key (id)
                    );  -- 🐑	🐑

CREATE TABLE Rol (id INTEGER AUTO_INCREMENT NOT NULL,
				  descripcion TEXT,
                  sueldo DECIMAL(9,2),
                  constraint RolPK primary key (id) 
                  ); -- 🐑	🐑


CREATE TABLE Turno (id INTEGER AUTO_INCREMENT NOT NULL,
					horaInicio TIME,
					horaFin TIME,
					descripcion TEXT,
					constraint TurnoPK primary key (id)
                    ); -- 🐑	🐑

CREATE TABLE Bonus (id INTEGER AUTO_INCREMENT NOT NULL,
					valor DECIMAL(9,2),
                    descripcion TEXT,
                    constraint BonusPK primary key (id)
                    ); -- 🐑    no
                    
CREATE TABLE Empleado (id INTEGER AUTO_INCREMENT NOT NULL,
					   nombre VARCHAR(40),
                       telefono VARCHAR(15),
                       CURP VARCHAR(18) UNIQUE,
                       RFC VARCHAR(13) UNIQUE,
                       fechaIngreso DATE,
                       NSS VARCHAR(11) UNIQUE,
                       foto VARCHAR(100),
                       id_Rol INTEGER,
                       id_Turno INTEGER,
                       constraint EmpleadoPK primary key (id),
                       constraint EmpleadoFK1 foreign key (Id_Rol) REFERENCES Rol(id),
                       constraint EmpleadoFK2 foreign key (Id_Turno) REFERENCES Turno(Id)
                       ); -- 🐑     no
                       
CREATE TABLE Nomina (id_Empleado INTEGER NOT NULL,
					 fechaPago DATE NOT NULL,
                     salarioTotal DECIMAL(9,2),
                     constraint NominaPK primary key (id_Empleado, fechaPago),
                     constraint NominaFK foreign key (id_Empleado) REFERENCES Empleado(id)
                     );   -- 🐑   no

CREATE TABLE Beneficios (id_Empleado INTEGER NOT NULL,
                         fechaPago_Nomina DATE NOT NULL,
						 id_Bonus INTEGER NOT NULL,
                         constraint primary key (id_Empleado, fechaPago_Nomina, id_Bonus),
                         constraint BeneficiosFK1 foreign key (id_Empleado, fechaPago_Nomina) REFERENCES Nomina(id_Empleado, fechaPago),
                         constraint BeneficiosFK2 foreign key (id_Bonus) REFERENCES Bonus(id)
                         ); -- 🐑 no 

CREATE TABLE Cuenta (id_Empleado INTEGER NOT NULL,
					 nombreUsuario VARCHAR(25) NOT NULL,
                     contraseña VARCHAR(25),
                     constraint CuentaPK primary key (id_Empleado, nombreUsuario),
                     constraint CuentaFK1 foreign key (id_Empleado) REFERENCES Empleado(id)
                     ); -- 🐑	no

CREATE TABLE Orden (id_CherryLocal INTEGER,
				id INTEGER AUTO_INCREMENT NOT NULL,
                    total DECIMAL(9,2),
                    fechaRealizada DATE,
                    id_Empleado INTEGER,
                    constraint OrdenPK primary key(id,id_CherryLocal),
                    constraint OrdenFK1 foreign key (id_CherryLocal) REFERENCES CherryLocal(id),
                    constraint OrdenFK2 foreign key (id_Empleado) REFERENCES Empleado(id)
                    ); -- 🐑 	no
                    
CREATE TABLE Pago (id INTEGER AUTO_INCREMENT NOT NULL,
				   descripcion TEXT,
                   id_metodoPago INTEGER,
                   id_orden INTEGER,
                   id_cherryLocal INTEGER,
                   constraint PagoPK primary key (id),
                   constraint PagoFK1 foreign key (id_metodoPago) references MetodoPago(id),
                   constraint PagoFK2 foreign key (id_orden,id_CherryLocal) references Orden(id,id_CherryLocal)
                   ); -- 🐑	no
                    
CREATE TABLE Categoria (id INTEGER AUTO_INCREMENT NOT NULL,
						nombre VARCHAR(40),
                        descripcion TEXT,
                        constraint CategoriaPK primary key (id)
                        ); -- 🐑	🐑

CREATE TABLE Producto (id INTEGER AUTO_INCREMENT NOT NULL,
					   nombre VARCHAR(40),
                       precio DECIMAL(9,2),
                       id_Categoria INTEGER,
                       foto VARCHAR(100),
                       constraint ProductoPK primary key (id),
                       constraint ProductoFK FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id)
                       ); -- 🐑   🐑

CREATE TABLE Contiene (id_Orden INTEGER,
					   id_CherryLocal INTEGER,
					   id_Producto INTEGER,
                       constraint ContienePK primary key (id_Orden, id_CherryLocal, id_Producto),
                       constraint ContieneFK1 foreign key (id_Orden, id_CherryLocal) REFERENCES Orden(id,id_CherryLocal),
                       constraint ContieneFK2 foreign key (id_Producto) REFERENCES Producto(id)
                       ); -- 🐑  no

CREATE TABLE Descuento (id INTEGER AUTO_INCREMENT NOT NULL,
						descripcion TEXT,
                        porcentaje INTEGER,
                        id_Producto INTEGER,
                        constraint DescuentoPK primary key (id),
                        constraint DescuentoFK foreign key (id_Producto) REFERENCES Producto(id)
                        ); -- 🐑   
                        
CREATE TABLE Medida (id INTEGER AUTO_INCREMENT NOT NULL,
					descripcion TEXT,
                    constraint MedidaPK primary key (id)
                    ); -- 🐑	 🐑

CREATE TABLE Proveedor (id INTEGER AUTO_INCREMENT NOT NULL,
					    nombre VARCHAR(40),
                        direccion VARCHAR(50),
                        descripcion TEXT,
                        constraint ProveedorPK primary key (id)
                        ); -- 🐑

CREATE TABLE Insumo (id INTEGER AUTO_INCREMENT NOT NULL,
					 nombre VARCHAR(40),
                     costo DECIMAL(9,2),
                     descripcion TEXT,
                     id_Medida INTEGER,
                     enAlmacen INTEGER,
                     constraint InsumoPK primary key (id),
                     constraint InsumoFK1 foreign key (id_Medida) REFERENCES Medida(id)
                     ); -- 🐑	 🐑

CREATE TABLE Ingredientes (id_Producto INTEGER,
                           id_Insumo INTEGER,
                           cantidad INTEGER,
                           constraint primary key (id_Insumo, id_Producto),
                           constraint IngredientesFK1 foreign key (id_Insumo) REFERENCES Insumo(id),
                           constraint IngredientesFK2 foreign key (id_Producto) REFERENCES Producto(id)
                           ); -- 🐑   🐑

CREATE TABLE Contacto (id_Proveedor INTEGER,
					   numero INTEGER NOT NULL,
                       nombre VARCHAR(40),
                       telefono VARCHAR(15),
                       constraint primary key (id_Proveedor, numero),
                       CONSTRAINT ContactoFK1 foreign key (id_Proveedor) REFERENCES Proveedor(id)
                       );          