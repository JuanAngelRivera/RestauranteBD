CREATE TABLE TablaError (
    id TEXT NOT NULL PRIMARY KEY,
    descripcion TEXT
);

CREATE TABLE MetodoPago (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT	
);

CREATE TABLE CherryLocal (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    direccion TEXT,
    nombre TEXT,
    telefono TEXT
);

CREATE TABLE Rol (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT,
    sueldo REAL
);

CREATE TABLE Turno (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    horaInicio TEXT,
    horaFin TEXT,
    descripcion TEXT
);

CREATE TABLE Bonus (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    valor REAL,
    descripcion TEXT
);

CREATE TABLE Empleado (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    telefono TEXT,
    CURP TEXT UNIQUE,
    RFC TEXT UNIQUE,
    fechaIngreso TEXT,
    NSS TEXT UNIQUE,
    foto TEXT,
    id_Rol INTEGER NOT NULL,
    id_Turno INTEGER NOT NULL,
    FOREIGN KEY (id_Rol) REFERENCES Rol(id),
    FOREIGN KEY (id_Turno) REFERENCES Turno(id)
);

CREATE TABLE Nomina (
    id_Empleado INTEGER NOT NULL,
    fechaPago TEXT NOT NULL,
    salarioTotal REAL,
    PRIMARY KEY (id_Empleado, fechaPago),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id)
);

CREATE TABLE Beneficios (
    id_Empleado INTEGER NOT NULL,
    fechaPago_Nomina TEXT NOT NULL,
    id_Bonus INTEGER NOT NULL,
    PRIMARY KEY (id_Empleado, fechaPago_Nomina, id_Bonus),
    FOREIGN KEY (id_Empleado, fechaPago_Nomina) REFERENCES Nomina(id_Empleado, fechaPago),
    FOREIGN KEY (id_Bonus) REFERENCES Bonus(id)
);

CREATE TABLE Cuenta (
    id_Empleado INTEGER NOT NULL,
    nombreUsuario TEXT NOT NULL,
    contraseña TEXT,
    tipo INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (id_Empleado, nombreUsuario),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id)
        ON DELETE CASCADE
);

CREATE TABLE Orden (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_CherryLocal INTEGER,
    total REAL,
    fechaRealizada TEXT,
    id_Empleado INTEGER NOT NULL,
    FOREIGN KEY (id_CherryLocal) REFERENCES CherryLocal(id),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id)
);

CREATE TABLE Pago (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT,
    id_metodoPago INTEGER NOT NULL,
    id_orden INTEGER NOT NULL,
    id_cherryLocal INTEGER NOT NULL,
    FOREIGN KEY (id_metodoPago) REFERENCES MetodoPago(id),
    FOREIGN KEY (id_orden) REFERENCES Orden(id),
    FOREIGN KEY (id_cherryLocal) REFERENCES CherryLocal(id)
);

CREATE TABLE Categoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    descripcion TEXT
);

CREATE TABLE Producto (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    precio REAL,
    id_Categoria INTEGER NOT NULL,
    foto TEXT,
    FOREIGN KEY (id_Categoria) REFERENCES Categoria(id)
);

CREATE TABLE Contiene (
    id_Orden INTEGER NOT NULL,
    id_CherryLocal INTEGER NOT NULL,
    id_Producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    PRIMARY KEY (id_Orden, id_CherryLocal, id_Producto),
    FOREIGN KEY (id_Orden) REFERENCES Orden(id),
    FOREIGN KEY (id_CherryLocal) REFERENCES CherryLocal(id),
    FOREIGN KEY (id_Producto) REFERENCES Producto(id)
);

CREATE TABLE Descuento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT,
    porcentaje INTEGER,
    id_Producto INTEGER NOT NULL,
    FOREIGN KEY (id_Producto) REFERENCES Producto(id)
);

CREATE TABLE Medida (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT
);

CREATE TABLE Proveedor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    direccion TEXT,
    descripcion TEXT
);

CREATE TABLE Insumo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    costo REAL,
    descripcion TEXT,
    id_Medida INTEGER NOT NULL,
    enAlmacen INTEGER,
    FOREIGN KEY (id_Medida) REFERENCES Medida(id)
);

CREATE TABLE Ingredientes (
    id_Producto INTEGER NOT NULL,
    id_Insumo INTEGER NOT NULL,
    cantidad INTEGER,
    PRIMARY KEY (id_Insumo, id_Producto),
    FOREIGN KEY (id_Insumo) REFERENCES Insumo(id),
    FOREIGN KEY (id_Producto) REFERENCES Producto(id)
);

CREATE TABLE Contacto (
    id_Proveedor INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    nombre TEXT,
    telefono TEXT,
    PRIMARY KEY (id_Proveedor, numero),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id)
        ON DELETE CASCADE
);