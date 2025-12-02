import 'package:flutter/material.dart';

class CellBuilderWidgets {
  DataCell cell(dynamic v) => DataCell(Text(v?.toString() ?? ''));

  List<DataCell> productoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['nombre']),
    cell(e['precio']),
    cell(e['categoria']),
    cell(e['foto']),
  ];

  List<DataCell> categoriaCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['nombre']),
    cell(e['descripcion']),
  ];

  List<DataCell> turnoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['horaInicio']),
    cell(e['horaFin']),
    cell(e['descripcion']),
  ];

  List<DataCell> rolCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['descripcion']),
    cell(e['sueldo']),
  ];

  List<DataCell> proveedorCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['nombre']),
    cell(e['direccion']),
    cell(e['descripcion']),
  ];

  List<DataCell> metodoPagoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['descripcion']),
  ];

  List<DataCell> medidaCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['descripcion']),
  ];

  List<DataCell> insumoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['nombre']),
    cell(e['costo']),
    cell(e['descripcion']),
    cell(e['medida']),
    cell(e['enAlmacen']),
  ];

  List<DataCell> empleadoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['nombre']),
    cell(e['telefono']),
    cell(e['curp']),
    cell(e['rfc']),
    cell(e['fechaIngreso']),
    cell(e['nss']),
    cell(e['foto']),
    cell(e['rol']),
    cell(e['turno']),
  ];

  List<DataCell> descuentoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['descripcion']),
    cell(e['porcentaje']),
    cell(e['producto']),
  ];

  List<DataCell> cuentaCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['usuario']),
    cell(e['contraseña']),
    cell(e['tipo'] == 0 ? "normal" : "administrador")
  ];

  List<DataCell> contactoCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['numero']),
    cell(e['nombre']),
    cell(e['telefono']),
  ];

  List<DataCell> bonusCellBuilder(Map<String, dynamic> e) => [
    cell(e['id']),
    cell(e['valor']),
    cell(e['descripcion']),
  ];

  List<DataCell> obtenerCellBuilder(
    String tabla,
    Map<String, dynamic> registro,
  ) {
    final t = tabla.toLowerCase();

    switch (t) {
      case 'producto':
        return productoCellBuilder(registro);
      case 'categoria':
        return categoriaCellBuilder(registro);
      case 'bonus':
        return bonusCellBuilder(registro);
      case 'contacto':
        return contactoCellBuilder(registro);
      case 'cuenta':
        return cuentaCellBuilder(registro);
      case 'descuento':
        return descuentoCellBuilder(registro);
      case 'empleado':
        return empleadoCellBuilder(registro);
      case 'insumo':
        return insumoCellBuilder(registro);
      case 'medida':
        return medidaCellBuilder(registro);
      case 'metodopago':
        return metodoPagoCellBuilder(registro);
      case 'proveedor':
        return proveedorCellBuilder(registro);
      case 'rol':
        return rolCellBuilder(registro);
      case 'turno':
        return turnoCellBuilder(registro);
      default:
        return [];
    }
  }
}