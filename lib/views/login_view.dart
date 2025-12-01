import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                            decoration: Styles.createInputDecoration("Usuario", Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Ingresa un usuario';
                              return null;
                            },
                            onFieldSubmitted: (_) => _login(),
                          ),
                          TextFormField(
                            style: Styles.baseText,
                            controller: conPassword,
                            obscureText: true,
                            decoration: Styles.createInputDecoration("Contraseña", Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Ingresa la contraseña';
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
    if (!_formKey.currentState!.validate()) return;

    setState(() => cargando = true);

    final sessionNotifier = ref.read(sessionProvider.notifier);
    final success = await sessionNotifier.login(conUser.text.trim(), conPassword.text.trim());

    setState(() => cargando = false);

    if (success) {
      setState(() => _loginError = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login exitoso! Redirigiendo...")));
      Navigator.pushReplacementNamed(context, "/order");
    } else {
      setState(() => _loginError = true);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Usuario o contraseña incorrectos")));
    }
  }
}