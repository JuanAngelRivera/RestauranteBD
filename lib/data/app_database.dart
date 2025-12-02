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
  ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          final schemaSql =
              await rootBundle.loadString('sources/sql/schema.sql');

          for (final stmt in schemaSql.split(';')) {
            final trimmed = stmt.trim();
            if (trimmed.isNotEmpty) {
              await customStatement(trimmed);
            }
          }

          final seedSql =
              await rootBundle.loadString('sources/sql/seed.sql');

          for (final stmt in seedSql.split(';')) {
            final trimmed = stmt.trim();
            if (trimmed.isNotEmpty) {
              await customStatement(trimmed);
            }
          }
        },
      );
}

LazyDatabase _openConnection() {
  print("abriendo conexion");
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'cherry.db'));
    print("Ubicación de la base de datos: ${file.path}");
    return NativeDatabase(file);
  });
}