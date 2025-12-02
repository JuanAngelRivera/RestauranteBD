import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class TableScreenWidget extends StatefulWidget {
  final String titulo;
  final List<String> columnas;
  final Stream<List<Map<String, dynamic>>> dataStream;
  final List<DataCell> Function(Map<String, dynamic>) cellBuilder;
  final int columnasPorPagina;

  const TableScreenWidget({
    super.key,
    required this.titulo,
    required this.columnas,
    required this.dataStream,
    required this.cellBuilder,
    required this.columnasPorPagina,
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
        Text(
          widget.titulo, 
          style: Styles.titleText,
          textAlign: TextAlign.center,),
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

                  child: SingleChildScrollView(
                    controller: horizontalCtrl,
                    scrollDirection: Axis.horizontal,

                    child: DataTable(
                      columns: widget.columnas
                          .map((c) => DataColumn(label: Text(c)))
                          .toList(),

                      rows: registros.map((reg) {
                        final cells = widget.cellBuilder(reg);

                        while (cells.length < widget.columnas.length) {
                          cells.add(const DataCell(Text("")));
                        }

                        return DataRow(cells: cells);
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}