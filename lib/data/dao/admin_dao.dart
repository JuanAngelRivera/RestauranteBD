import 'package:drift/drift.dart';
import 'package:restaurante_base_de_datos/data/dao/daos.dart';
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

  Future<List<Map<String, dynamic>>> obtenerCategorias() async {
    final result = await CategoriasDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'nombre': row.nombre,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerBonus() async {
    final result = await BonusesDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'valor': row.valor,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerContacto() async {
    final query = select(contactos).join([
      leftOuterJoin(proveedors, proveedors.id.equalsExp(contactos.idProveedor)),
    ]);
    final result = await query.get();
    return result.map((row) {
      final c = row.readTable(contactos);
      final p = row.readTableOrNull(proveedors);
      return {
        'id': p?.descripcion,
        'numero': c.numero,
        'nombre': c.nombre,
        'telefono': c.telefono,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerCuenta() async {
    final query = select(cuentas).join([
      leftOuterJoin(empleados, empleados.id.equalsExp(cuentas.idEmpleado)),
    ]);
    final result = await query.get();
    return result.map((row) {
      final c = row.readTable(cuentas);
      final e = row.readTableOrNull(empleados);
      return {
        'id': e?.nombre,
        'usuario': c.usuario,
        'contraseña': c.password,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerDescuento() async {
    final query = select(descuentos).join([
      leftOuterJoin(productos, productos.id.equalsExp(descuentos.idProducto)),
    ]);
    final result = await query.get();
    return result.map((row) {
      final d = row.readTable(descuentos);
      final p = row.readTableOrNull(productos);
      return {
        'id': d.id,
        'descripcion': d.descripcion,
        'porcentaje': d.porcentaje,
        'producto': p?.nombre
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerEmpleado() async {
    final query = select(empleados).join([
      leftOuterJoin(rols, rols.id.equalsExp(empleados.idRol)),
      innerJoin(turnos, turnos.id.equalsExp(empleados.idTurno))
    ]);
    final result = await query.get();
    return result.map((row) {
      final e = row.readTable(empleados);
      final r = row.readTableOrNull(rols);
      final t = row.readTableOrNull(turnos);
      return {
        'id': e.id,
        'nombre': e.nombre,
        'telefono': e.telefono,
        'curp': e.curp,
        'rfc': e.rfc,
        'fechaIngreso': e.fechaIngreso,
        'nss': e.nss,
        'foto': e.foto,
        'rol': r?.descripcion,
        'turno': t?.descripcion
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerInsumo() async {
    final query = select(insumos).join([
      leftOuterJoin(medidas, medidas.id.equalsExp(insumos.id)),
    ]);
    final result = await query.get();
    return result.map((row) {
      final i = row.readTable(insumos);
      final m = row.readTableOrNull(medidas);
      return {
        'id': i.id,
        'nombre': i.nombre,
        'costo': i.costo,
        'descripcion': i.descripcion,
        'medida': m?.descripcion,
        'enAlmacen': i.descripcion
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerMedida() async {
    final result = await MedidasDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerMetodoPago() async {
    final result = await MetodoPagosDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerProveedor() async {
    final result = await ProveedorsDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'nombre': row.nombre,
        'direccion': row.direccion,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerRol() async {
    final result = await RolsDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'descripcion': row.descripcion,
        'sueldo': row.sueldo
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> obtenerTurno() async {
    final result = await TurnosDao(db).getAll();
    return result.map((row) {
      return {
        'id': row.id,
        'horaInicio': row.horaInicio,
        'horarioFin': row.horaFin,
        'descripcion': row.descripcion,
      };
    }).toList();
  }

  Future<List<String>> obtenerNombresTablas() async {
  const tablasExcluidas = {
    "sqlite_sequence",
    "TablaError",
    "CherryLocal",
    "Nomina",
    "Pago",
    "Contiene",
    "Ingredientes",
    "Orden",
    "Beneficios"
  };
  
  final result = await customSelect(
    "SELECT name FROM sqlite_master WHERE type='table' order by 1 asc;",
  ).get();

  return result
      .map((row) => row.data['name'] as String)
      .where((nombre) => !tablasExcluidas.contains(nombre))
      .toList();
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
      case 'Categoria':
        return obtenerCategorias();
      case 'Bonus':
        return obtenerBonus();
      case 'Contacto':
        return obtenerContacto();
      case 'Cuenta':
        return obtenerCuenta();
      case 'Descuento':
        return obtenerDescuento();
      case 'Empleado':
        return obtenerEmpleado();
      case 'Insumo':
        return obtenerInsumo();
      case 'Medida':
        return obtenerMedida();
      case 'MetodoPago':
        return obtenerMetodoPago();
      case 'Proveedor':
        return obtenerProveedor();
      case 'Rol':
        return obtenerRol();
      case 'Turno':
        return obtenerTurno();
      default:
        return [];
    }
  }
}
