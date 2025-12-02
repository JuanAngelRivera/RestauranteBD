import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/providers/login_provider.dart';
import '../providers/session_provider.dart';
import '../utils/styles.dart';
import '../widgets/panel_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController conUser = TextEditingController();
  final TextEditingController conPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool cargando = false;
  bool _loginError = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final loginDao = ref.read(loginDaoProvider);
    if (!await loginDao.existenCuentas()) {
      loginDao.crearAdministrador();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.fondoOscuro,
      body: SizedBox.expand(
        child: PanelWidget(
          colorBase: Styles.fondoOscuro,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PanelWidget(
                  colorBase: Styles.fondoClaro,
                  sombra: true,
                  padding: const EdgeInsets.all(20),
                  colorBorde: Styles.contraste,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Inicio de sesión", style: Styles.titleText),
                          const SizedBox(height: 20),
                          TextFormField(
                            style: Styles.baseText,
                            controller: conUser,
                            decoration: Styles.createInputDecoration(
                              "Usuario",
                              Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Ingresa un usuario';
                              return null;
                            },
                            onFieldSubmitted: (_) => _login(),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: Styles.baseText,
                            controller: conPassword,
                            obscureText: true,
                            decoration: Styles.createInputDecoration(
                              "Contraseña",
                              Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Ingresa la contraseña';
                              return null;
                            },
                            onFieldSubmitted: (_) => _login(),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: Styles.buttonStyle,
                              child: Text("Ingresar", style: Styles.baseTextW),
                            ),
                          ),
                          if (_loginError)
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                'Usuario o contraseña incorrectos',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                cargando
                    ? Image.asset("sources/images/loginImage.png", width: 100)
                    : const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    final loginDao = ref.read(loginDaoProvider);

    final valid = await loginDao.validarUsuario(
      conUser.text.trim(),
      conPassword.text.trim(),
    );

    setState(() {
      _loginError = !valid;
    });

    if (valid) {
      final empleado = await loginDao.obtenerEmpleado(conUser.text.trim());

      if (empleado == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Empleado no encontrado")));
        return;
      }

      ref
          .read(sessionProvider.notifier)
          .login(conUser.text.trim(), conPassword.text.trim());
      final cuenta = await loginDao.obtenerCuenta(conUser.text.trim());

      if (cuenta?.tipo == 0) {
        Navigator.pushNamed(context, "/order");
      } else {
        Navigator.pushNamed(context, "/admin");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario o contraseña incorrectos")),
      );
    }
  }
}