import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class FormularioGenerico extends ConsumerStatefulWidget {
  final String tabla;
  final int? id;

  const FormularioGenerico({
    super.key,
    required this.tabla,
    this.id,
  });

  @override
  ConsumerState<FormularioGenerico> createState() =>
      _FormularioGenericoState();
}

class _FormularioGenericoState extends ConsumerState<FormularioGenerico> {
  late AppDatabase db;

  List<Map<String, dynamic>> columnas = [];
  List<Map<String, dynamic>> foreignKeys = [];

  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    db = ref.read(appDatabaseProvider);
    cargarColumnas();
  }

  Future<void> cargarColumnas() async {
    final result =
        await db.customSelect('PRAGMA table_info(${widget.tabla});').get();
    columnas = result.map((e) => e.data).toList();

    foreignKeys =
        await db.customSelect('PRAGMA foreign_key_list(${widget.tabla});').get().then(
              (rows) => rows.map((r) => r.data).toList(),
            );

    for (var col in columnas) {
      controllers[col["name"]] = TextEditingController();
    }

    if (widget.id != null) {
      await cargarDatos();
    }

    setState(() {});
  }

  Future<void> cargarDatos() async {
    final row = await db.customSelect(
      'SELECT * FROM ${widget.tabla} WHERE id = ?',
      variables: [Variable.withInt(widget.id!)],
    ).getSingleOrNull();

    if (row != null) {
      for (var entry in row.data.entries) {
        controllers[entry.key]?.text = entry.value?.toString() ?? "";
      }
    }
  }

  bool esFK(String columna) {
    return foreignKeys.any((fk) => fk["from"] == columna);
  }

  Map<String, dynamic>? getFK(String columna) {
    return foreignKeys.firstWhere(
      (fk) => fk["from"] == columna,
      orElse: () => {},
    );
  }

  Future<Widget> buildDropdownFK(String columna) async {
    final fk = getFK(columna);

    if (fk == null || fk.isEmpty) {
      return Text("Error FK en $columna", style: TextStyle(color: Colors.red));
    }

    final tablaFk = fk["table"];
    final campoId = fk["to"];

    final metaColumns = await db.customSelect("PRAGMA table_info($tablaFk)").get();
    final columnasFk = metaColumns.map((c) => c.data).toList();

    String? columnaDescripcion;

    for (var c in columnasFk) {
      final type = (c["type"] ?? "").toString().toUpperCase();
      if (type == "TEXT" && c["name"] != "id") {
        columnaDescripcion = c["name"];
        break;
      }
    }

    columnaDescripcion ??= "id";

    final opciones = await db.customSelect(
      "SELECT $campoId AS id, $columnaDescripcion AS nombre FROM $tablaFk",
    ).get();

    final listaOpciones =
        opciones.map((row) => row.data).toList().cast<Map<String, dynamic>>();

    final valorActual = int.tryParse(controllers[columna]!.text);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<int>(
        decoration: Styles.createInputDecoration(columna, Colors.grey.shade300),
        initialValue: valorActual,
        items: listaOpciones.map((row) {
          return DropdownMenuItem(
            value: row["id"] as int,
            child: Text(row["nombre"].toString()),
          );
        }).toList(),
        onChanged: (value) {
          controllers[columna]!.text = value?.toString() ?? "";
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (columnas.isEmpty) {
      return const AlertDialog(
        content: SizedBox(
          height: 100,
          child: Center(
            child: CircularProgressIndicator()),
        ),
      );
    }

    return AlertDialog(
      backgroundColor: Styles.fondoClaro,
      title: Text(widget.id == null ? "Insertar" : "Actualizar",
          style: Styles.titleText),
      content: SingleChildScrollView(
        child: Column(
          children: columnas.map((col) {
            final nombre = col["name"];

            if (col["pk"] == 1) return SizedBox.shrink();

            if (esFK(nombre)) {
              return FutureBuilder(
                future: buildDropdownFK(nombre),
                builder: (_, snap) {
                  if (!snap.hasData) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(),
                    );
                  }
                  return snap.data!;
                },
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: controllers[nombre],
                decoration: Styles.createInputDecoration(
                  nombre,
                  Colors.grey.shade300,
                ),
                onSubmitted: (_) => guardar(),
              ),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          style: Styles.buttonStyle,
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
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
      if (col["pk"] == 1 && widget.id == null) continue;

      final raw = controllers[nombre]!.text.trim();
      dynamic valor;

      if (raw.isEmpty) {
        valor = null;
      } else {
        final tipo = (col["type"] ?? "").toString().toUpperCase();
        if (tipo == "INTEGER") {
          valor = int.tryParse(raw);
        } else if (tipo == "REAL") {
          valor = double.tryParse(raw);
        } else {
          valor = raw;
        }
      }

      valores[nombre] = valor;
    }

    if (widget.id == null) {
      final columnasStr = valores.keys.join(", ");
      final ph = valores.keys.map((_) => "?").join(", ");

      await db.customInsert(
        "INSERT INTO ${widget.tabla} ($columnasStr) VALUES ($ph);",
        variables: valores.values.map(variableFromDynamic).toList(),
      );
    } else {
      final sets = valores.keys.map((k) => "$k = ?").join(", ");

      await db.customUpdate(
        "UPDATE ${widget.tabla} SET $sets WHERE id = ?;",
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
    throw UnsupportedError("Tipo no soportado: $v");
  }
}