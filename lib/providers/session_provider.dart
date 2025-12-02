import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import '../data/app_database.dart';
import '../data/dao/login_dao.dart';

class SessionState {
  final int? empleadoId;
  final String? nombreUsuario;
  final bool isAdmin;
  final String? foto;

  SessionState({
    this.empleadoId, 
    this.nombreUsuario, 
    this.isAdmin = false,
    this.foto});

  SessionState copyWith({
    int? empleadoId, 
    String? nombreUsuario, 
    bool? isAdmin,
    String? foto}) {
    return SessionState(
      empleadoId: empleadoId ?? this.empleadoId,
      nombreUsuario: nombreUsuario ?? this.nombreUsuario,
      isAdmin: isAdmin ?? this.isAdmin,
      foto: foto ?? this.foto
    );
  }

  bool get isLoggedIn => empleadoId != null;
}

class SessionNotifier extends StateNotifier<SessionState> {
  final AppDatabase db;
  late final LoginDao loginDao;

  SessionNotifier(this.db) : super(SessionState()) {
    loginDao = LoginDao(db);
    _initAdmin();
  }

  Future<void> _initAdmin() async {
    final exists = await loginDao.validarUsuario('ADMIN', 'ADMIN');
    if (!exists) {
      await loginDao.into(loginDao.cuentas).insert(
        CuentasCompanion(
          idEmpleado: const Value.absent(),
          usuario: const Value('ADMIN'),
          password: const Value('ADMIN'),
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  Future<bool> login(String nombreUsuario, String password) async {
    final valid = await loginDao.validarUsuario(nombreUsuario, password);
    if (!valid) return false;

    final cuenta = await loginDao.obtenerCuenta(nombreUsuario);
    final empleado = await loginDao.obtenerEmpleado(nombreUsuario);
    
    state = SessionState(
      empleadoId: empleado?.id,
      nombreUsuario: cuenta!.usuario,
      isAdmin: cuenta.tipo == 0 ? false : true,
      foto: empleado?.foto
    );
    return true;
  }

  void logout() {
    state = SessionState();
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  final db = ref.read(appDatabaseProvider);
  return SessionNotifier(db);
});