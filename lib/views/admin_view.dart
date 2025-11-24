import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class adminView extends StatefulWidget {
  const adminView({super.key});

  @override
  State<adminView> createState() => _adminViewState();
}

class _adminViewState extends State<adminView> {
  @override
  Widget build(BuildContext context) {
    final opciones = [
      "Productos",
      "Categorias",
      "Empleados",
      "MIAU"
    ];
    return Scaffold(
      backgroundColor: Styles.fondoOscuro,
      body: SizedBox.expand(
        child: PanelWidget(
          colorBase: Styles.fondoOscuro,
          padding: EdgeInsets.all(10),    
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PanelWidget(
                colorBase: Styles.fondoClaro,
                padding: EdgeInsets.all(10),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Cherry Café", style: Styles.titleText,),
                    SizedBox(width: 30,),
                    Text("NOMBRE DEL LOCAL", style: Styles.baseText,),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      style: Styles.buttonStyle,
                      onPressed: cerrarSesion, 
                      child: Text(
                        "Cerrar sesión",
                        style: Styles.baseTextW,)),
                    Image.asset("sources/images/loginImage.png", width: 50,)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PanelWidget(
                      padding: EdgeInsets.all(10),
                      colorBase: Styles.fondoClaro,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                        child: ListView.builder(
                          itemCount: opciones.length,
                          itemBuilder: (_, i) => ListTile(
                            style: ListTileStyle.drawer,
                            title: Text(opciones[i]),
                            onTap: () => {
                              //despliegue de las tablas
                              },
                          )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.all(10  ),
                      colorBase: Styles.fondoClaro,
                      child: Text("Hola")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void cerrarSesion(){
    //cerrar conexion con BD antes de retirarse de la vista
    Navigator.pop(context);
  }
}