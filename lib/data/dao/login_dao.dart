import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/database.dart';

part 'login_dao.g.dart';

@DriftAccessor(tables: [Cuentas, Empleados])
class LoginDao extends DatabaseAccessor<AppDatabase> with _$LoginDaoMixin {
  LoginDao(AppDatabase db) : super(db);

  Future<bool> validarUsuario(String nombreUsuario, String password) async {
    final query = await (select(cuentas)
          ..where((c) => c.usuario.equals(nombreUsuario) &
              (c.password.equals(password))))
        .getSingleOrNull();
    return query != null;
  }

  Future<Empleado?> obtenerEmpleado(String nombreUsuario) async {
    final query = select(cuentas).join([
      leftOuterJoin(empleados, empleados.id.equalsExp(cuentas.idEmpleado)),
    ])
      ..where(cuentas.usuario.equals(nombreUsuario));

    final row = await query.getSingleOrNull();
if (row == null) return null;

final empleadoData = row.readTableOrNull(empleados);
if (empleadoData?.id == null) return null;
return empleadoData;

  }
}