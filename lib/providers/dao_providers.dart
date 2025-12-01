import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/app_database.dart';
import '../data/dao/daos.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final tablaErrorsDaoProvider = Provider((ref) {
  return TablaErrorsDao(ref.read(appDatabaseProvider));
});

final metodoPagosDaoProvider = Provider((ref) {
  return MetodoPagosDao(ref.read(appDatabaseProvider));
});

final cherryLocalsDaoProvider = Provider((ref) {
  return CherryLocalsDao(ref.read(appDatabaseProvider));
});

final rolsDaoProvider = Provider((ref) {
  return RolsDao(ref.read(appDatabaseProvider));
});

final turnosDaoProvider = Provider((ref) {
  return TurnosDao(ref.read(appDatabaseProvider));
});

final bonusesDaoProvider = Provider((ref) {
  return BonusesDao(ref.read(appDatabaseProvider));
});

final empleadosDaoProvider = Provider((ref) {
  return EmpleadosDao(ref.read(appDatabaseProvider));
});

final nominasDaoProvider = Provider((ref) {
  return NominasDao(ref.read(appDatabaseProvider));
});

final beneficiosDaoProvider = Provider((ref) {
  return BeneficiosDao(ref.read(appDatabaseProvider));
});

final cuentasDaoProvider = Provider((ref) {
  return CuentasDao(ref.read(appDatabaseProvider));
});

final ordenesDaoProvider = Provider((ref) {
  return OrdensDao(ref.read(appDatabaseProvider));
});

final pagosDaoProvider = Provider((ref) {
  return PagosDao(ref.read(appDatabaseProvider));
});

final categoriasDaoProvider = Provider((ref) {
  return CategoriasDao(ref.read(appDatabaseProvider));
});

final productosDaoProvider = Provider((ref) {
  return ProductosDao(ref.read(appDatabaseProvider));
});

final contienesDaoProvider = Provider((ref) {
  return ContienesDao(ref.read(appDatabaseProvider));
});

final descuentosDaoProvider = Provider((ref) {
  return DescuentosDao(ref.read(appDatabaseProvider));
});

final medidasDaoProvider = Provider((ref) {
  return MedidasDao(ref.read(appDatabaseProvider));
});

final proveedoresDaoProvider = Provider((ref) {
  return ProveedorsDao(ref.read(appDatabaseProvider));
});

final insumosDaoProvider = Provider((ref) {
  return InsumosDao(ref.read(appDatabaseProvider));
});

final ingredientsDaoProvider = Provider((ref) {
  return IngredientsDao(ref.read(appDatabaseProvider));
});

final contactosDaoProvider = Provider((ref) {
  return ContactosDao(ref.read(appDatabaseProvider));
});