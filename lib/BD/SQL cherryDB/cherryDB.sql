create  database cherryDB;
use cherryDB;
                  
CREATE TABLE Error (id INTEGER AUTO_INCREMENT NOT NULL,
					descripcion TEXT,
                    constraint ErrorPK PRIMARY KEY (id)
                    );

CREATE TABLE MetodoPago (id INTEGER AUTO_INCREMENT not null,
						 descripcion TEXT,
                         constraint MetodopagoPK PRIMARY KEY (id)
                         );

CREATE TABLE Pago (id INTEGER AUTO_INCREMENT NOT NULL,
				   descripcion TEXT,
                   id_metodoPago INTEGER,
                   Id_orden INTEGER,
                   constraint Pago PRIMARY KEY (id)
                   constraint PagoPK FOREIGN KEY (id_metodoPago) REFERENCES MetodoPago(id),
                   CONSTRAINT FK_Pago_Orden FOREIGN KEY (Id_orden_FK2) REFERENCES Orden(Id)
);


CREATE TABLE Local (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(30),
    nombre VARCHAR(25),
    telefono VARCHAR(10)
);


CREATE TABLE Rol (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    sueldo DECIMAL(9,2)
);


CREATE TABLE Turno (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    horaInicio TIME,
    horaFin TIME,
    descripcion TEXT
);


CREATE TABLE Empleado (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    telefono VARCHAR(10),
    CURP VARCHAR(18),
    RFC VARCHAR(13),
    fechaIngreso DATE,
    NSS VARCHAR(11),
    Id_Rol_FK1 INTEGER,
    Id_Turno_FK2 INTEGER,
    CONSTRAINT FK_Empleado_Rol FOREIGN KEY (Id_Rol_FK1) REFERENCES Rol(Id),
    CONSTRAINT FK_Empleado_Turno FOREIGN KEY (Id_Turno_FK2) REFERENCES Turno(Id)
);


CREATE TABLE Cuenta (
    Id_Empleado_FK1 INTEGER,
    nombreUsuario VARCHAR(25),
    contraseña VARCHAR(25),
    PRIMARY KEY (Id_Empleado_FK1),
    CONSTRAINT FK_Cuenta_Empleado FOREIGN KEY (Id_Empleado_FK1) REFERENCES Empleado(Id)
);

CREATE TABLE Orden (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Id_local_FK INTEGER,
    total DECIMAL(9,2),
    fechaRealizada DATE,
    Id_Empleado_FK2 INTEGER,
    CONSTRAINT FK_Orden_Local FOREIGN KEY (Id_local_FK) REFERENCES Local(Id),
    CONSTRAINT FK_Orden_Empleado FOREIGN KEY (Id_Empleado_FK2) REFERENCES Empleado(Id)
);


CREATE TABLE Categoria (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    descripcion TEXT
);


CREATE TABLE Producto (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    precio DECIMAL(9,2),
    Id_Categoria_FK1 INTEGER,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (Id_Categoria_FK1) REFERENCES Categoria(Id)
);



CREATE TABLE Contiene (
    Id_Orden_FK1 INTEGER,
    Id_Producto_FK2 INTEGER,
    PRIMARY KEY (Id_Orden_FK1, Id_Producto_FK2),
    CONSTRAINT FK_Contiene_Orden FOREIGN KEY (Id_Orden_FK1) REFERENCES Orden(Id),
    CONSTRAINT FK_Contiene_Producto FOREIGN KEY (Id_Producto_FK2) REFERENCES Producto(Id)
);

CREATE TABLE Descuento (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    porcentaje INTEGER,
    Id_Producto_FK1 INTEGER,
    CONSTRAINT FK_Descuento_Producto FOREIGN KEY (Id_Producto_FK1) REFERENCES Producto(Id)
);


CREATE TABLE Medida (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT
);


CREATE TABLE Proveedor (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    direccion VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE Insumo (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    costo DECIMAL(9,2),
    descripcion TEXT,
    Id_Medida_FK1 INTEGER,
    enAlmacen INTEGER,
    CONSTRAINT FK_Insumo_Medida FOREIGN KEY (Id_Medida_FK1) REFERENCES Medida(Id)
);




CREATE TABLE Ingredientes (
    Id_Insumo_FK1 INTEGER,
    Id_Producto_FK2 INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (Id_Insumo_FK1, Id_Producto_FK2),
    CONSTRAINT FK_Ingredientes_Insumo FOREIGN KEY (Id_Insumo_FK1) REFERENCES Insumo(Id),
    CONSTRAINT FK_Ingredientes_Producto FOREIGN KEY (Id_Producto_FK2) REFERENCES Producto(Id)
);


CREATE TABLE Contacto (
    Id_Proveedor_FK1 INTEGER,
    numero INTEGER,
    nombre VARCHAR(25),
    telefono VARCHAR(10),
    PRIMARY KEY (Id_Proveedor_FK1, numero),
    CONSTRAINT FK_Contacto_Proveedor FOREIGN KEY (Id_Proveedor_FK1) REFERENCES Proveedor(Id)
);



CREATE TABLE Bonus (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(9,2),
    descripcion TEXT
);


CREATE TABLE Nomina (
    Id_Empleado_FKI INTEGER,
    fechaPago DATE,
    salarioTotal DECIMAL(9,2),
    PRIMARY KEY (Id_Empleado_FKI),
    CONSTRAINT FK_Nomina_Empleado FOREIGN KEY (Id_Empleado_FKI) REFERENCES Empleado(Id)
);


CREATE TABLE Beneficios (
    fechaPago_Nomina_FK1 DATE,
    Id_Bonus_FK2 INTEGER,
    PRIMARY KEY (fechaPago_Nomina_FK1, Id_Bonus_FK2),
    CONSTRAINT FK_Beneficios_Nomina FOREIGN KEY (fechaPago_Nomina_FK1) REFERENCES Nomina(fechaPago),
    CONSTRAINT FK_Beneficios_Bonus FOREIGN KEY (Id_Bonus_FK2) REFERENCES Bonus(Id)
);


                  