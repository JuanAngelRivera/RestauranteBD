import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/dao/admin_dao.dart';
import 'package:restaurante_base_de_datos/data/dao/daos.dart';
import 'package:restaurante_base_de_datos/providers/admin_provider.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/providers/session_provider.dart';
import 'package:restaurante_base_de_datos/utils/dao_helper.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/image_list_tile_widget.dart';
import 'package:restaurante_base_de_datos/widgets/order_list_tile_widget.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class orderView extends ConsumerStatefulWidget {
  const orderView({super.key});

  @override
  ConsumerState<orderView> createState() => _orderViewState();
}

class _orderViewState extends ConsumerState<orderView> {
  final _searchKey = GlobalKey<FormState>();
  String local = '';
  late List<Map<String, dynamic>> categorias = [];
  late List<Map<String, dynamic>> productos = [];
  late List<Map<String, dynamic>> descuentos = [];
  int idCategoriaActual = 1;
  String nombreCategoriaActual = '';
  bool productoEnOrden = false;
  bool categoriaCargada = false;
  late CategoriasDao categoriaDao;
  late DaoHelper daoHelper;
  late AdminDao adminDao;
  SessionState empleado = SessionState();
  late List<Map<int, int>> descuentosActivos = [];
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    categoriaDao = ref.read(categoriasDaoProvider);
    daoHelper = ref.read(daoHelperProvider);
    adminDao = ref.read(adminDaoProvider);
    final sessionState = ref.read(sessionProvider);
    empleado = sessionState.copyWith();
    idCategoriaActual = 1;

    local = await daoHelper.nombreLocal(1);
    categorias = await adminDao.obtenerCategorias();
    productos = await daoHelper.productosPorCategoria(idCategoriaActual);
    descuentos = await adminDao.obtenerDescuento();

    nombreCategoria(idCategoriaActual);
    setState(() {});
  }

  List<Map<String, dynamic>> pedido = [];

  void agregarPedido(String nombre, double precio, int id) {
    int descuento = 0;
    final descuentoItem = descuentos.firstWhere(
      (d) => d["id_Producto"] == id,
      orElse: () => {},
    );
    if (descuentoItem.isNotEmpty) {
      descuento = descuentoItem["porcentaje"];
    }

    setState(() {
      final index = pedido.indexWhere((item) => item["id"] == id);

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
          "id": id,
          "descuento": descuento,
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
                  Text(local, style: Styles.baseText),
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
                          empleado.foto != null
                              ? "sources/images/fotosEmpleado/${empleado.foto}"
                              : "sources/images/fotosEmpleado/empleadoDelMes.png",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Bienvenido: ${empleado.nombreUsuario!}',
                    style: Styles.baseText,
                  ),
                  Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/historial");
                    },
                    style: Styles.buttonStyle,
                    child: Text(
                      "Historial de ordenes",
                      style: Styles.baseTextW,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
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
                                    categorias[i]["nombre"],
                                    style: Styles.titleText,
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      actualizarProductos(categorias[i]["id"]);
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
                          Text(nombreCategoriaActual, style: Styles.titleText),
                          Expanded(
                            child: ListView.builder(
                              itemCount: productos.length,
                              itemBuilder: (_, i) => ImageListTileWidget(
                                title: productos[i]["nombre"],
                                imagen: productos[i]["foto"],
                                precio: productos[i]["precio"],
                                id: productos[i]["id"],
                                onAdd: (nombre, precio, id) {
                                  agregarPedido(
                                    nombre,
                                    precio,
                                    id,
                                  );
                                },
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
                        bottom: 10,
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
                          Expanded(
                            child: SizedBox(
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
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.32,
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Subtotal:", style: Styles.baseText),
                                    Text(
                                      "\$${calcularSubtotal().toStringAsFixed(2)}",
                                      style: Styles.baseText,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Descuentos:", style: Styles.baseText),
                                    Text(
                                      "-\$${calcularDescuentos().toStringAsFixed(2)}",
                                      style: Styles.baseText,
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total:", style: Styles.baseText),
                                    Text(
                                      "\$${calcularTotal().toStringAsFixed(2)}",
                                      style: Styles.baseText,
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: Styles.buttonStyle,
                                  onPressed: () async {
                                    await registrarOrden();
                                  },
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

  void nombreCategoria(int id) async {
    final query = await categoriaDao.getById(id);
    nombreCategoriaActual = query?.nombre! ?? '';
  }

  void actualizarProductos(int idCategoria) async {
    nombreCategoria(idCategoria);
    final query = await daoHelper.productosPorCategoria(idCategoria);
    productos = query;
  }

  void busqueda() {}

  double calcularSubtotal() {
    return pedido.fold(
      0,
      (sum, item) => sum + (item["precio"] * item["cantidad"]),
    );
  }

  double calcularDescuentos() {
    return pedido.fold(
      0,
      (sum, item) =>
          sum + (item["precio"] * item["cantidad"] * item["descuento"] / 100),
    );
  }

  double calcularTotal() {
    return calcularSubtotal() - calcularDescuentos();
  }

  Future<void> registrarOrden() async {
  if (pedido.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        "No hay productos en la orden")),
    );
    return;
  }

  final total = calcularTotal();
  final idEmpleado = empleado.empleadoId!;
  final fecha = DateTime.now().toIso8601String();

  try {
    final idOrden = await daoHelper.insertarOrden(1, total, fecha, idEmpleado);
    
    for (final item in pedido) {
      await daoHelper.insertarContiene(1, idOrden, item["id"], item["cantidad"]);
    }

    setState(() {
      pedido.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Orden registrada correctamente")),
    );
  } catch (e) {
    print("Error registrando orden: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Error al registrar la orden")),
    );
  }
}

}
