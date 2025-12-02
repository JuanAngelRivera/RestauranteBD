import 'package:drift/drift.dart' hide Column;
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
                                        if (tabla!.titulo == "Cuenta") {
                                          mostrarFormularioCuentaAdmin();
                                        } else {
                                          mostrarFormulario(
                                            tabla!.titulo,
                                            id: null,
                                          );
                                        }
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
          mostrarFormulario(tablaNombre, id: row["id"]);
        },
        onDelete: (row) async {
          final adminDao = ref.read(adminDaoProvider);

          // Obtener columnas de la tabla
          final columnas = await adminDao.obtenerColumnasTabla(tablaNombre);

          // Filtrar las columnas que sean PK
          final pkCols = columnas.where((c) => c['pk'] == 1).toList();

          if (pkCols.isEmpty) {
            print("⚠ No se encontró columna PK para $tablaNombre");
            return;
          }

          // Construir la cláusula WHERE y la lista de variables
          final whereClause = pkCols
              .map((c) => "${c['name']} = ?")
              .join(" AND ");
          final variables = pkCols.map((c) {
  final value = row[c['name']];
  if (value == null) return Variable(null); // <- aquí protegemos null
  if (value is int) return Variable.withInt(value);
  if (value is double) return Variable.withReal(value);
  if (value is String) return Variable.withString(value);
  throw UnsupportedError("Tipo no soportado en PK: $value");
}).toList();


          await db.customStatement(
            "DELETE FROM $tablaNombre WHERE $whereClause",
            variables 
          );
          cargarTabla(tablaNombre);
        },
      );
    });
  }

  void mostrarFormulario(String tabla, {dynamic id}) async {
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

  void mostrarFormularioCuentaAdmin() async {
    final adminDao = ref.read(adminDaoProvider);
    final cuentasNormales = await adminDao.obtenerCuentasNormales();

    int? empleadoSeleccionado;

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Crear cuenta administrador"),
        content: DropdownButtonFormField<int>(
          decoration: InputDecoration(labelText: "Empleado con cuenta normal"),
          items: cuentasNormales
              .map((e) {
                final id = e["id"];
                final nombre = e["nombreUsuario"] ?? "Sin nombre";

                if (id == null) {
                  print("ERROR: idEmpleado es null en: $e");
                  return null;
                }

                return DropdownMenuItem<int>(
                  value: id as int,
                  child: Text(nombre),
                );
              })
              .whereType<DropdownMenuItem<int>>()
              .toList(),

          onChanged: (v) => empleadoSeleccionado = v,
        ),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Crear"),
            onPressed: () async {
              if (empleadoSeleccionado != null) {
                await crearCuentaAdmin(empleadoSeleccionado!);
                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),
    );

    cargarTabla("Cuenta");
  }

  Future<void> crearCuentaAdmin(int idEmpleado) async {
    final resultado = await db
        .customSelect(
          "SELECT id_Empleado FROM Cuenta WHERE id_Empleado = ? AND tipo = 1",
          variables: [Variable.withInt(idEmpleado)],
        )
        .get();

    if (resultado.isNotEmpty) {
      print("⚠ Ya existe un administrador para este empleado.");
      return;
    }

    final empleado = await db
        .customSelect(
          "SELECT nombre FROM Empleado WHERE id = ?",
          variables: [Variable.withInt(idEmpleado)],
        )
        .getSingle();

    final nombre = empleado.data["nombre"] as String;
    final usuario = nombre.toLowerCase().replaceAll(RegExp(r"\s+"), "");
    final password = usuario;

    await db.customInsert(
      """
    INSERT INTO Cuenta (id_Empleado, nombreUsuario, contraseña, tipo)
    VALUES (?, ?, ?, 1)
    """,
      variables: [
        Variable.withInt(idEmpleado),
        Variable.withString("$usuario"),
        Variable.withString(password),
      ],
    );
  }
}
