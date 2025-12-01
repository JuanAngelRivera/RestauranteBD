import 'package:drift/drift.dart';

class TablaErrors extends Table {
  TextColumn get id => text()();
  TextColumn get descripcion => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'TablaError';
}

class MetodoPagos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'MetodoPago';
}

class CherryLocals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get direccion => text().nullable()();
  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();

  @override
  String get tableName => 'CherryLocal';
}

class Rols extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
  RealColumn get sueldo => real().nullable()();

  @override
  String get tableName => 'Rol';
}

class Turnos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get horaInicio => text().nullable()();
  TextColumn get horaFin => text().nullable()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'Turno';
}

class Bonuses extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get valor => real().nullable()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'Bonus';
}

class Empleados extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();
  TextColumn get curp => text().unique().nullable()();
  TextColumn get rfc => text().unique().nullable()();
  TextColumn get fechaIngreso => text().named("fechaIngreso").nullable()();
  TextColumn get nss => text().unique().nullable()();
  TextColumn get foto => text().nullable()();

  IntColumn get idRol =>
      integer().nullable().references(Rols, #id)();

  IntColumn get idTurno =>
      integer().nullable().references(Turnos, #id)();

  @override
  String get tableName => 'Empleado';
}

class Nominas extends Table {
  IntColumn get idEmpleado =>
      integer().references(Empleados, #id)();

  TextColumn get fechaPago => text()();

  RealColumn get salarioTotal => real().nullable()();

  @override
  Set<Column> get primaryKey => {idEmpleado, fechaPago};

  @override
  String get tableName => 'Nomina';
}

class Beneficios extends Table {
  IntColumn get idEmpleado =>
      integer().references(Nominas, #idEmpleado)();

  TextColumn get fechaPagoNomina =>
      text().references(Nominas, #fechaPago)();

  IntColumn get idBonus =>
      integer().references(Bonuses, #id)();

  @override
  Set<Column> get primaryKey => {idEmpleado, fechaPagoNomina, idBonus};

  @override
  String get tableName => 'Beneficios';
}

class Cuentas extends Table {
  IntColumn get idEmpleado =>
      integer().references(Empleados, #id).nullable()();

  TextColumn get usuario => text().named("nombreUsuario")();

  TextColumn get password => text().named("contraseña").nullable()();

  @override
  Set<Column> get primaryKey => {idEmpleado, usuario};

  @override
  String get tableName => 'Cuenta';
}

class Ordens extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idCherryLocal =>
      integer().nullable().references(CherryLocals, #id)();

  RealColumn get total => real().nullable()();

  TextColumn get fechaRealizada => text().nullable()();

  IntColumn get idEmpleado =>
      integer().nullable().references(Empleados, #id)();

  @override
  String get tableName => 'Orden';
}

class Pagos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get descripcion => text().nullable()();

  IntColumn get idMetodoPago =>
      integer().nullable().references(MetodoPagos, #id)();

  IntColumn get idOrden =>
      integer().nullable().references(Ordens, #id)();

  IntColumn get idCherryLocal =>
      integer().nullable().references(CherryLocals, #id)();

  @override
  String get tableName => 'Pago';
}

class Categorias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'Categoria';
}

class Productos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  RealColumn get precio => real().nullable()();

  IntColumn get idCategoria =>
      integer().nullable().references(Categorias, #id)();

  TextColumn get foto => text().nullable()();

  @override
  String get tableName => 'Producto';
}

class Contienes extends Table {
  IntColumn get idOrden =>
      integer().references(Ordens, #id)();

  IntColumn get idCherryLocal =>
      integer().references(CherryLocals, #id)();

  IntColumn get idProducto =>
      integer().references(Productos, #id)();

  @override
  Set<Column> get primaryKey =>
      {idOrden, idCherryLocal, idProducto};

  @override
  String get tableName => 'Contiene';
}

class Descuentos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
  IntColumn get porcentaje => integer().nullable()();

  IntColumn get idProducto =>
      integer().nullable().references(Productos, #id)();

  @override
  String get tableName => 'Descuento';
}

class Medidas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'Medida';
}

class Proveedors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get direccion => text().nullable()();
  TextColumn get descripcion => text().nullable()();

  @override
  String get tableName => 'Proveedor';
}

class Insumos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  RealColumn get costo => real().nullable()();
  TextColumn get descripcion => text().nullable()();

  IntColumn get idMedida =>
      integer().nullable().references(Medidas, #id)();

  IntColumn get enAlmacen => integer().nullable()();

  @override
  String get tableName => 'Insumo';
}

class Ingredients extends Table {
  IntColumn get idProducto =>
      integer().references(Productos, #id)();

  IntColumn get idInsumo =>
      integer().references(Insumos, #id)();

  IntColumn get cantidad => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idInsumo, idProducto};

  @override
  String get tableName => 'Ingredientes';
}

class Contactos extends Table {
  IntColumn get idProveedor =>
      integer().references(Proveedors, #id)();

  IntColumn get numero => integer()();

  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();

  @override
  Set<Column> get primaryKey => {idProveedor, numero};

  @override
  String get tableName => 'Contacto';
}