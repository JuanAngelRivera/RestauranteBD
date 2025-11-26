import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class orderView extends StatefulWidget {
  const orderView({super.key});

  @override
  State<orderView> createState() => _orderViewState();
}

class _orderViewState extends State<orderView> {
  final _searchKey = GlobalKey<FormState>();
  final List<String> categorias = [
    "cat1",
    "cat2",
    "cat3",
    "cat4",
    "seccion Gay",
  ];

  final List<String> productos = [
    "producto1",
    "producto2",
    "producto3",
    "producto4",
    "producto5",
  ];

  bool categoriaCargada = false;
  bool productoEnOrden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.fondoOscuro,
      body: PanelWidget(
        padding: EdgeInsets.all(10),
        colorBase: Styles.fondoOscuro,
        child: Column(
          children: [
            PanelWidget(
              colorBase: Styles.fondoClaro,
              padding: EdgeInsets.all(10),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Cherry Café", style: Styles.titleText),
                  SizedBox(width: 30),
                  Text("NOMBRE DEL LOCAL", style: Styles.baseText),
                  Expanded(child: SizedBox()),
                  Image.asset("sources/images/loginImage.png", width: 50),
                ],
              ),
            ),
            PanelWidget(
              colorBase: Styles.fondoClaro,
              padding: EdgeInsets.all(10),
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("sources/images/fotoSEmpleado/empleadoDelMes.png"),
                      ),
                    ),
                  ),
                  Text("id Empleado", style: Styles.baseText),
                  Text("Nombre empleado", style: Styles.baseText),
                  Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {},
                    style: Styles.buttonStyle,
                    child: Text(
                      "Historial de ordenes",
                      style: Styles.baseTextW,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //cerrar conexion
                      Navigator.pop(context);
                    },
                    style: Styles.buttonStyle,
                    child: Text("Cerrar sesión", style: Styles.baseTextW),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  //columna Categorias
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.all(10),
                      colorBase: Styles.fondoClaro,
                      child: Column(
                        children: [
                          Form(
                            key: _searchKey,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: TextEditingController(),
                                    style: Styles.baseText,
                                    decoration: Styles.createInputDecoration(
                                      "Buscar...",
                                      Colors.white,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Ingresa el nombre del producto";
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      busqueda();
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    busqueda();
                                  },
                                  child: Image.asset(
                                    "sources/images/loginImage.png",
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Categorias", style: Styles.titleText),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: categorias.length,
                              itemBuilder: (_, i) => ListTile(
                                style: ListTileStyle.drawer,
                                title: Text(
                                  categorias[i],
                                  style: Styles.titleText,
                                ),
                                onTap: () => {
                                  setState(() {
                                    categoriaCargada = true;
                                  }),
                                  //despliegue de las tablas
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //columna lista Productos
                  Expanded(
                    flex: 1,
                    child: PanelWidget(
                      child: ListView.builder(
                        itemCount: productos.length,
                        itemBuilder: (_, i) => ListTile(
                          style: ListTileStyle.drawer,
                          title: Text(productos[i], style: Styles.baseText),
                          onTap: () => {
                            setState(() {
                              productoEnOrden = true;
                            }),
                            //despliegue de las tablas
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void busqueda() {
    print("Soy gay");
  }
}