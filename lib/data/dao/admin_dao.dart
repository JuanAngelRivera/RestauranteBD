import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/database.dart';
part 'admin_dao.g.dart';

@DriftAccessor(
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
)
class AdminDao extends DatabaseAccessor<AppDatabase> with _$AdminDaoMixin {
  AdminDao(AppDatabase db) : super(db);

  Future<List<Map<String, dynamic>>> obtenerProductos() async {
    final query = select(productos).join([
      leftOuterJoin(categorias, categorias.id.equalsExp(productos.idCategoria)),
    ]);
    final result = await query.get();
    return result.map((row) {
      final p = row.readTable(productos);
      final c = row.readTableOrNull(categorias);
      return {
        'id': p.id,
        'nombre': p.nombre,
        'precio': p.precio,
        'categoria': c?.nombre,
        'foto': p.foto
      };
    }).toList();
  }

  Future<List<String>> obtenerNombresTablas() async {
    final result = await customSelect(
      "SELECT name FROM sqlite_master WHERE type='table';",
    ).get();
    return result.map((row) => row.data['name'] as String).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerColumnasTabla(
    String tableName,
  ) async {
    final result = await customSelect('PRAGMA table_info($tableName);').get();
    return result.map((row) => row.data).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerRegistros(
    String nombreTabla,
  ) async {
    switch (nombreTabla) {
      case 'Producto':
        return obtenerProductos();
      default:
        return [];
    }
  }
}
