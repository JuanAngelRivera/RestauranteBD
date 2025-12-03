import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/providers/session_provider.dart';
import 'package:restaurante_base_de_datos/utils/dao_helper.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/cell_builder_widgets.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';
import 'package:restaurante_base_de_datos/widgets/table_screen_widget.dart';

class HistorialView extends ConsumerStatefulWidget {
  const HistorialView({super.key});

  @override
  ConsumerState<HistorialView> createState() => _HistorialViewState();
}

class _HistorialViewState extends ConsumerState<HistorialView> {
  late DaoHelper daoHelper;
  late Future<List<Map<String, dynamic>>> registros;
  late SessionState empleado;
  CellBuilderWidgets cellb = CellBuilderWidgets();
  bool hayRegistros = false;
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    empleado = ref.read(sessionProvider);
    daoHelper = ref.read(daoHelperProvider);
    obtenerRegistros(empleado.empleadoId!);
  }

  void obtenerRegistros(int idEmpleado) async {
    final query = await daoHelper.ordenesPorEmpleado(idEmpleado);
    if (query.isNotEmpty) {
      registros = daoHelper.ordenesPorEmpleado(idEmpleado);
      hayRegistros = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.fondoOscuro,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Historial de órdenes", 
          style: Styles.titleTextW),
        backgroundColor: Styles.fondoOscuro,),
      body: hayRegistros == false
          ? Center(child: Text("Aún no hay registros"))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: PanelWidget(
                padding: EdgeInsets.all(20),
                child: TableScreenWidget(
                  titulo: "Órdenes de ${empleado.nombreUsuario}",
                  columnas: ["Local", "Orden", "Fecha", "Total"],
                  dataStream: Stream.fromFuture(Future.value(registros)),
                  columnasPorPagina: 5,
                  onEdit: null,
                  onDelete: null,
                  cellBuilder: (registro) =>
                      cellb.orderCellBuilder(registro)
                ),
              ),
            ),
    );
  }
}