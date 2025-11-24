import 'package:flutter/material.dart';

class TableScreenWidget<T> extends StatefulWidget {
  final String titulo;
  final List<String> columnas;
  final Stream<List<T>> dataStream;
  final List<DataCell> Function (T item) cellBuilder;
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
    required this.columnasPorPagina});

  @override
  State<TableScreenWidget> createState() => _TableScreenWidgetState();
}

class _TableScreenWidgetState extends State<TableScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(columns: [
        
      ], rows: []),
    );
  }
}