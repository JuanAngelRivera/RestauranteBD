import 'package:flutter/material.dart';

class CellBuilderWidgets {
  List<DataCell> productoCellBuilder(Map<String, dynamic> p) => [
    DataCell(Text(p['id'].toString())),
    DataCell(Text(p['nombre'] ?? '')),
    DataCell(Text(p['precio'].toString())),
    DataCell(Text(p['categoria'] ?? 'Desconocido')),
  ];

  List<DataCell> obtenerCellBuilder(
    String tabla,
    Map<String, dynamic> registro,
  ) {
    switch (tabla) {
      case 'Producto':
        return productoCellBuilder(registro);
      default:
        return [];
    }
  }
}
