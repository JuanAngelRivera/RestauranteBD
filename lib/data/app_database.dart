import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'cherry.db'));
    return NativeDatabase(file);
  });
}