import 'package:drift/drift.dart' hide Column;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class FormularioGenerico extends ConsumerStatefulWidget {
  final String tabla;
  final dynamic id;
  const FormularioGenerico({super.key, required this.tabla, this.id});

  @override
  ConsumerState<FormularioGenerico> createState() => FormularioGenericoState();
}

class FormularioGenericoState extends ConsumerState<FormularioGenerico> {
  late AppDatabase db;

  List<Map<String, dynamic>> columnas = [];
  List<Map<String, dynamic>> foreignKeys = [];
  Map<String, TextEditingController> controllers = {};

  final Map<String, String> tablasNN = {};

  String filtro = "";

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
      pkName = "id";
      pkType = "INTEGER";
    } else {
      pkName = pkColumn["name"].toString();
      pkType = (pkColumn["type"] ?? "").toString().toUpperCase();
    }
  }

  Future<void> cargarColumnas() async {
    final result = await db
        .customSelect('PRAGMA table_info(${widget.tabla});')
        .get();
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
  if (widget.id == null) return;

  String query;
  List<Variable> variables = [];

  if (widget.id is Map<String, dynamic>) {
    final idMap = widget.id as Map<String, dynamic>;

    if (idMap["fk"] == null || idMap["pk"] == null) {
      mostrarSnackError("Error interno: PK compuesta no detectada.");
      return;
    }

    String pkPrim = '';
    String pkSec = '';
    int pk = 1;
    int discriminante = 1;

    if (widget.tabla == "Contacto"){
      final daoHelper = ref.read(daoHelperProvider);
      final idProveedor = await daoHelper.obtenerProveedorPorNombre(idMap["fk"]);
     pkPrim = "id_Proveedor";
     pkSec = "numero";
     pk = idProveedor;
     discriminante = idMap["pk"];
    }

    query = "SELECT * FROM ${widget.tabla} WHERE  $pkPrim = ? AND $pkSec = ?";

    variables = [
      variableFromDynamic(pk),
      variableFromDynamic(discriminante),
    ];
  } else {
    query = "SELECT * FROM ${widget.tabla} WHERE $pkName = ?";
    variables = [_variableFromId(widget.id, pkType)];
  }

  final row = await db.customSelect(query, variables: variables).getSingleOrNull();

  if (row != null) {
    row.data.forEach((key, value) {
      controllers[key]?.text = value?.toString() ?? "";
    });
  }
}


  Variable _variableFromId(dynamic idValue, String tipo) {
    if (idValue == null) return const Variable(null);
    if (tipo == "TEXT") {
      return Variable.withString(idValue.toString());
    } else {
      final v = (idValue is int) ? idValue : int.tryParse(idValue.toString());
      return Variable.withInt(v ?? 0);
    }
  }

  bool esFK(String columna) {
    return foreignKeys.any((fk) => fk["from"] == columna);
  }

  Map<String, dynamic>? getFK(String columna) {
    final fk = foreignKeys.firstWhere(
      (fk) => fk["from"] == columna,
      orElse: () => {},
    );
    return fk.isEmpty ? null : fk;
  }

Future<Widget> buildDropdownFK(String columna) async {
  final fk = getFK(columna);

  if (fk == null) {
    return Text(
      "Error FK en $columna",
      style: const TextStyle(color: Colors.red),
    );
  }

  final tablaFk = fk["table"].toString();
  final campoId = fk["to"].toString();

  final metaColumns = await db.customSelect("PRAGMA table_info($tablaFk)").get();
  final columnasFk = metaColumns.map((c) => c.data).toList();

  // Detectar la mejor columna para mostrar texto
  String? columnaDescripcion;
  for (var c in columnasFk) {
    final type = (c["type"] ?? "").toString().toUpperCase();
    if ((type.contains("CHAR") || type.contains("TEXT") || type.contains("VARCHAR"))
        && c["name"] != campoId) {
      if (c["name"] == "nombre" || c["name"] == "descripcion") {
        columnaDescripcion = c["name"];
        break;
      }
    }
  }

  columnaDescripcion ??= campoId;

  final opciones = await db.customSelect(
    "SELECT $campoId AS id, $columnaDescripcion AS nombre FROM $tablaFk",
  ).get();

  final listaOpciones = opciones
      .map((r) => r.data)
      .toList()
      .cast<Map<String, dynamic>>();

  final valorActual = int.tryParse(controllers[columna]!.text);

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: DropdownButtonFormField2<int>(
      isExpanded: true,
      decoration: Styles.createInputDecoration(columna, Colors.grey.shade300),

      value: valorActual,

      dropdownStyleData: const DropdownStyleData(
        maxHeight: 250,
      ),

      menuItemStyleData: const MenuItemStyleData(
        height: 48,
      ),

      items: listaOpciones.map((row) {
        final id = (row["id"] is int)
            ? row["id"] as int
            : int.tryParse(row["id"].toString());

        return DropdownMenuItem<int>(
          value: id,
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
    if (columnas.isEmpty) {
      return const AlertDialog(
        content: SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return buildFormulario();
  }

  Future<void> guardar() async {
    final valores = <String, dynamic>{};

    for (var col in columnas) {
      final nombre = col["name"];
      final raw = controllers[nombre]!.text.trim();
      final tipo = (col["type"] ?? "").toString().toUpperCase();

      if (col["pk"] == 1 && widget.id == null) continue;

      if (raw.isEmpty) {
        valores[nombre] = null;
        continue;
      }

      if (tipo.contains("INT")) {
        if (int.tryParse(raw) == null) {
          mostrarSnackError("El campo '$nombre' debe ser un número entero.");
          return;
        }
        valores[nombre] = int.parse(raw);
        continue;
      }

      if (tipo.contains("REAL") ||
          tipo.contains("FLOA") ||
          tipo.contains("DOUB")) {
        if (double.tryParse(raw) == null) {
          mostrarSnackError("El campo '$nombre' debe ser un número decimal.");
          return;
        }
        valores[nombre] = double.parse(raw);
        continue;
      }

      valores[nombre] = raw;
    }

    if (widget.id == null) {
      final columnasStr = valores.keys.join(", ");
      final placeholders = valores.keys.map((_) => "?").join(", ");

      final id = await db.customInsert(
        "INSERT INTO ${widget.tabla} ($columnasStr) VALUES ($placeholders);",
        variables: valores.values.map(variableFromDynamic).toList(),
      );

      procesoRealizado(id, widget.id);
    }
    else {
      final sets = valores.keys.map((k) => "$k = ?").join(", ");
      final variablePK = _variableFromId(widget.id, pkType);

      final id = await db.customUpdate(
        "UPDATE ${widget.tabla} SET $sets WHERE $pkName = ?;",
        variables: [...valores.values.map(variableFromDynamic), variablePK],
      );

      procesoRealizado(id, widget.id);
    }

    Navigator.pop(context, true);
  }

  void procesoRealizado(int? id, dynamic widgetId) {
    bool insert = widgetId == null;

    if (insert) {
      if (id != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Inserción en la tabla ${widget.tabla} realizada correctamente",
              style: Styles.snackText,
            ),
            backgroundColor: Styles.fondoOscuro,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Error en la inserción de la tabla ${widget.tabla}",
              style: Styles.snackText,),
            backgroundColor: Styles.contraste,
          ),
        );
      }
    } else {
      if (id != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Actualización en la tabla ${widget.tabla} realizada correctamente",
              style: Styles.snackText,
            ),
            backgroundColor: Styles.fondoOscuro,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Error en la actualización de la tabla ${widget.tabla}",
              style: Styles.snackText,
            ),
          ),
        );
      }
    }
  }

  void mostrarSnackError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mensaje, 
          style: Styles.snackText,), 
        backgroundColor: Styles.contraste),
    );
  }

  Variable variableFromDynamic(dynamic v) {
    if (v == null) return const Variable(null);
    if (v is int) return Variable.withInt(v);
    if (v is double) return Variable.withReal(v);
    if (v is String) return Variable.withString(v);
    return Variable.withString(v.toString());
  }

  Widget buildFormulario() {
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
            print(tipo);
            if (col["pk"] == 1) return const SizedBox.shrink();

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
                keyboardType: obtenerTextInput(tipo),
                controller: controllers[nombre],
                inputFormatters: [],
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

  TextInputType obtenerTextInput(String tipoDato) {
    tipoDato = tipoDato.toUpperCase().trim();
    if (tipoDato.contains("INT")) {
      return TextInputType.number;
    } else if (tipoDato.contains("DOUB") ||
        tipoDato.contains("FLOA") ||
        tipoDato.contains("REA")) {
      return TextInputType.numberWithOptions(decimal: true);
    }
    return TextInputType.text;
  }

  List<TextInputFormatter> obtenerInputFormatter(String? tipoDato) {
    if (tipoDato == null) return [];

    tipoDato = tipoDato.toUpperCase().trim();
    if (tipoDato.contains("INT")) {
      return [FilteringTextInputFormatter.digitsOnly];
    } else if (tipoDato.contains("DOUB") ||
        tipoDato.contains("FLOA") ||
        tipoDato.contains("REA")) {
      return [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))];
    }
    return [];
  }
}