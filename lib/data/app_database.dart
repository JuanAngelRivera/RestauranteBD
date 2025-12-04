import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:restaurante_base_de_datos/data/dao/login_dao.dart';
import 'package:restaurante_base_de_datos/utils/dao_helper.dart';

import 'dao/admin_dao.dart';
import 'dao/daos.dart';
import 'tables/database.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    TablaErrors,
    MetodoPagos,
    CherryLocals,
    Rols,
    Turnos,
    Bonuses,
    Empleados,
    Nominas,
    Beneficios,
    Cuentas,
    Ordens,
    Pagos,
    Categorias,
    Productos,
    Contienes,
    Descuentos,
    Medidas,
    Proveedors,
    Insumos,
    Ingredients,
    Contactos,
  ],
  daos: [
    TablaErrorsDao,
    MetodoPagosDao,
    CherryLocalsDao,
    RolsDao,
    TurnosDao,
    BonusesDao,
    EmpleadosDao,
    NominasDao,
    BeneficiosDao,
    CuentasDao,
    OrdensDao,
    PagosDao,
    CategoriasDao,
    ProductosDao,
    ContienesDao,
    DescuentosDao,
    MedidasDao,
    ProveedorsDao,
    InsumosDao,
    IngredientsDao,
    ContactosDao,
    // vistas
    LoginDao,
    AdminDao,
    DaoHelper,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await _crearSchema();
      await _insertarSeed();

      await customStatement('''
            CREATE TRIGGER IF NOT EXISTS crear_cuenta_empleado
            AFTER INSERT ON Empleado
            BEGIN
              INSERT INTO Cuenta (id_Empleado, nombreUsuario, contraseña, tipo)
              VALUES (
                NEW.id,
                LOWER(REPLACE(NEW.nombre, ' ', '')),
                LOWER(REPLACE(NEW.nombre, ' ', '')),
                0
              );
            END;
          ''');

      await customStatement('''
  CREATE TRIGGER IF NOT EXISTS actualizar_nombre_cuenta
  AFTER UPDATE ON Empleado
  BEGIN
    UPDATE Cuenta
    SET nombreUsuario = LOWER(REPLACE(NEW.nombre, ' ', ''))
    WHERE id_Empleado = NEW.id AND tipo = 0;

    UPDATE Cuenta
    SET nombreUsuario = 'A' || LOWER(REPLACE(NEW.nombre, ' ', ''))
    WHERE id_Empleado = NEW.id AND tipo = 1;
  END;
''');

      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );

  Future<void> _crearSchema() async {
    final schemaSql = await rootBundle.loadString('sources/sql/schema.sql');
    final statements = schemaSql
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);
    for (final stmt in statements) {
      await customStatement(stmt);
    }
  }

  Future<void> _insertarSeed() async {
    final seedSql = await rootBundle.loadString('sources/sql/seed.sql');
    final statements = seedSql
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);
    for (final stmt in statements) {
      await customStatement(stmt);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'cherry.db'));
    return NativeDatabase(file);
  });
}