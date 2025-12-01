import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/database.dart';

part 'daos.g.dart';

@DriftAccessor(tables: [TablaErrors])
class TablaErrorsDao extends DatabaseAccessor<AppDatabase>
    with _$TablaErrorsDaoMixin {
  TablaErrorsDao(super.db);

  Future<List<TablaError>> getAll() => select(tablaErrors).get();

  Future<TablaError?> getById(String id) =>
      (select(tablaErrors)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(TablaErrorsCompanion entity) =>
      into(tablaErrors).insert(entity);

  Future<bool> updateOne(TablaError entity) =>
      update(tablaErrors).replace(entity);

  Future<int> deleteById(String id) =>
      (delete(tablaErrors)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [MetodoPagos])
class MetodoPagosDao extends DatabaseAccessor<AppDatabase>
    with _$MetodoPagosDaoMixin {
  MetodoPagosDao(super.db);

  Future<List<MetodoPago>> getAll() => select(metodoPagos).get();

  Future<MetodoPago?> getById(int id) =>
      (select(metodoPagos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(MetodoPagosCompanion entity) =>
      into(metodoPagos).insert(entity);

  Future<bool> updateOne(MetodoPago entity) =>
      update(metodoPagos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(metodoPagos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [CherryLocals])
class CherryLocalsDao extends DatabaseAccessor<AppDatabase>
    with _$CherryLocalsDaoMixin {
  CherryLocalsDao(super.db);

  Future<List<CherryLocal>> getAll() => select(cherryLocals).get();

  Future<CherryLocal?> getById(int id) =>
      (select(cherryLocals)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(CherryLocalsCompanion entity) =>
      into(cherryLocals).insert(entity);

  Future<bool> updateOne(CherryLocal entity) =>
      update(cherryLocals).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(cherryLocals)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Rols])
class RolsDao extends DatabaseAccessor<AppDatabase> with _$RolsDaoMixin {
  RolsDao(super.db);

  Future<List<Rol>> getAll() => select(rols).get();

  Future<Rol?> getById(int id) =>
      (select(rols)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(RolsCompanion entity) =>
      into(rols).insert(entity);

  Future<bool> updateOne(Rol entity) => update(rols).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(rols)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Turnos])
class TurnosDao extends DatabaseAccessor<AppDatabase>
    with _$TurnosDaoMixin {
  TurnosDao(super.db);

  Future<List<Turno>> getAll() => select(turnos).get();

  Future<Turno?> getById(int id) =>
      (select(turnos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(TurnosCompanion entity) =>
      into(turnos).insert(entity);

  Future<bool> updateOne(Turno entity) => update(turnos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(turnos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Bonuses])
class BonusesDao extends DatabaseAccessor<AppDatabase>
    with _$BonusesDaoMixin {
  BonusesDao(super.db);

  Future<List<Bonuse>> getAll() => select(bonuses).get();

  Future<Bonuse?> getById(int id) =>
      (select(bonuses)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(BonusesCompanion entity) =>
      into(bonuses).insert(entity);

  Future<bool> updateOne(Bonuse entity) =>
      update(bonuses).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(bonuses)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Empleados])
class EmpleadosDao extends DatabaseAccessor<AppDatabase>
    with _$EmpleadosDaoMixin {
  EmpleadosDao(super.db);

  Future<List<Empleado>> getAll() => select(empleados).get();

  Future<Empleado?> getById(int id) =>
      (select(empleados)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(EmpleadosCompanion entity) =>
      into(empleados).insert(entity);

  Future<bool> updateOne(Empleado entity) =>
      update(empleados).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(empleados)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Nominas])
class NominasDao extends DatabaseAccessor<AppDatabase>
    with _$NominasDaoMixin {
  NominasDao(super.db);

  Future<List<Nomina>> getAll() => select(nominas).get();

  Future<Nomina?> getByKey(int idEmpleado, String fechaPago) {
    return (select(nominas)
          ..where((t) =>
              t.idEmpleado.equals(idEmpleado) &
              t.fechaPago.equals(fechaPago)))
        .getSingleOrNull();
  }

  Future<int> insertOne(NominasCompanion entity) =>
      into(nominas).insert(entity);

  Future<bool> updateOne(Nomina entity) =>
      update(nominas).replace(entity);

  Future<int> deleteByKey(int idEmpleado, String fechaPago) =>
      (delete(nominas)
            ..where((t) =>
                t.idEmpleado.equals(idEmpleado) &
                t.fechaPago.equals(fechaPago)))
          .go();
}

@DriftAccessor(tables: [Beneficios])
class BeneficiosDao extends DatabaseAccessor<AppDatabase>
    with _$BeneficiosDaoMixin {
  BeneficiosDao(super.db);

  Future<List<Beneficio>> getAll() => select(beneficios).get();

  Future<Beneficio?> getByKey(int idEmpleado, String fechaPago, int idBonus) {
    return (select(beneficios)
          ..where((t) =>
              t.idEmpleado.equals(idEmpleado) &
              t.fechaPagoNomina.equals(fechaPago) &
              t.idBonus.equals(idBonus)))
        .getSingleOrNull();
  }

  Future<int> insertOne(BeneficiosCompanion entity) =>
      into(beneficios).insert(entity);

  Future<bool> updateOne(Beneficio entity) =>
      update(beneficios).replace(entity);

  Future<int> deleteByKey(int idEmpleado, String fechaPago, int idBonus) =>
      (delete(beneficios)
            ..where((t) =>
                t.idEmpleado.equals(idEmpleado) &
                t.fechaPagoNomina.equals(fechaPago) &
                t.idBonus.equals(idBonus)))
          .go();
}

@DriftAccessor(tables: [Cuentas])
class CuentasDao extends DatabaseAccessor<AppDatabase>
    with _$CuentasDaoMixin {
  CuentasDao(super.db);

  Future<List<Cuenta>> getAll() => select(cuentas).get();

  Future<Cuenta?> getByKey(int idEmpleado, String nombreUsuario) {
    return (select(cuentas)
          ..where((t) =>
              t.idEmpleado.equals(idEmpleado) &
              t.nombreUsuario.equals(nombreUsuario)))
        .getSingleOrNull();
  }

  Future<int> insertOne(CuentasCompanion entity) =>
      into(cuentas).insert(entity);

  Future<bool> updateOne(Cuenta entity) =>
      update(cuentas).replace(entity);

  Future<int> deleteByKey(int idEmpleado, String nombreUsuario) =>
      (delete(cuentas)
            ..where((t) =>
                t.idEmpleado.equals(idEmpleado) &
                t.nombreUsuario.equals(nombreUsuario)))
          .go();
}

@DriftAccessor(tables: [Ordens])
class OrdensDao extends DatabaseAccessor<AppDatabase>
    with _$OrdensDaoMixin {
  OrdensDao(super.db);

  Future<List<Orden>> getAll() => select(ordens).get();

  Future<Orden?> getById(int id) =>
      (select(ordens)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(OrdensCompanion entity) =>
      into(ordens).insert(entity);

  Future<bool> updateOne(Orden entity) =>
      update(ordens).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(ordens)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Pagos])
class PagosDao extends DatabaseAccessor<AppDatabase>
    with _$PagosDaoMixin {
  PagosDao(super.db);

  Future<List<Pago>> getAll() => select(pagos).get();

  Future<Pago?> getById(int id) =>
      (select(pagos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(PagosCompanion entity) =>
      into(pagos).insert(entity);

  Future<bool> updateOne(Pago entity) =>
      update(pagos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(pagos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Categorias])
class CategoriasDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriasDaoMixin {
  CategoriasDao(super.db);

  Future<List<Categoria>> getAll() => select(categorias).get();

  Future<Categoria?> getById(int id) =>
      (select(categorias)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(CategoriasCompanion entity) =>
      into(categorias).insert(entity);

  Future<bool> updateOne(Categoria entity) =>
      update(categorias).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(categorias)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Productos])
class ProductosDao extends DatabaseAccessor<AppDatabase>
    with _$ProductosDaoMixin {
  ProductosDao(super.db);

  Future<List<Producto>> getAll() => select(productos).get();

  Future<Producto?> getById(int id) =>
      (select(productos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(ProductosCompanion entity) =>
      into(productos).insert(entity);

  Future<bool> updateOne(Producto entity) =>
      update(productos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(productos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Contienes])
class ContienesDao extends DatabaseAccessor<AppDatabase>
    with _$ContienesDaoMixin {
  ContienesDao(super.db);

  Future<List<Contiene>> getAll() => select(contienes).get();

  Future<Contiene?> getByKey(int idOrden, int idCherryLocal, int idProducto) {
    return (select(contienes)
          ..where((t) =>
              t.idOrden.equals(idOrden) &
              t.idCherryLocal.equals(idCherryLocal) &
              t.idProducto.equals(idProducto)))
        .getSingleOrNull();
  }

  Future<int> insertOne(ContienesCompanion entity) =>
      into(contienes).insert(entity);

  Future<bool> updateOne(Contiene entity) =>
      update(contienes).replace(entity);

  Future<int> deleteByKey(int idOrden, int idCherryLocal, int idProducto) =>
      (delete(contienes)
            ..where((t) =>
                t.idOrden.equals(idOrden) &
                t.idCherryLocal.equals(idCherryLocal) &
                t.idProducto.equals(idProducto)))
          .go();
}

@DriftAccessor(tables: [Descuentos])
class DescuentosDao extends DatabaseAccessor<AppDatabase>
    with _$DescuentosDaoMixin {
  DescuentosDao(super.db);

  Future<List<Descuento>> getAll() => select(descuentos).get();

  Future<Descuento?> getById(int id) =>
      (select(descuentos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(DescuentosCompanion entity) =>
      into(descuentos).insert(entity);

  Future<bool> updateOne(Descuento entity) =>
      update(descuentos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(descuentos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Medidas])
class MedidasDao extends DatabaseAccessor<AppDatabase>
    with _$MedidasDaoMixin {
  MedidasDao(super.db);

  Future<List<Medida>> getAll() => select(medidas).get();

  Future<Medida?> getById(int id) =>
      (select(medidas)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(MedidasCompanion entity) =>
      into(medidas).insert(entity);

  Future<bool> updateOne(Medida entity) =>
      update(medidas).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(medidas)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Proveedors])
class ProveedorsDao extends DatabaseAccessor<AppDatabase>
    with _$ProveedorsDaoMixin {
  ProveedorsDao(super.db);

  Future<List<Proveedor>> getAll() => select(proveedors).get();

  Future<Proveedor?> getById(int id) =>
      (select(proveedors)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(ProveedorsCompanion entity) =>
      into(proveedors).insert(entity);

  Future<bool> updateOne(Proveedor entity) =>
      update(proveedors).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(proveedors)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Insumos])
class InsumosDao extends DatabaseAccessor<AppDatabase>
    with _$InsumosDaoMixin {
  InsumosDao(super.db);

  Future<List<Insumo>> getAll() => select(insumos).get();

  Future<Insumo?> getById(int id) =>
      (select(insumos)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertOne(InsumosCompanion entity) =>
      into(insumos).insert(entity);

  Future<bool> updateOne(Insumo entity) =>
      update(insumos).replace(entity);

  Future<int> deleteById(int id) =>
      (delete(insumos)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Ingredients])
class IngredientsDao extends DatabaseAccessor<AppDatabase>
    with _$IngredientsDaoMixin {
  IngredientsDao(super.db);

  Future<List<Ingredient>> getAll() => select(ingredients).get();

  Future<Ingredient?> getByKey(int idProducto, int idInsumo) {
    return (select(ingredients)
          ..where((t) =>
              t.idProducto.equals(idProducto) &
              t.idInsumo.equals(idInsumo)))
        .getSingleOrNull();
  }

  Future<int> insertOne(IngredientsCompanion entity) =>
      into(ingredients).insert(entity);

  Future<bool> updateOne(Ingredient entity) =>
      update(ingredients).replace(entity);

  Future<int> deleteByKey(int idProducto, int idInsumo) =>
      (delete(ingredients)
            ..where((t) =>
                t.idProducto.equals(idProducto) &
                t.idInsumo.equals(idInsumo)))
          .go();
}

@DriftAccessor(tables: [Contactos])
class ContactosDao extends DatabaseAccessor<AppDatabase>
    with _$ContactosDaoMixin {
  ContactosDao(super.db);

  Future<List<Contacto>> getAll() => select(contactos).get();

  Future<Contacto?> getByKey(int idProveedor, int numero) {
    return (select(contactos)
          ..where((t) =>
              t.idProveedor.equals(idProveedor) &
              t.numero.equals(numero)))
        .getSingleOrNull();
  }

  Future<int> insertOne(ContactosCompanion entity) =>
      into(contactos).insert(entity);

  Future<bool> updateOne(Contacto entity) =>
      update(contactos).replace(entity);

  Future<int> deleteByKey(int idProveedor, int numero) =>
      (delete(contactos)
            ..where((t) =>
                t.idProveedor.equals(idProveedor) &
                t.numero.equals(numero)))
          .go();
}