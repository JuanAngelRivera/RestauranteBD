import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/database.dart';

part 'login_dao.g.dart';

@DriftAccessor(tables: [Cuentas, Empleados])
class LoginDao extends DatabaseAccessor<AppDatabase> with _$LoginDaoMixin {
  LoginDao(AppDatabase db) : super(db);

  Future<bool> existenCuentas() async {
    final query = await (select(cuentas).get());
    return query.isNotEmpty;
  }

  Future<bool> crearAdministrador() async {
    await (customStatement('''insert into Empleado (nombre) values
        ('admin');'''));
    await (customStatement(
      '''insert into Cuenta (id_Empleado, nombreUsuario, contraseña, tipo) values
        (1, 'ADMIN', 'ADMIN', 1);''',
    ));
    return true;
  }

  Future<bool> validarUsuario(String nombreUsuario, String password) async {
    final query =
        await (select(cuentas)..where(
              (c) =>
                  c.usuario.equals(nombreUsuario) &
                  (c.password.equals(password)),
            ))
            .getSingleOrNull();
    return query != null;
  }

  Future<Empleado?> obtenerEmpleado(String nombreUsuario) async {
    final query = select(cuentas).join([
      leftOuterJoin(empleados, empleados.id.equalsExp(cuentas.idEmpleado)),
    ])..where(cuentas.usuario.equals(nombreUsuario));

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    final empleadoData = row.readTableOrNull(empleados);
    if (empleadoData?.id == null) return null;
    return empleadoData;
  }

  Future<Cuenta?> obtenerCuenta(String nombreUsuario) async {
    final query = await (select(
      cuentas,
    )..where((c) => c.usuario.equals(nombreUsuario))).getSingleOrNull();

    return query;
  }
}
