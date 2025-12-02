import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class FormularioGenerico extends ConsumerStatefulWidget {
  final String tabla;
  final dynamic? id;
  const FormularioGenerico({super.key, required this.tabla, this.id});

  @override
  ConsumerState<FormularioGenerico> createState() =>
      _FormularioGenericoState();
}

class _FormularioGenericoState extends ConsumerState<FormularioGenerico> {
  late AppDatabase db;

  List<Map<String, dynamic>> columnas = [];
  List<Map<String, dynamic>> foreignKeys = [];
  Map<String, TextEditingController> controllers = {};

  // mapa de tablas n-n (keys comparadas en lowercase)
  final Map<String, String> tablasNN = {
    "producto": "producto_ingrediente",
    "orden": "orden_producto",
    "insumo": "insumo_proveedor",
  };

  String filtro = "";

  // PK dinámico
  late String pkName;
  late String pkType;

  @override
  void initState() {
    super.initState();
    db = ref.read(appDatabaseProvider);
    cargarColumnas();
  }

  void detectarPK() {
    final pkColumn = columnas.firstWhere((c) => c["pk"] == 1, orElse: () => {});
    if (pkColumn.isEmpty) {
      // fallback si no hay pk explícito
      pkName = "id";
      pkType = "INTEGER";
    } else {
      pkName = pkColumn["name"].toString();
      pkType = (pkColumn["type"] ?? "").toString().toUpperCase();
    }
  }

  Future<void> cargarColumnas() async {
    final result =
        await db.customSelect('PRAGMA table_info(${widget.tabla});').get();
    columnas = result.map((e) => e.data).toList();

    detectarPK();

    foreignKeys = await db
        .customSelect('PRAGMA foreign_key_list(${widget.tabla});')
        .get()
        .then((rows) => rows.map((r) => r.data).toList());

    controllers.clear();
    for (var col in columnas) {
      controllers[col["name"]] = TextEditingController();
    }

    if (widget.id != null) {
      await cargarDatos();
    }

    setState(() {});
  }

  Future<void> cargarDatos() async {
    final query = "SELECT * FROM ${widget.tabla} WHERE $pkName = ?";

    final variable = _variableFromId(widget.id, pkType);

    final row = await db.customSelect(query, variables: [variable]).getSingleOrNull();

    if (row != null) {
      row.data.forEach((key, value) {
        controllers[key]?.text = value?.toString() ?? "";
      });
    }
  }

  // Helper que genera Variable para el id según tipo
  Variable _variableFromId(dynamic idValue, String tipo) {
    if (idValue == null) return const Variable(null);
    if (tipo == "TEXT") {
      return Variable.withString(idValue.toString());
    } else {
      // intentar parsear a int
      final v = (idValue is int) ? idValue : int.tryParse(idValue.toString());
      return Variable.withInt(v ?? 0);
    }
  }

  bool esFK(String columna) {
    return foreignKeys.any((fk) => fk["from"] == columna);
  }

  Map<String, dynamic>? getFK(String columna) {
    final fk = foreignKeys.firstWhere((fk) => fk["from"] == columna, orElse: () => {});
    return fk.isEmpty ? null : fk;
  }

  // Construye el dropdown para una columna FK
  Future<Widget> buildDropdownFK(String columna) async {
    final fk = getFK(columna);

    if (fk == null) {
      return Text("Error FK en $columna", style: const TextStyle(color: Colors.red));
    }

    final tablaFk = fk["table"].toString();
    final campoId = fk["to"].toString();

    // elegir una columna de texto para mostrar (si existe)
    final metaColumns = await db.customSelect("PRAGMA table_info($tablaFk)").get();
    final columnasFk = metaColumns.map((c) => c.data).toList();

    String? columnaDescripcion;
    for (var c in columnasFk) {
      final type = (c["type"] ?? "").toString().toUpperCase();
      if (type.contains("CHAR") || type == "TEXT" || type == "VARCHAR") {
        if (c["name"] != campoId) {
          columnaDescripcion = c["name"];
          break;
        }
      }
    }
    columnaDescripcion ??= campoId; // fallback

    final opciones = await db.customSelect(
      "SELECT $campoId AS id, $columnaDescripcion AS nombre FROM $tablaFk",
    ).get();

    final listaOpciones = opciones.map((r) => r.data).toList().cast<Map<String, dynamic>>();

    final valorActual = int.tryParse(controllers[columna]!.text);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<int>(
        decoration: Styles.createInputDecoration(columna, Colors.grey.shade300),
        value: valorActual,
        items: listaOpciones.map((row) {
          return DropdownMenuItem<int>(
            value: (row["id"] is int) ? row["id"] as int : int.tryParse(row["id"].toString()),
            child: Text(row["nombre"]?.toString() ?? ""),
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
    // detectar tablas n-n por lowercase
    final tablaLower = widget.tabla.toString().toLowerCase();
    if (tablasNN.containsKey(tablaLower)) {
      if (widget.id == null) {
        return AlertDialog(
          title: Text("Primero guarda el registro", style: Styles.titleText),
          content: Text(
            "Para editar las relaciones (${widget.tabla}), primero debes crear el registro.",
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
          ],
        );
      }

      return _buildFormularioN_N();
    }

    if (columnas.isEmpty) {
      return const AlertDialog(
        content: SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
      );
    }

    return _buildFormularioNormal();
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
        if (tipo.contains("INT")) {
          valor = int.tryParse(raw);
        } else if (tipo.contains("REAL") || tipo.contains("FLOA") || tipo.contains("DOUB")) {
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
      final variablePK = _variableFromId(widget.id, pkType);

      await db.customUpdate(
        "UPDATE ${widget.tabla} SET $sets WHERE $pkName = ?;",
        variables: [
          ...valores.values.map(variableFromDynamic),
          variablePK,
        ],
      );
    }

    Navigator.pop(context, true);
  }

  Variable variableFromDynamic(dynamic v) {
    if (v == null) return const Variable(null);
    if (v is int) return Variable.withInt(v);
    if (v is double) return Variable.withReal(v);
    if (v is String) return Variable.withString(v);
    // fallback: stringify
    return Variable.withString(v.toString());
  }

  Widget _buildFormularioNormal() {
    return AlertDialog(
      backgroundColor: Styles.fondoClaro,
      title: Text(widget.id == null ? "Insertar" : "Actualizar", style: Styles.titleText),
      content: SingleChildScrollView(
        child: Column(
          children: columnas.map((col) {
            final nombre = col["name"];
            if (col["pk"] == 1) {
              // mostrar PK en update si es texto (puede interesar permitir editar PK textual)
              if (widget.id != null && pkType == "TEXT") {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: controllers[nombre],
                    decoration: Styles.createInputDecoration(nombre, Colors.grey.shade300),
                    onSubmitted: (_) => guardar(),
                  ),
                );
              }
              return const SizedBox.shrink();
            }

            if (esFK(nombre)) {
              return FutureBuilder<Widget>(
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
                decoration: Styles.createInputDecoration(nombre, Colors.grey.shade300),
                onSubmitted: (_) => guardar(),
              ),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(style: Styles.buttonStyle, onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
        ElevatedButton(style: Styles.buttonStyle, onPressed: guardar, child: Text(widget.id == null ? "Insertar" : "Actualizar")),
      ],
    );
  }

  Widget _buildFormularioN_N() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: cargarRelacionNN(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const AlertDialog(
            content: SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
          );
        }

        final items = snapshot.data!; // lista de {id, nombre, selected}
        final seleccionados = <int>{};
        for (var x in items) {
          if (x["selected"] == true) seleccionados.add(x["id"] as int);
        }

        return StatefulBuilder(builder: (context, setSB) {
          String localFiltro = filtro;
          return AlertDialog(
            title: Text("Seleccionar ${widget.tabla}", style: Styles.titleText),
            content: SizedBox(
              width: 400,
              height: 500,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: "Buscar..."),
                    onChanged: (txt) => setSB(() => localFiltro = txt),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: items
                          .where((e) => localFiltro.isEmpty || e["nombre"].toString().toLowerCase().contains(localFiltro.toLowerCase()))
                          .map((e) {
                        final id = e["id"] as int;
                        final nombre = e["nombre"].toString();
                        final checked = seleccionados.contains(id);
                        return CheckboxListTile(
                          title: Text(nombre),
                          value: checked,
                          onChanged: (v) => setSB(() {
                            if (v == true) {
                              seleccionados.add(id);
                            } else {
                              seleccionados.remove(id);
                            }
                          }),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
              ElevatedButton(
                onPressed: () async {
                  await guardarNN(seleccionados);
                  Navigator.pop(context, true);
                },
                child: const Text("Guardar"),
              ),
            ],
          );
        });
      },
    );
  }

  Future<List<Map<String, dynamic>>> cargarRelacionNN() async {
    final tablaLower = widget.tabla.toString().toLowerCase();
    final tablaRelacion = tablasNN[tablaLower]!;
    final tablaRelacionada = {
      "producto": "ingrediente",
      "orden": "producto",
      "insumo": "proveedor",
    }[tablaLower]!;

    final items = await db.customSelect("SELECT id, nombre FROM $tablaRelacionada").get();
    final relacionados = await db.customSelect(
      "SELECT id_$tablaRelacionada AS id FROM $tablaRelacion WHERE id_${widget.tabla.toString().toLowerCase()} = ?",
      variables: [_variableFromId(widget.id, pkType)],
    ).get();

    final idsRelacionados = relacionados.map((r) => r.data["id"] as int).toSet();

    return items.map((row) {
      final id = row.data["id"] as int;
      return {
        "id": id,
        "nombre": row.data["nombre"],
        "selected": idsRelacionados.contains(id),
      };
    }).toList();
  }

  Future<void> guardarNN(Set<int> seleccionados) async {
    final tablaLower = widget.tabla.toString().toLowerCase();
    final tablaRelacion = tablasNN[tablaLower]!;
    final tablaRelacionada = {
      "producto": "ingrediente",
      "orden": "producto",
      "insumo": "proveedor",
    }[tablaLower]!;

    final columnaA = "id_${widget.tabla.toString().toLowerCase()}";
    final columnaB = "id_$tablaRelacionada";

    await db.customUpdate(
      "DELETE FROM $tablaRelacion WHERE $columnaA = ?",
      variables: [_variableFromId(widget.id, pkType)],
    );

    for (var id in seleccionados) {
      await db.customInsert(
        "INSERT INTO $tablaRelacion ($columnaA, $columnaB) VALUES (?, ?)",
        variables: [_variableFromId(widget.id, pkType), Variable.withInt(id)],
      );
    }
  }
}