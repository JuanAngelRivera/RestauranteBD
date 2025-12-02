import 'package:drift/drift.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import '../data/tables/database.dart';

part 'dao_helper.g.dart';

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
class DaoHelper extends DatabaseAccessor<AppDatabase> with _$DaoHelperMixin {
  DaoHelper(AppDatabase db) : super(db);

  Future<String> nombreCategoria(int id) async { 
    final row = await (db.select(db.categorias)..where((c) => c.id.equals(id))).getSingleOrNull();
    return row?.nombre ?? 'Desconocido';
  }
}