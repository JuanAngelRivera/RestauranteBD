import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

import 'formulario_generico.dart';

class FormularioDependencia extends FormularioGenerico {
  const FormularioDependencia({super.key, required super.tabla, super.id});

  @override
  ConsumerState<FormularioGenerico> createState() =>
      _FormularioDependenciaState();
}

class _FormularioDependenciaState extends FormularioGenericoState {
  late List<Map<String, dynamic>> pkColumns;

  @override
  void detectarPK() {
    pkColumns = columnas.where((c) => c["pk"] >= 1).toList();

    if (pkColumns.length <= 1) {
      super.detectarPK();
      return;
    }

    pkName = "";
    pkType = "";
  }

  bool esPK(String col) => pkColumns.any((c) => c["name"] == col);

  bool esPKyFK(String col) => esPK(col) && esFK(col);

  String? nombreFkPK() {
    final fk = pkColumns.firstWhere((c) => esFK(c["name"]), orElse: () => {});
    return fk.isEmpty ? null : fk["name"];
  }

  String? nombrePKSecundaria() {
    final pk2 = pkColumns.firstWhere((c) => !esFK(c["name"]), orElse: () => {});
    return pk2.isEmpty ? null : pk2["name"];
  }

  @override
  Widget buildFormulario() {
    final pkSecundaria = nombrePKSecundaria();

    return AlertDialog(
      backgroundColor: Styles.fondoClaro,
      title: Text(
        widget.id == null ? "Insertar" : "Actualizar",
        style: Styles.titleText,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: columnas.map((col) {
            final nombre = col["name"];
            final tipo = (col["type"] ?? "").toString().toUpperCase();
      
            if (nombre == pkSecundaria) {
              if (widget.id == null) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: controllers[nombre],
                    readOnly: true,
                    decoration: Styles.createInputDecoration(
                      "$nombre (no editable)",
                      Colors.grey.shade300,
                    ),
                  ),
                );
              }
      
              return FutureBuilder<Widget>(
                future: buildDropdownFK(nombre),
                builder: (_, snap) {
                  if (!snap.hasData) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: LinearProgressIndicator(),
                    );
                  }
      
                  return Column(
                    children: [
                      snap.data!,
                      if (pkSecundaria != null)
                        FutureBuilder(
                          future: _recalcularNumero(pkSecundaria),
                          builder: (_, __) {
                            return const SizedBox.shrink();
                          },
                        ),
                    ],
                  );
                },
              );
            }
      
            if (esFK(nombre)) {
              return FutureBuilder<Widget>(
                future: buildDropdownFK(nombre),
                builder: (_, snap) {
                  if (!snap.hasData) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
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
                keyboardType: obtenerTextInput(tipo),
                inputFormatters: obtenerInputFormatter(tipo),
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

  Future<void> _recalcularNumero(String pkSecundaria) async {
    final fkCol = nombreFkPK();
    if (fkCol == null) return;

    final idProveedor = controllers[fkCol]?.text;
    if (idProveedor == null || idProveedor.isEmpty) return;

    final query = await db
        .customSelect(
          """
      SELECT COALESCE(MAX($pkSecundaria), 0) + 1 AS nuevo
      FROM ${widget.tabla}
      WHERE $fkCol = ?
      """,
          variables: [Variable.withInt(int.parse(idProveedor))],
        )
        .getSingle();

    final nuevo = query.data["nuevo"].toString();
    controllers[pkSecundaria]?.text = nuevo;
  }

  @override
  Future<void> guardar() async {
    final fkCol = nombreFkPK();
    final pkSec = nombrePKSecundaria();

    if (fkCol == null || pkSec == null) {
      mostrarSnackError(
        "Error interno: la tabla dependiente no fue detectada correctamente.",
      );
      return;
    }

    final valores = <String, dynamic>{};

    for (var col in columnas) {
      final nombre = col["name"];
      final raw = controllers[nombre]!.text.trim();
      final tipo = (col["type"] ?? "").toString().toUpperCase();

      if (raw.isEmpty) {
        valores[nombre] = null;
        continue;
      }

      if (tipo.contains("INT")) {
        if (int.tryParse(raw) == null) {
          mostrarSnackError("El campo '$nombre' debe ser entero.");
          return;
        }
        valores[nombre] = int.parse(raw);
        continue;
      }

      valores[nombre] = raw;
    }

    if (widget.id == null) {
      final cols = valores.keys.join(", ");
      final ph = valores.keys.map((_) => "?").join(", ");

      final id = await db.customInsert(
        "INSERT INTO ${widget.tabla} ($cols) VALUES ($ph)",
        variables: valores.values.map(variableFromDynamic).toList(),
      );

      procesoRealizado(id, widget.id);
      Navigator.pop(context, true);
      return;
    }
    final sets = valores.keys
        .where((k) => k != fkCol && k != pkSec)
        .map((k) => "$k = ?")
        .join(", ");

    final varsUpdate = valores.entries
        .where((e) => e.key != fkCol && e.key != pkSec)
        .map((e) => variableFromDynamic(e.value))
        .toList();

    final idProveedor = controllers[fkCol]!.text;
    final numero = controllers[pkSec]!.text;

    final whereVars = [
      variableFromDynamic(idProveedor),
      variableFromDynamic(numero),
    ];

    final id = await db.customUpdate(
      """
      UPDATE ${widget.tabla}
      SET $sets
      WHERE $fkCol = ? AND $pkSec = ?
      """,
      variables: [...varsUpdate, ...whereVars],
    );

    procesoRealizado(id, widget.id);
    Navigator.pop(context, true);
  }

  @override
  Future<Widget> buildDropdownFK(String columna) async {
    final fk = getFK(columna);
    if (fk == null) return Text("Error FK en $columna");

    final tablaFk = fk["table"].toString();
    final campoId = fk["to"].toString();

    final metaColumns = await db
        .customSelect("PRAGMA table_info($tablaFk)")
        .get();
    final columnasFk = metaColumns.map((c) => c.data).toList();

    String? columnaDescripcion;
    for (var c in columnasFk) {
      final type = (c["type"] ?? "").toString().toUpperCase();
      if (type.contains("CHAR") || type == "TEXT" || type == "VARCHAR") {
        if (c["name"] != campoId &&
            (c["name"] == "nombre" || c["name"] == "descripcion")) {
          columnaDescripcion = c["name"];
          break;
        }
      }
    }
    columnaDescripcion ??= campoId;

    final opciones = await db
        .customSelect(
          "SELECT $campoId AS id, $columnaDescripcion AS nombre FROM $tablaFk",
        )
        .get();

    final listaOpciones = opciones
        .map((r) => r.data)
        .toList()
        .cast<Map<String, dynamic>>();

    final valorActual = int.tryParse(controllers[columna]!.text);

    if (!esPKyFK(columna)) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DropdownButtonFormField<int>(
          decoration: Styles.createInputDecoration(
            columna,
            Colors.grey.shade300,
          ),
          initialValue: valorActual,
          items: listaOpciones.map((row) {
            return DropdownMenuItem<int>(
              value: row["id"] is int
                  ? row["id"]
                  : int.parse(row["id"].toString()),
              child: Text(row["nombre"].toString()),
            );
          }).toList(),
          onChanged: (value) {
            controllers[columna]!.text = value?.toString() ?? "";
          },
        ),
      );
    }

    final pkSecundaria = nombrePKSecundaria();
    if (pkSecundaria == null) {
      return Text("Error PK secundaria");
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<int>(
        
        decoration: Styles.createInputDecoration(
          columna,
          Colors.grey.shade300,
        ),
        initialValue: valorActual,
        items: listaOpciones.map((row) {
          return DropdownMenuItem<int>(
            value: row["id"] is int
                ? row["id"]
                : int.parse(row["id"].toString()),
            child: Text(row["nombre"].toString()),
          );
        }).toList(),
        onChanged: (value) async {
          controllers[columna]!.text = value?.toString() ?? "";

          await _recalcularNumero(pkSecundaria);

          setState(() {});
        },
      ),
    );
  }
}
