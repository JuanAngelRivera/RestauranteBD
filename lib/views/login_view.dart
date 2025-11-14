import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  bool secreto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: panelWidget(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text("Iniciar sesión", style: Styles.titleText),
              ElevatedButton(onPressed: verificacion, child: Text("Ingresar")),
              Text(secreto == true ? "miau" : ""),
            ],
          ),
        ),
      ),
    );
  }
  void verificacion()
  {
    setState(() {
      secreto = !secreto;
    });
  }
}