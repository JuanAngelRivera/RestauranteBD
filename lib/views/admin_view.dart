import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/utils/dao_helper.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/cell_builder_widgets.dart';
import 'package:restaurante_base_de_datos/widgets/idle_screen_widget.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';
import 'package:restaurante_base_de_datos/widgets/table_screen_widget.dart';
import '../providers/admin_provider.dart';

class adminView extends ConsumerStatefulWidget {
  const adminView({super.key});

  @override
  ConsumerState<adminView> createState() => _adminViewState();
}

class _adminViewState extends ConsumerState<adminView> {
  late TableScreenWidget tabla;
  List<String> tablas = [];
  bool tablaCargada = false;

  @override
  void initState() {
    super.initState();
    cargarInfo();
  }

  @override
  Widget build(BuildContext context) {
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
                    Text("Cherry Café", style: Styles.titleText),
                    SizedBox(width: 30),
                    Text("NOMBRE DEL LOCAL", style: Styles.baseText),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      style: Styles.buttonStyle,
                      onPressed: cerrarSesion,
                      child: Text("Cerrar sesión", style: Styles.baseTextW),
                    ),
                    Image.asset("sources/images/loginImage.png", width: 50),
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
                          itemCount: tablas.length,
                          itemBuilder: (_, i) => ListTile(
                            style: ListTileStyle.drawer,
                            title: Text(tablas[i]),
                            onTap: () => {
                              setState(() {
                                tablaCargada = true;
                              }),
                              //despliegue de las tablas
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.all(10),
                      colorBase: Styles.fondoClaro,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                        child: tablaCargada == true
                            ? tabla
                            : IdleScreenWidget(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cargarInfo() async {
    final adminDao = ref.read(adminDaoProvider);
    final tablas = await adminDao.obtenerNombresTablas();
    setState(() {
      this.tablas = tablas;
    });
  }

  void cargarTabla(String tablaNombre) async {
    final adminDao = ref.read(adminDaoProvider);
    final cellBuilderHelper = CellBuilderWidgets();

    // Columnas
    final columnas = await adminDao.obtenerColumnasTabla(tablaNombre);
    final nombresColumnas = columnas.map((c) => c['name'] as String).toList();

    // Registros
    final registros = await adminDao.obtenerRegistros(tablaNombre);

    setState(() {
      tablaCargada = true;
      this.tabla = TableScreenWidget(
        titulo: tablaNombre,
        columnas: nombresColumnas,
        dataStream: Stream.fromFuture(Future.value(registros)),
        cellBuilder: (registro) =>
            cellBuilderHelper.obtenerCellBuilder(tablaNombre, registro),
        columnasPorPagina: nombresColumnas.length,
      );
    });
  }

  void cerrarSesion() {
    //cerrar conexion con BD antes de retirarse de la vista
    Navigator.pop(context);
  }
}
