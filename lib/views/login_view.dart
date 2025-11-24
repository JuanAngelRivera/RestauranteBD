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
  final _formKey = GlobalKey<FormState>();
  bool cargando = false;

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
                  padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
                  colorBorde: Styles.contraste,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Form(
                      key: _formKey,
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
                          SizedBox(height: 20,),
                          
                          TextFormField(
                            style: Styles.baseText,
                            controller: conUser,
                            keyboardType: TextInputType.emailAddress,
                            decoration: Styles.createInputDecoration("Usuario", Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Ingresa un usuario';
                              }
                              else if (!value.startsWith("A")){
                                return 'Usuario incorrecto';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value){
                              verificacion();
                            },
                          ),
                          TextFormField(
                            style: Styles.baseText,
                            controller: conPassword,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: Styles.createInputDecoration("Contraseña", Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Ingresa la contraseña';
                              }
                              else if (!value.startsWith("A")){
                                return 'Contraseña incorrecta';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value){
                              verificacion();
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: verificacion,
                              style: Styles.buttonStyle,
                              child: Text("Ingresar", style: Styles.baseTextW),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                cargando == true ? Image.asset("sources/images/loginImage.png", width: 100,) : SizedBox(height: 100),
              ],
            ),

          ),
        ),
      ),
    );
  }

  void verificacion(){
    setState(() {
      cargando = true;
    });

    if (_formKey.currentState!.validate()){

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Formulario valido... Redirigiendo")));
          Future.delayed(Duration(seconds: 3)).then((value){
            setState(() {
              cargando = false;
            });
            Navigator.pushNamed(context, "/admin");
          });
    }
    else{
        setState(() {
          cargando = false;
        });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Algo salió mal, revisa tu información")));
    }
  }
}