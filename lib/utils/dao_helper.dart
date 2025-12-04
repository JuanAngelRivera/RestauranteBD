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
    final row = await (db.select(
      categorias,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
    return row?.nombre ?? 'Desconocido';
  }

  Future<String> nombreLocal(int id) async {
    final row = await (db.select(
      cherryLocals,
    )..where((cl) => cl.id.equals(id))).getSingleOrNull();
    return '${row?.nombre} (${row?.direccion})';
  }

  Future<List<Map<String, dynamic>>> productosPorCategoria(
    int idCategoria,
  ) async {
    final query = await (db.select(
      productos,
    )..where((producto) => producto.idCategoria.equals(idCategoria))).get();
    return query.map((row) {
      return {
        'id': row.id,
        'nombre': row.nombre,
        'idCategoria': row.idCategoria,
        'foto': row.foto,
        'precio': row.precio,
      };
    }).toList();
  }

  Future<Map<String, dynamic>?> obtenerDescuentos(int idProducto) async {
    final query =
        await (db.select(descuentos)
              ..where((descuento) => descuento.idProducto.equals(idProducto)))
            .getSingleOrNull();
    if (query == null) return null;
    return {'porcentaje': query.porcentaje};
  }

  Future<int> insertarOrden(
    int cherryLocal,
    double total,
    String fecha,
    int idEmpleado,
  ) async {
    return await db.customInsert(
      '''
        insert into Orden (id_CherryLocal, total, fechaRealizada, id_Empleado) values (?, ?, ?, ?);
      ''',
      variables: [
        Variable.withInt(cherryLocal),
        Variable.withReal(total),
        Variable.withString(fecha),
        Variable.withInt(idEmpleado),
      ],
    );
  }

  Future<int> insertarContiene(
    int cherryLocal,
    int idOrden,
    int idProducto,
    int cantidad,
  ) async {
    return await db.customInsert(
      '''
        insert into Contiene (id_CherryLocal, id_Orden, id_Producto, cantidad) values (?, ?, ?, ?);
      ''',
      variables: [
        Variable.withInt(cherryLocal),
        Variable.withInt(idOrden),
        Variable.withInt(idProducto),
        Variable.withInt(cantidad),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> ordenesPorEmpleado(int idEmpleado) async {
    final query = '''
    SELECT 
      o.id AS id,
      o.fechaRealizada AS fecha,
      o.id_empleado AS idEmpleado,
      o.total AS total,
      l.nombre AS nombreLocal
    FROM Orden o
    INNER JOIN CherryLocal l
      ON o.id_CherryLocal = l.id
    WHERE o.id_Empleado = ?
  ''';

    final result = await db
        .customSelect(
          query,
          variables: [Variable.withInt(idEmpleado)],
          readsFrom: {ordens, cherryLocals},
        )
        .get();

    return result.map((row) {
      return {
        'id': row.read<int>('id'),
        'fecha': formatearFecha(row.read<String>('fecha')),
        'idEmpleado': row.read<int>('idEmpleado'),
        'total': '\$${row.read<double>('total')}',
        'idLocal': row.read<String>('nombreLocal'),
      };
    }).toList();
  }

  String formatearFecha(String fechaIso) {
  try {
    final fecha = DateTime.parse(fechaIso);

    return "${fecha.day.toString().padLeft(2, '0')}/"
           "${fecha.month.toString().padLeft(2, '0')}/"
           "${fecha.year} "
           "${fecha.hour.toString().padLeft(2, '0')}:"
           "${fecha.minute.toString().padLeft(2, '0')}";
  } catch (e) {
    return fechaIso;
  }
}

Future<List<String>> ingredientesPorProducto(int idProducto) async {
  List<String> ingredientes = [];
    final query = '''
    SELECT 
      ing.cantidad as cantidad, ins.nombre as nombre, ins.descripcion as descripcionI, m.descripcion as descripcionM
    FROM Ingredientes ing
    LEFT OUTER JOIN Insumo ins
      ON ing.id_Insumo = ins.id
    LEFT OUTER JOIN Medida m
      ON ins.id_Medida = m.id
    WHERE ing.id_Producto = ?;
  ''';

    final result = await db
        .customSelect(
          query,
          variables: [Variable.withInt(idProducto)],
          readsFrom: {ingredients, insumos, medidas},
        )
        .get();
    print("Producto $idProducto");
    if (result.isEmpty) return ["No hay ingredientes que mostrar"];
    for (var row in result) {
      ingredientes.add('${row.read<String>("nombre")} (${row.read<String>("descripcionI")}) - ${row.read<int>("cantidad")} ${row.read<String>("descripcionM")}');
      print('${row.read<String>("nombre")} (${row.read<String>("descripcionI")}) - ${row.read<int>("cantidad")} ${row.read<String>("descripcionM")}');
    }
    return ingredientes;
  }

}
