import 'package:drift/drift.dart';

class TablaErrors extends Table {
  TextColumn get id => text()();
  TextColumn get descripcion => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class MetodoPagos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
}

class CherryLocals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get direccion => text().nullable()();
  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();
}

class Rols extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
  RealColumn get sueldo => real().nullable()();
}

class Turnos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get horaInicio => text().nullable()();
  TextColumn get horaFin => text().nullable()();
  TextColumn get descripcion => text().nullable()();
}

class Bonuses extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get valor => real().nullable()();
  TextColumn get descripcion => text().nullable()();
}

class Empleados extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();
  TextColumn get curp => text().unique()();
  TextColumn get rfc => text().unique()();
  TextColumn get fechaIngreso => text().nullable()();
  TextColumn get nss => text().unique()();
  TextColumn get foto => text().nullable()();

  IntColumn get idRol =>
      integer().nullable().references(Rols, #id)();

  IntColumn get idTurno =>
      integer().nullable().references(Turnos, #id)();
}

class Nominas extends Table {
  IntColumn get idEmpleado =>
      integer().references(Empleados, #id)();

  TextColumn get fechaPago => text()();

  RealColumn get salarioTotal => real().nullable()();

  @override
  Set<Column> get primaryKey => {idEmpleado, fechaPago};
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
}

class Cuentas extends Table {
  IntColumn get idEmpleado =>
      integer().references(Empleados, #id)();

  TextColumn get nombreUsuario => text()();

  TextColumn get password => text().nullable()();

  @override
  Set<Column> get primaryKey => {idEmpleado, nombreUsuario};
}

class Ordens extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idCherryLocal =>
      integer().nullable().references(CherryLocals, #id)();

  RealColumn get total => real().nullable()();

  TextColumn get fechaRealizada => text().nullable()();

  IntColumn get idEmpleado =>
      integer().nullable().references(Empleados, #id)();
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
}

class Categorias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get descripcion => text().nullable()();
}

class Productos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  RealColumn get precio => real().nullable()();

  IntColumn get idCategoria =>
      integer().nullable().references(Categorias, #id)();

  TextColumn get foto => text().nullable()();
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
}

class Descuentos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
  IntColumn get porcentaje => integer().nullable()();

  IntColumn get idProducto =>
      integer().nullable().references(Productos, #id)();
}

class Medidas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descripcion => text().nullable()();
}

class Proveedors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  TextColumn get direccion => text().nullable()();
  TextColumn get descripcion => text().nullable()();
}

class Insumos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().nullable()();
  RealColumn get costo => real().nullable()();
  TextColumn get descripcion => text().nullable()();

  IntColumn get idMedida =>
      integer().nullable().references(Medidas, #id)();

  IntColumn get enAlmacen => integer().nullable()();
}

class Ingredients extends Table {
  IntColumn get idProducto =>
      integer().references(Productos, #id)();

  IntColumn get idInsumo =>
      integer().references(Insumos, #id)();

  IntColumn get cantidad => integer().nullable()();

  @override
  Set<Column> get primaryKey => {idInsumo, idProducto};
}

class Contactos extends Table {
  IntColumn get idProveedor =>
      integer().references(Proveedors, #id)();

  IntColumn get numero => integer()();

  TextColumn get nombre => text().nullable()();
  TextColumn get telefono => text().nullable()();

  @override
  Set<Column> get primaryKey => {idProveedor, numero};
}