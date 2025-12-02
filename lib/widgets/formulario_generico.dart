import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class FormularioGenerico extends ConsumerStatefulWidget {
  final String tabla;
  final int? id;
  const FormularioGenerico({super.key, required this.tabla, this.id});

  @override
  ConsumerState<FormularioGenerico> createState() => _FormularioGenericoState();
}

class _FormularioGenericoState extends ConsumerState<FormularioGenerico> {
  List<Map<String, dynamic>> columnas = [];
  Map<String, dynamic> datos = {};
  Map<String, TextEditingController> controllers = {};
  late AppDatabase db;

  @override
  void initState() {
    super.initState();
    init();
    cargarColumnas();
  }

  void init() async {
    db = ref.read(appDatabaseProvider);
  }

  Future<void> cargarColumnas() async {
    final result = await db
        .customSelect('PRAGMA table_info(${widget.tabla});')
        .get();

    columnas = result.map((x) => x.data).toList();

    for (var col in columnas) {
      final nombre = col["name"];

      controllers[nombre] = TextEditingController();
    }

    if (widget.id != null) {
      await cargarDatos();
    }

    setState(() {});
  }

  Future<void> cargarDatos() async {
    final result = await db
        .customSelect(
          'SELECT * FROM ${widget.tabla} WHERE id = ?',
          variables: [Variable.withInt(widget.id!)],
        )
        .getSingleOrNull();

    if (result != null) {
      datos = result.data;

      datos.forEach((key, value) {
        controllers[key]?.text = value?.toString() ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (columnas.isEmpty) {
      return AlertDialog(
        content: SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return AlertDialog(
      backgroundColor: Styles.fondoClaro,
      title: Text(
        widget.id == null ? "Insertar" : "Actualizar",
        style: Styles.titleText,),
      content: SingleChildScrollView(
        child: Column(
          children: columnas.map((col) {
            final nombre = col["name"];

            if (col["pk"] == 1) {
              return SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                onSubmitted: (value) {
                  guardar();
                },
                controller: controllers[nombre],
                decoration: Styles.createInputDecoration(
                  nombre, 
                  Colors.grey.shade300)
              ),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          style: Styles.buttonStyle,
          onPressed: () => Navigator.pop(context),
          child: Text("Cancelar"),
        ),
        ElevatedButton(
          style: Styles.buttonStyle,
          onPressed: guardar,
          child: Text(widget.id == null ? "Insertar" : "Actualizar"),
        ),
      ],
    );
  }

  Future<void> guardar() async {
    final valores = <String, dynamic>{};

    for (var col in columnas) {
      final nombre = col["name"];
      final esPk = col["pk"] == 1;

      if (widget.id == null && esPk) continue;

      final texto = controllers[nombre]!.text.trim();

      dynamic valorProcesado;

      if (texto.isEmpty) {
        valorProcesado = null;
      } else {
        switch (col["type"].toString().toUpperCase()) {
          case "INTEGER":
            valorProcesado = int.tryParse(texto);
            break;
          case "REAL":
            valorProcesado = double.tryParse(texto);
            break;
          default:
            valorProcesado = texto;
        }
      }

      valores[nombre] = valorProcesado;
    }

    if (widget.id == null) {
      final columnasStr = valores.keys.join(", ");
      final placeholders = valores.keys.map((_) => "?").join(", ");

      await db.customInsert(
        'INSERT INTO ${widget.tabla} ($columnasStr) VALUES ($placeholders);',
        variables: valores.values.map(variableFromDynamic).toList(),
      );
    } else {
      final sets = valores.keys.map((key) => '$key = ?').join(", ");

      await db.customUpdate(
        'UPDATE ${widget.tabla} SET $sets WHERE id = ?;',
        variables: [
          ...valores.values.map(variableFromDynamic),
          Variable.withInt(widget.id!),
        ],
      );
    }

    Navigator.pop(context, true);
  }

  Variable variableFromDynamic(dynamic v) {
    if (v == null) return Variable(null);

    if (v is int) return Variable.withInt(v);
    if (v is double) return Variable.withReal(v);
    if (v is String) return Variable.withString(v);

    throw UnsupportedError("Tipo no soportado para SQL: $v");
  }
}
