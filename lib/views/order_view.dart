import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/discount_list_tile_widget.dart';
import 'package:restaurante_base_de_datos/widgets/image_list_tile_widget.dart';
import 'package:restaurante_base_de_datos/widgets/order_list_tile_widget.dart';
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

  final List<int> descuentos = [
    10,
    20,
    30,
    40,
    50

  ];

  bool categoriaCargada = false;
  bool productoEnOrden = false;

  List<Map<String, dynamic>> pedido = [];

  void agregarPedido(String nombre, double precio) {
    setState(() {
      final index = pedido.indexWhere((item) => item["nombre"] == nombre);

      if (index != -1) {
        pedido[index]["cantidad"] += 1;

        pedido[index]["subtotal"] =
            pedido[index]["cantidad"] * pedido[index]["precio"];
      } else {
        pedido.add({
          "nombre": nombre,
          "precio": precio,
          "cantidad": 1,
          "subtotal": precio,
        });
      }
    });
  }

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
                        image: AssetImage(
                          "sources/images/fotosEmpleado/empleadoDelMes.png",
                        ),
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
                    flex: 1,
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
                            child: Scrollbar(
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
                          ),
                        ],
                      ),
                    ),
                  ),

                  //columna lista Productos
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text("Categoria.nombrexd", style: Styles.titleText),
                          Expanded(
                            child: ListView.builder(
                              itemCount: productos.length,
                              itemBuilder: (_, i) => ImageListTileWidget(
                                title: productos[i],
                                imagen: "",
                                precio: 10.0,
                                onAdd: agregarPedido,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //columna lista Orden
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text("Orden", style: Styles.titleText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text("Producto", style: Styles.baseText),
                              Text("Precio", style: Styles.baseText),
                              Text("Cantidad", style: Styles.baseText),
                              Text("Subtotal", style: Styles.baseText),
                              SizedBox(width: 50),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.32,
                            child: Scrollbar(
                              child: ListView.builder(
                                itemCount: pedido.length,
                                itemBuilder: (context, index) {
                                  final item = pedido[index];
                                  return OrderListTileWidget(
                                    nombreProducto: item["nombre"],
                                    precio: item["precio"],
                                    cantidad: item["cantidad"],
                                    subtotal: item["subtotal"],
                                    onCantidadChanged: (nuevaCantidad) {
                                      item["cantidad"] = nuevaCantidad;
                                      item["subtotal"] =
                                          nuevaCantidad * item["precio"];
                                      setState(() {});
                                    },
                                    onRemove: () {
                                      setState(() => pedido.removeAt(index));
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.32,
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Divider(),
                                Text(
                                  "Subtotal:",
                                  style: Styles.baseText,
                                ),
                                Text(
                                  "Descuentos:",
                                  style: Styles.baseText,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.12,
                                  child: Scrollbar(
                                    child: ListView.builder(
                                          itemCount: pedido.length,
                                          itemBuilder: (context, index){
                                            final item = pedido[index];
                                            return DiscountListTileWidget(
                                            nombre: item["nombre"], 
                                            descuento: 10, 
                                            subtotal: item["cantidad"] * item["precio"] * 10 / 100);
                                          }),
                                  ),
                                ),
                                Divider(),
                                Text(
                                  "Total:",
                                  style: Styles.baseText,
                                ),
                                ElevatedButton(
                                  style: Styles.buttonStyle,
                                  onPressed: () {},
                                  child: Text("Proceder"),
                                ),
                              ],
                            ),
                          ),
                        ],
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