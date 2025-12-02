import 'package:flutter/material.dart';

class CellBuilderWidgets {
  List<DataCell> productoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['nombre'] ?? '')),
    DataCell(Text(e['precio'].toString())),
    DataCell(Text(e['categoria'] ?? 'Desconocido')),
    DataCell(Text(e['foto'] ?? ''))
  ];

  List<DataCell> categoriaCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['nombre'] ?? '')),
    DataCell(Text(e['descripcion'] ?? ''))
  ];

  List<DataCell> turnoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['horaInicio'])),
    DataCell(Text(e['horaFin'])),
    DataCell(Text(e['descripcion'])),
  ];

  List<DataCell> rolCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['descripcion'])),
    DataCell(Text(e['sueldo'].toString()))
  ];

  List<DataCell> proveedorCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['nombre'])),
    DataCell(Text(e['direccion'])),
    DataCell(Text(e['descripcion'])),
  ];

  List<DataCell> metodoPagoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['descripcion'])),
  ];

  List<DataCell> medidaCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['descripcion'])),
  ];

  List<DataCell> insumoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['nombre'])),
    DataCell(Text(e['costo'].toString())),
    DataCell(Text(e['descripcion'])),
    DataCell(Text(e['medida'])),
    DataCell(Text(e['enAlmacen'].toString()))
  ];

  List<DataCell> empleadoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['nombre'])),
    DataCell(Text(e['telefono'])),
    DataCell(Text(e['curp'])),
    DataCell(Text(e['rfc'])),
    DataCell(Text(e['fechaIngreso'])),
    DataCell(Text(e['nss'])),
    DataCell(Text(e['foto'])),
    DataCell(Text(e['rol'])),
    DataCell(Text(e['turno'])),
  ];

  List<DataCell> descuentoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['descripcion'])),
    DataCell(Text(e['porcentaje'].toString())),
    DataCell(Text(e['producto']))
  ];

  List<DataCell> cuentaCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['usuario'])),
    DataCell(Text(e['contraseña'])),
  ];

  List<DataCell> contactoCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['numero'])),
    DataCell(Text(e['nombre'])),
    DataCell(Text(e['telefono']))
  ];

  List<DataCell> bonusCellBuilder(Map<String, dynamic> e) => [
    DataCell(Text(e['id'].toString())),
    DataCell(Text(e['valor'].toString())),
    DataCell(Text(e['descripcion'])),
  ];

  List<DataCell> obtenerCellBuilder(
    String tabla,
    Map<String, dynamic> registro,
  ) {
    switch (tabla) {
      case 'Producto':
        return productoCellBuilder(registro);
      case 'Categoria':
        return categoriaCellBuilder(registro);
      case 'Bonus':
        return bonusCellBuilder(registro);
      case 'Contacto':
        return contactoCellBuilder(registro);
      case 'Cuenta':
        return cuentaCellBuilder(registro);
      case 'Descuento':
        return descuentoCellBuilder(registro);
      case 'Empleado':
        return empleadoCellBuilder(registro);
      case 'Insumo':
        return insumoCellBuilder(registro);
      case 'Medida':
        return medidaCellBuilder(registro);
      case 'MetodoPago':
        return metodoPagoCellBuilder(registro);
      case 'Proveedor':
        return proveedorCellBuilder(registro);
      case 'Rol':
        return rolCellBuilder(registro);
      case 'Turno':
        return turnoCellBuilder(registro);
      default:
        return [];
    }
  }
}
