import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SizedBox.expand(
        child: PanelWidget(
          colorBase: Colors.grey.shade300,
          child: Stack(
            children: [
              Positioned.fill(
                right: 8,
                child: 
              Align(
                alignment: AlignmentGeometry.centerRight,
                heightFactor: MediaQuery.of(context).size.height * .8,
                widthFactor: MediaQuery.of(context).size.width * .8,
                child: Image.asset(
                  "sources/images/loginImage.png"),
              )
                ),
                
              Center(
                child: PanelWidget(
                  transparencia: 120,
                  colorBase: Colors.grey.shade500,
                  padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        Text(
                          "Inicio de sesión",
                          style: Styles.titleText,
                          textAlign: TextAlign.center,
                        ),
                        TextFormField(
                          
                          style: Styles.baseText,
                          controller: conUser,
                          keyboardType: TextInputType.emailAddress,
                          decoration: Styles.createInputDecoration("Usuario"),
                        ),
                        TextFormField(
                          style: Styles.baseText,
                          controller: conPassword,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: Styles.createInputDecoration("Contraseña"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: Styles.buttonStyle,
                            child: Text("Ingresar", style: Styles.buttonTextStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}