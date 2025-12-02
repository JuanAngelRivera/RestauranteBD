import 'package:flutter/material.dart';

class TableScreenWidget<T> extends StatefulWidget {
  final String titulo;
  final List<String> columnas;
  final Stream<List<Map<String, dynamic>>> dataStream;
  final List<DataCell> Function(Map<String, dynamic> item) cellBuilder;
  final void Function(T item)? onEdit;
  final void Function(T item)? onDelete;
  final int columnasPorPagina;

  const TableScreenWidget({
    super.key,
    required this.titulo,
    required this.columnas,
    required this.dataStream,
    required this.cellBuilder,
    this.onEdit,
    this.onDelete,
    required this.columnasPorPagina,
  });

  @override
  State<TableScreenWidget> createState() => _TableScreenWidgetState<T>();
}

class _TableScreenWidgetState<T> extends State<TableScreenWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titulo,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: widget.dataStream,
            builder: (_, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              final registros = snapshot.data!;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: widget.columnas
                      .map((c) => DataColumn(label: Text(c)))
                      .toList(),
                  rows: registros
                      .map((r) => DataRow(cells: widget.cellBuilder(r)))
                      .toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
