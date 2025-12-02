import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/cell_builder_widgets.dart';
import 'package:restaurante_base_de_datos/widgets/formulario_generico.dart';
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
  TableScreenWidget? tabla;
  List<String> tablas = [];
  bool tablaCargada = false;
  String nombreLocal = "";
  late AppDatabase db;

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
                    Text(nombreLocal, style: Styles.baseText),
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      style: Styles.buttonStyle,
                      onPressed: cerrarSesion,
                      child: Text("Cerrar sesión", style: Styles.baseTextW),
                    ),
                    TextButton(
                      style: Styles.imageListAddButtonStyle,
                      onPressed: () {
                        setState(() {
                          if (tablaCargada) {
                            tablaCargada = false;
                            tabla = null;
                          }
                        });
                      },
                      child: Image.asset(
                        "sources/images/loginImage.png",
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PanelWidget(
                      padding: EdgeInsets.all(20),
                      colorBase: Styles.fondoClaro,
                      child: Column(
                        children: [
                          Text("Tablas", style: Styles.titleText),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .76,
                            child: ListView.builder(
                              itemCount: tablas.length,
                              itemBuilder: (_, i) => ListTile(
                                style: ListTileStyle.drawer,
                                title: Text(tablas[i]),
                                onTap: () => {
                                  setState(() {
                                    cargarTabla(tablas[i]);
                                    tablaCargada = true;
                                  }),
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PanelWidget(
                      padding: EdgeInsets.all(20),
                      colorBase: Styles.fondoClaro,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: tabla != null && tablaCargada
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 10,
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: ElevatedButton(
                                      style: Styles.buttonStyle,
                                      onPressed: () {
                                        mostrarFormulario(
                                          tabla!.titulo,
                                          id: null,
                                        );
                                      },
                                      child: Text("Insertar"),
                                    ),
                                  ),
                                  Expanded(child: Center(child: tabla!)),
                                ],
                              )
                            : Expanded(child: IdleScreenWidget()),
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
    db = ref.read(appDatabaseProvider);
    final adminDao = ref.read(adminDaoProvider);
    final daoHelper = ref.read(daoHelperProvider);
    final tablas = await adminDao.obtenerNombresTablas();
    nombreLocal = await daoHelper.nombreLocal(1);
    setState(() {
      this.tablas = tablas;
    });
  }

  void cargarTabla(String tablaNombre) async {
    final adminDao = ref.read(adminDaoProvider);
    final cellBuilderHelper = CellBuilderWidgets();
    final columnas = await adminDao.obtenerColumnasTabla(tablaNombre);
    final nombresColumnas = columnas.map((c) => c['name'] as String).toList();
    final registros = await adminDao.obtenerRegistros(tablaNombre);

    setState(() {
      tablaCargada = true;
      tabla = TableScreenWidget(
        titulo: tablaNombre,
        columnas: nombresColumnas,
        dataStream: Stream.fromFuture(Future.value(registros)),
        cellBuilder: (registro) =>
            cellBuilderHelper.obtenerCellBuilder(tablaNombre, registro),
        columnasPorPagina: nombresColumnas.length,
        onEdit: (row) {
          mostrarFormulario(
            tablaNombre, 
            id: row["id"]);
        },
        onDelete: (row) async {
          await db.customStatement(
            "DELETE FROM $tablaNombre WHERE id = ${row["id"]}",
          );
          cargarTabla(tablaNombre);
        },
      );
    });
  }

  void mostrarFormulario(String tabla, {dynamic? id}) async {
    final resultado = await showDialog(
      context: context,
      builder: (_) => FormularioGenerico(tabla: tabla, id: id),
    );

    if (resultado == true) {
      cargarTabla(tabla);
    }
  }

  void cerrarSesion() {
    Navigator.pop(context);
  }
}