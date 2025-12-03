import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class TableScreenWidget extends StatefulWidget {
  final String titulo;
  final List<String> columnas;
  final Stream<List<Map<String, dynamic>>> dataStream;
  final List<DataCell> Function(Map<String, dynamic>) cellBuilder;
  final int columnasPorPagina;
  final void Function(Map<String, dynamic> row)? onEdit;
  final void Function(Map<String, dynamic> row)? onDelete;

  const TableScreenWidget({
    super.key,
    required this.titulo,
    required this.columnas,
    required this.dataStream,
    required this.cellBuilder,
    required this.columnasPorPagina,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<TableScreenWidget> createState() => _TableScreenWidgetState();
}

class _TableScreenWidgetState extends State<TableScreenWidget> {
  final ScrollController verticalCtrl = ScrollController();
  final ScrollController horizontalCtrl = ScrollController();

  @override
  void dispose() {
    verticalCtrl.dispose();
    horizontalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titulo, style: Styles.titleText),
        const SizedBox(height: 8),

        Expanded(
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: widget.dataStream,
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final registros = snapshot.data!;

              final columnas = <DataColumn>[
                ...widget.columnas.map((c) => DataColumn(label: Text(c))),
              ];

              if (widget.onEdit != null) {
                columnas.add(const DataColumn(label: Text("Editar")));
              }

              if (widget.onDelete != null) {
                columnas.add(const DataColumn(label: Text("Eliminar")));
              }

              return Scrollbar(
                controller: verticalCtrl,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: verticalCtrl,
                  scrollDirection: Axis.vertical,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: horizontalCtrl,
                    scrollbarOrientation: ScrollbarOrientation.top,
                    child: SingleChildScrollView(
                      controller: horizontalCtrl,
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: columnas,
                        rows: registros.map((reg) {
                          final cells = widget.cellBuilder(reg);

                          // Rellenar para que siempre tenga las columnas base
                          while (cells.length < widget.columnas.length) {
                            cells.add(const DataCell(Text("")));
                          }

                          // Agregar celda Editar SOLO si onEdit != null
                          if (widget.onEdit != null) {
                            cells.add(
                              DataCell(
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () => widget.onEdit!(reg),
                                ),
                              ),
                            );
                          }

                          // Agregar celda Eliminar SOLO si onDelete != null
                          if (widget.onDelete != null) {
                            cells.add(
                              DataCell(
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () => widget.onDelete!(reg),
                                ),
                              ),
                            );
                          }

                          return DataRow(cells: cells);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}