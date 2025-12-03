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
                        columns: [
                          ...widget.columnas.map(
                            (c) => DataColumn(label: Text(c)),
                          ),
                          const DataColumn(label: Text("Editar")),
                          const DataColumn(label: Text("Eliminar")),
                        ],
                        rows: registros.map((reg) {
                          final cells = widget.cellBuilder(reg);
                    
                          while (cells.length < widget.columnas.length) {
                            cells.add(const DataCell(Text("")));
                          }
                          cells.add(
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.edit, 
                                  color: widget.onEdit == null 
                                  ?Colors.grey 
                                  : Colors.black87),
                                onPressed: widget.onEdit == null
                                    ? null
                                    : () => widget.onEdit!(reg),
                              ),
                            ),
                          );
                          cells.add(
                            DataCell(
                              IconButton(
                                icon: Icon(
                                  Icons.delete, 
                                  color: widget.onDelete == null
                                  ? Colors.grey
                                  : Colors.black87),
                                onPressed: widget.onDelete == null
                                    ? null
                                    : () => widget.onDelete!(reg),
                              ),
                            ),
                          );
                    
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