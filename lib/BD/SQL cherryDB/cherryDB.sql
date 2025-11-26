create  database cherryDB;
use cherryDB;
                  
CREATE TABLE TablaError (id INTEGER AUTO_INCREMENT NOT NULL,
					descripcion TEXT,
                    constraint ErrorPK primary key (id)
                    );

CREATE TABLE MetodoPago (id INTEGER AUTO_INCREMENT not null,
						 descripcion TEXT,
                         constraint MetodopagoPK primary key (id)
                         );

CREATE TABLE Pago (id INTEGER AUTO_INCREMENT NOT NULL,
				   descripcion TEXT,
                   id_metodoPago INTEGER,
                   Id_orden INTEGER,
                   constraint PagoPK primary key (id),
                   constraint PagoFK1 foreign key (id_metodoPago) references MetodoPago(id),
                   constraint PagoFK2 foreign key (Id_orden) references Orden(Id)
                   );

CREATE TABLE CherryLocal (id INTEGER AUTO_INCREMENT NOT NULL,
					direccion VARCHAR(30),
                    nombre VARCHAR(25),
                    telefono VARCHAR(10),
                    constraint LocalPK primary key (id)
                    );

CREATE TABLE Rol (id INTEGER PRIMARY KEY AUTO_INCREMENT,
				  descripcion TEXT,
                  sueldo DECIMAL(9,2),
                  constraint RolPK primary key (id) 
                  );


CREATE TABLE Turno (id INTEGER AUTO_INCREMENT NOT NULL,
					horaInicio TIME,
					horaFin TIME,
					descripcion TEXT,
					constraint TurnoPK primary key (id)
                    );

CREATE TABLE Bonus (id INTEGER AUTO_INCREMENT NOT NULL,
					valor DECIMAL(9,2),
                    descripcion TEXT,
                    constraint BonusPK primary key (id)
                    );

CREATE TABLE Nomina (id_Empleado INTEGER NOT NULL,
					 fechaPago DATE NOT NULL,
                     salarioTotal DECIMAL(9,2),
                     constraint primary key (id_Empleado,fechaPago),
                     constraint Nomina foreign key (id_Empleado) REFERENCES Empleado(id)
);


CREATE TABLE Beneficios (fechaPago_Nomina DATE NOT NULL,
						 id_Bonus INTEGER NOT NULL,
                         constraint primary key (fechaPago_Nomina, id_Bonus),
                         constraint BeneficiosFK1 foreign key (fechaPago_Nomina) REFERENCES Nomina(fechaPago),
                         constraint BeneficiosFK2 foreign key (id_Bonus) REFERENCES Bonus(id)
);

                    
CREATE TABLE Empleado (id INTEGER AUTO_INCREMENT NOT NULL,
					   nombre VARCHAR(25),
                       telefono VARCHAR(10),
                       CURP VARCHAR(18),
                       RFC VARCHAR(13),
                       fechaIngreso DATE,
                       NSS VARCHAR(11),
                       id_Rol INTEGER,
                       id_Turno INTEGER,
                       constraint EmpleadoPK primary key (id),
                       constraint EmpleadoFK1 foreign key (Id_Rol) REFERENCES Rol(id),
                       constraint EmpleadoFK2 foreign key (Id_Turno) REFERENCES Turno(Id)
                       );

CREATE TABLE Cuenta (id_Empleado INTEGER NOT NULL,
					 nombreUsuario VARCHAR(25) NOT NULL,
                     contraseña VARCHAR(25),
                     PRIMARY KEY (Id_Empleado_FK1),
                     constraint CuentaPK primary key (id_Empleado,nombreUsauario),
                     constraint CuentaFK1 foreign key (id_Empleado) REFERENCES Empleado(id)
                     );

CREATE TABLE Orden (id_local INTEGER AUTO_INCREMENT NOT NULL,
					id INTEGER AUTO_INCREMENT NOT NULL,
                    total DECIMAL(9,2),
                    fechaRealizada DATE,
                    id_Empleado_FK2 INTEGER,
                    constraint OrdenPK primary key(id_Local,id),
                    constraint OrdenFK1 foreign key (Id_local) REFERENCES Local(id),
                    constraint OrdenFK2 foreign key (Id_Empleado) REFERENCES Empleado(id)
                    );
                    
CREATE TABLE Categoria (id INTEGER AUTO_INCREMENT NOT NULL,
						nombre VARCHAR(25),
                        descripcion TEXT,
                        constraint CategoriaPK primary key (id)
                        );

CREATE TABLE Producto (id INTEGER AUTO_INCREMENT NOT NULL,
					   nombre VARCHAR(25),
                       precio DECIMAL(9,2),
                       id_Categoria INTEGER,
                       constraint ProductoPK primary key (id),
                       constraint ProductoFK FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id)
                       );

CREATE TABLE Contiene (id_Orden INTEGER NOT NULL,
					   id_Producto2 INTEGER NOT NULL,
                       constraint ContienePK primary key (id_Orden, id_Producto),
                       constraint ContieneFK1 foreign key (id_Orden) REFERENCES Orden(id),
                       constraint ContieneFK2 foreign key (Id_Producto) REFERENCES Producto(id)
                       );

CREATE TABLE Descuento (id INTEGER AUTO_INCREMENT NOT NULL,
						descripcion TEXT,
                        porcentaje INTEGER,
                        id_Producto INTEGER,
                        constraint DescuentoPK primary key (id),
                        constraint DescuentoFK foreign key (id_Producto) REFERENCES Producto(id)
                        );
                        
CREATE TABLE Medida (id INTEGER AUTO_INCREMENT NOT NULL,
					descripcion TEXT,
                    constraint MedidaPK primary key (id)
                    );

CREATE TABLE Proveedor (id INTEGER AUTO_INCREMENT NOT NULL,
					    nombre VARCHAR(25),
                        direccion VARCHAR(30),
                        descripcion TEXT,
                        constraint ProveedorPK primary key (id)
                        );

CREATE TABLE Insumo (id INTEGER AUTO_INCREMENT NOT NULL,
					 nombre VARCHAR(25),
                     costo DECIMAL(9,2),
                     descripcion TEXT,
                     id_Medida INTEGER,
                     enAlmacen INTEGER,
                     constraint InsumoPK primary key (id),
                     constraint InsumoFK1 foreign key (id_Medida) REFERENCES Medida(id)
                     );

CREATE TABLE Ingredientes (id_Insumo INTEGER NOT NULL,
						   id_Producto_FK2 INTEGER,
                           cantidad INTEGER,
                           constraint primary key (id_Insumo, id_Producto),
                           constraint IngredientesFK1 foreign key (id_Insumo) REFERENCES Insumo(id),
                           constraint IngredientesFK2 foreign key (id_Producto) REFERENCES Producto(id)
                           );

CREATE TABLE Contacto (id_Proveedor_FK1 INTEGER NOT NULL,
					   numero INTEGER NOT NULL,
                       nombre VARCHAR(25),
                       telefono VARCHAR(10),
                       constraint primary key (id_Proveedor_FK1, numero),
                       CONSTRAINT ContactoFK1 foreign key (id_Proveedor) REFERENCES Proveedor(id)
                       );


                  