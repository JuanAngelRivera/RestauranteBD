// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TablaErrorsTable extends TablaErrors
    with TableInfo<$TablaErrorsTable, TablaError> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TablaErrorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tabla_errors';
  @override
  VerificationContext validateIntegrity(
    Insertable<TablaError> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TablaError map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TablaError(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $TablaErrorsTable createAlias(String alias) {
    return $TablaErrorsTable(attachedDatabase, alias);
  }
}

class TablaError extends DataClass implements Insertable<TablaError> {
  final String id;
  final String? descripcion;
  const TablaError({required this.id, this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  TablaErrorsCompanion toCompanion(bool nullToAbsent) {
    return TablaErrorsCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory TablaError.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TablaError(
      id: serializer.fromJson<String>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  TablaError copyWith({
    String? id,
    Value<String?> descripcion = const Value.absent(),
  }) => TablaError(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  TablaError copyWithCompanion(TablaErrorsCompanion data) {
    return TablaError(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TablaError(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TablaError &&
          other.id == this.id &&
          other.descripcion == this.descripcion);
}

class TablaErrorsCompanion extends UpdateCompanion<TablaError> {
  final Value<String> id;
  final Value<String?> descripcion;
  final Value<int> rowid;
  const TablaErrorsCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TablaErrorsCompanion.insert({
    required String id,
    this.descripcion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<TablaError> custom({
    Expression<String>? id,
    Expression<String>? descripcion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TablaErrorsCompanion copyWith({
    Value<String>? id,
    Value<String?>? descripcion,
    Value<int>? rowid,
  }) {
    return TablaErrorsCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TablaErrorsCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MetodoPagosTable extends MetodoPagos
    with TableInfo<$MetodoPagosTable, MetodoPago> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetodoPagosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'metodo_pagos';
  @override
  VerificationContext validateIntegrity(
    Insertable<MetodoPago> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MetodoPago map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetodoPago(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $MetodoPagosTable createAlias(String alias) {
    return $MetodoPagosTable(attachedDatabase, alias);
  }
}

class MetodoPago extends DataClass implements Insertable<MetodoPago> {
  final int id;
  final String? descripcion;
  const MetodoPago({required this.id, this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  MetodoPagosCompanion toCompanion(bool nullToAbsent) {
    return MetodoPagosCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory MetodoPago.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MetodoPago(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  MetodoPago copyWith({
    int? id,
    Value<String?> descripcion = const Value.absent(),
  }) => MetodoPago(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  MetodoPago copyWithCompanion(MetodoPagosCompanion data) {
    return MetodoPago(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MetodoPago(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MetodoPago &&
          other.id == this.id &&
          other.descripcion == this.descripcion);
}

class MetodoPagosCompanion extends UpdateCompanion<MetodoPago> {
  final Value<int> id;
  final Value<String?> descripcion;
  const MetodoPagosCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  MetodoPagosCompanion.insert({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<MetodoPago> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  MetodoPagosCompanion copyWith({Value<int>? id, Value<String?>? descripcion}) {
    return MetodoPagosCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetodoPagosCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $CherryLocalsTable extends CherryLocals
    with TableInfo<$CherryLocalsTable, CherryLocal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CherryLocalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, direccion, nombre, telefono];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cherry_locals';
  @override
  VerificationContext validateIntegrity(
    Insertable<CherryLocal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CherryLocal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CherryLocal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      ),
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
    );
  }

  @override
  $CherryLocalsTable createAlias(String alias) {
    return $CherryLocalsTable(attachedDatabase, alias);
  }
}

class CherryLocal extends DataClass implements Insertable<CherryLocal> {
  final int id;
  final String? direccion;
  final String? nombre;
  final String? telefono;
  const CherryLocal({
    required this.id,
    this.direccion,
    this.nombre,
    this.telefono,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    return map;
  }

  CherryLocalsCompanion toCompanion(bool nullToAbsent) {
    return CherryLocalsCompanion(
      id: Value(id),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
    );
  }

  factory CherryLocal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CherryLocal(
      id: serializer.fromJson<int>(json['id']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      telefono: serializer.fromJson<String?>(json['telefono']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'direccion': serializer.toJson<String?>(direccion),
      'nombre': serializer.toJson<String?>(nombre),
      'telefono': serializer.toJson<String?>(telefono),
    };
  }

  CherryLocal copyWith({
    int? id,
    Value<String?> direccion = const Value.absent(),
    Value<String?> nombre = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
  }) => CherryLocal(
    id: id ?? this.id,
    direccion: direccion.present ? direccion.value : this.direccion,
    nombre: nombre.present ? nombre.value : this.nombre,
    telefono: telefono.present ? telefono.value : this.telefono,
  );
  CherryLocal copyWithCompanion(CherryLocalsCompanion data) {
    return CherryLocal(
      id: data.id.present ? data.id.value : this.id,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CherryLocal(')
          ..write('id: $id, ')
          ..write('direccion: $direccion, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, direccion, nombre, telefono);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CherryLocal &&
          other.id == this.id &&
          other.direccion == this.direccion &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono);
}

class CherryLocalsCompanion extends UpdateCompanion<CherryLocal> {
  final Value<int> id;
  final Value<String?> direccion;
  final Value<String?> nombre;
  final Value<String?> telefono;
  const CherryLocalsCompanion({
    this.id = const Value.absent(),
    this.direccion = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
  });
  CherryLocalsCompanion.insert({
    this.id = const Value.absent(),
    this.direccion = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
  });
  static Insertable<CherryLocal> custom({
    Expression<int>? id,
    Expression<String>? direccion,
    Expression<String>? nombre,
    Expression<String>? telefono,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (direccion != null) 'direccion': direccion,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
    });
  }

  CherryLocalsCompanion copyWith({
    Value<int>? id,
    Value<String?>? direccion,
    Value<String?>? nombre,
    Value<String?>? telefono,
  }) {
    return CherryLocalsCompanion(
      id: id ?? this.id,
      direccion: direccion ?? this.direccion,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CherryLocalsCompanion(')
          ..write('id: $id, ')
          ..write('direccion: $direccion, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }
}

class $RolsTable extends Rols with TableInfo<$RolsTable, Rol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sueldoMeta = const VerificationMeta('sueldo');
  @override
  late final GeneratedColumn<double> sueldo = GeneratedColumn<double>(
    'sueldo',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, descripcion, sueldo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rols';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('sueldo')) {
      context.handle(
        _sueldoMeta,
        sueldo.isAcceptableOrUnknown(data['sueldo']!, _sueldoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rol(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      sueldo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sueldo'],
      ),
    );
  }

  @override
  $RolsTable createAlias(String alias) {
    return $RolsTable(attachedDatabase, alias);
  }
}

class Rol extends DataClass implements Insertable<Rol> {
  final int id;
  final String? descripcion;
  final double? sueldo;
  const Rol({required this.id, this.descripcion, this.sueldo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || sueldo != null) {
      map['sueldo'] = Variable<double>(sueldo);
    }
    return map;
  }

  RolsCompanion toCompanion(bool nullToAbsent) {
    return RolsCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      sueldo: sueldo == null && nullToAbsent
          ? const Value.absent()
          : Value(sueldo),
    );
  }

  factory Rol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rol(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      sueldo: serializer.fromJson<double?>(json['sueldo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
      'sueldo': serializer.toJson<double?>(sueldo),
    };
  }

  Rol copyWith({
    int? id,
    Value<String?> descripcion = const Value.absent(),
    Value<double?> sueldo = const Value.absent(),
  }) => Rol(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    sueldo: sueldo.present ? sueldo.value : this.sueldo,
  );
  Rol copyWithCompanion(RolsCompanion data) {
    return Rol(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      sueldo: data.sueldo.present ? data.sueldo.value : this.sueldo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rol(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('sueldo: $sueldo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion, sueldo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rol &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.sueldo == this.sueldo);
}

class RolsCompanion extends UpdateCompanion<Rol> {
  final Value<int> id;
  final Value<String?> descripcion;
  final Value<double?> sueldo;
  const RolsCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.sueldo = const Value.absent(),
  });
  RolsCompanion.insert({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.sueldo = const Value.absent(),
  });
  static Insertable<Rol> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
    Expression<double>? sueldo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (sueldo != null) 'sueldo': sueldo,
    });
  }

  RolsCompanion copyWith({
    Value<int>? id,
    Value<String?>? descripcion,
    Value<double?>? sueldo,
  }) {
    return RolsCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      sueldo: sueldo ?? this.sueldo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (sueldo.present) {
      map['sueldo'] = Variable<double>(sueldo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolsCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('sueldo: $sueldo')
          ..write(')'))
        .toString();
  }
}

class $TurnosTable extends Turnos with TableInfo<$TurnosTable, Turno> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TurnosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _horaInicioMeta = const VerificationMeta(
    'horaInicio',
  );
  @override
  late final GeneratedColumn<String> horaInicio = GeneratedColumn<String>(
    'hora_inicio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _horaFinMeta = const VerificationMeta(
    'horaFin',
  );
  @override
  late final GeneratedColumn<String> horaFin = GeneratedColumn<String>(
    'hora_fin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, horaInicio, horaFin, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'turnos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Turno> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hora_inicio')) {
      context.handle(
        _horaInicioMeta,
        horaInicio.isAcceptableOrUnknown(data['hora_inicio']!, _horaInicioMeta),
      );
    }
    if (data.containsKey('hora_fin')) {
      context.handle(
        _horaFinMeta,
        horaFin.isAcceptableOrUnknown(data['hora_fin']!, _horaFinMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Turno map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Turno(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      horaInicio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_inicio'],
      ),
      horaFin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hora_fin'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $TurnosTable createAlias(String alias) {
    return $TurnosTable(attachedDatabase, alias);
  }
}

class Turno extends DataClass implements Insertable<Turno> {
  final int id;
  final String? horaInicio;
  final String? horaFin;
  final String? descripcion;
  const Turno({
    required this.id,
    this.horaInicio,
    this.horaFin,
    this.descripcion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || horaInicio != null) {
      map['hora_inicio'] = Variable<String>(horaInicio);
    }
    if (!nullToAbsent || horaFin != null) {
      map['hora_fin'] = Variable<String>(horaFin);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  TurnosCompanion toCompanion(bool nullToAbsent) {
    return TurnosCompanion(
      id: Value(id),
      horaInicio: horaInicio == null && nullToAbsent
          ? const Value.absent()
          : Value(horaInicio),
      horaFin: horaFin == null && nullToAbsent
          ? const Value.absent()
          : Value(horaFin),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory Turno.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Turno(
      id: serializer.fromJson<int>(json['id']),
      horaInicio: serializer.fromJson<String?>(json['horaInicio']),
      horaFin: serializer.fromJson<String?>(json['horaFin']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'horaInicio': serializer.toJson<String?>(horaInicio),
      'horaFin': serializer.toJson<String?>(horaFin),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  Turno copyWith({
    int? id,
    Value<String?> horaInicio = const Value.absent(),
    Value<String?> horaFin = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
  }) => Turno(
    id: id ?? this.id,
    horaInicio: horaInicio.present ? horaInicio.value : this.horaInicio,
    horaFin: horaFin.present ? horaFin.value : this.horaFin,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  Turno copyWithCompanion(TurnosCompanion data) {
    return Turno(
      id: data.id.present ? data.id.value : this.id,
      horaInicio: data.horaInicio.present
          ? data.horaInicio.value
          : this.horaInicio,
      horaFin: data.horaFin.present ? data.horaFin.value : this.horaFin,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Turno(')
          ..write('id: $id, ')
          ..write('horaInicio: $horaInicio, ')
          ..write('horaFin: $horaFin, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, horaInicio, horaFin, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Turno &&
          other.id == this.id &&
          other.horaInicio == this.horaInicio &&
          other.horaFin == this.horaFin &&
          other.descripcion == this.descripcion);
}

class TurnosCompanion extends UpdateCompanion<Turno> {
  final Value<int> id;
  final Value<String?> horaInicio;
  final Value<String?> horaFin;
  final Value<String?> descripcion;
  const TurnosCompanion({
    this.id = const Value.absent(),
    this.horaInicio = const Value.absent(),
    this.horaFin = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  TurnosCompanion.insert({
    this.id = const Value.absent(),
    this.horaInicio = const Value.absent(),
    this.horaFin = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<Turno> custom({
    Expression<int>? id,
    Expression<String>? horaInicio,
    Expression<String>? horaFin,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (horaInicio != null) 'hora_inicio': horaInicio,
      if (horaFin != null) 'hora_fin': horaFin,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  TurnosCompanion copyWith({
    Value<int>? id,
    Value<String?>? horaInicio,
    Value<String?>? horaFin,
    Value<String?>? descripcion,
  }) {
    return TurnosCompanion(
      id: id ?? this.id,
      horaInicio: horaInicio ?? this.horaInicio,
      horaFin: horaFin ?? this.horaFin,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (horaInicio.present) {
      map['hora_inicio'] = Variable<String>(horaInicio.value);
    }
    if (horaFin.present) {
      map['hora_fin'] = Variable<String>(horaFin.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TurnosCompanion(')
          ..write('id: $id, ')
          ..write('horaInicio: $horaInicio, ')
          ..write('horaFin: $horaFin, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $BonusesTable extends Bonuses with TableInfo<$BonusesTable, Bonuse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BonusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _valorMeta = const VerificationMeta('valor');
  @override
  late final GeneratedColumn<double> valor = GeneratedColumn<double>(
    'valor',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, valor, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bonuses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bonuse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('valor')) {
      context.handle(
        _valorMeta,
        valor.isAcceptableOrUnknown(data['valor']!, _valorMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bonuse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bonuse(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      valor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $BonusesTable createAlias(String alias) {
    return $BonusesTable(attachedDatabase, alias);
  }
}

class Bonuse extends DataClass implements Insertable<Bonuse> {
  final int id;
  final double? valor;
  final String? descripcion;
  const Bonuse({required this.id, this.valor, this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || valor != null) {
      map['valor'] = Variable<double>(valor);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  BonusesCompanion toCompanion(bool nullToAbsent) {
    return BonusesCompanion(
      id: Value(id),
      valor: valor == null && nullToAbsent
          ? const Value.absent()
          : Value(valor),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory Bonuse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bonuse(
      id: serializer.fromJson<int>(json['id']),
      valor: serializer.fromJson<double?>(json['valor']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'valor': serializer.toJson<double?>(valor),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  Bonuse copyWith({
    int? id,
    Value<double?> valor = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
  }) => Bonuse(
    id: id ?? this.id,
    valor: valor.present ? valor.value : this.valor,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  Bonuse copyWithCompanion(BonusesCompanion data) {
    return Bonuse(
      id: data.id.present ? data.id.value : this.id,
      valor: data.valor.present ? data.valor.value : this.valor,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bonuse(')
          ..write('id: $id, ')
          ..write('valor: $valor, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, valor, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bonuse &&
          other.id == this.id &&
          other.valor == this.valor &&
          other.descripcion == this.descripcion);
}

class BonusesCompanion extends UpdateCompanion<Bonuse> {
  final Value<int> id;
  final Value<double?> valor;
  final Value<String?> descripcion;
  const BonusesCompanion({
    this.id = const Value.absent(),
    this.valor = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  BonusesCompanion.insert({
    this.id = const Value.absent(),
    this.valor = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<Bonuse> custom({
    Expression<int>? id,
    Expression<double>? valor,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (valor != null) 'valor': valor,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  BonusesCompanion copyWith({
    Value<int>? id,
    Value<double?>? valor,
    Value<String?>? descripcion,
  }) {
    return BonusesCompanion(
      id: id ?? this.id,
      valor: valor ?? this.valor,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (valor.present) {
      map['valor'] = Variable<double>(valor.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BonusesCompanion(')
          ..write('id: $id, ')
          ..write('valor: $valor, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $EmpleadosTable extends Empleados
    with TableInfo<$EmpleadosTable, Empleado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmpleadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _curpMeta = const VerificationMeta('curp');
  @override
  late final GeneratedColumn<String> curp = GeneratedColumn<String>(
    'curp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _rfcMeta = const VerificationMeta('rfc');
  @override
  late final GeneratedColumn<String> rfc = GeneratedColumn<String>(
    'rfc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _fechaIngresoMeta = const VerificationMeta(
    'fechaIngreso',
  );
  @override
  late final GeneratedColumn<String> fechaIngreso = GeneratedColumn<String>(
    'fecha_ingreso',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nssMeta = const VerificationMeta('nss');
  @override
  late final GeneratedColumn<String> nss = GeneratedColumn<String>(
    'nss',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
    'foto',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idRolMeta = const VerificationMeta('idRol');
  @override
  late final GeneratedColumn<int> idRol = GeneratedColumn<int>(
    'id_rol',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rols (id)',
    ),
  );
  static const VerificationMeta _idTurnoMeta = const VerificationMeta(
    'idTurno',
  );
  @override
  late final GeneratedColumn<int> idTurno = GeneratedColumn<int>(
    'id_turno',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES turnos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    telefono,
    curp,
    rfc,
    fechaIngreso,
    nss,
    foto,
    idRol,
    idTurno,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'empleados';
  @override
  VerificationContext validateIntegrity(
    Insertable<Empleado> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    if (data.containsKey('curp')) {
      context.handle(
        _curpMeta,
        curp.isAcceptableOrUnknown(data['curp']!, _curpMeta),
      );
    } else if (isInserting) {
      context.missing(_curpMeta);
    }
    if (data.containsKey('rfc')) {
      context.handle(
        _rfcMeta,
        rfc.isAcceptableOrUnknown(data['rfc']!, _rfcMeta),
      );
    } else if (isInserting) {
      context.missing(_rfcMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
        _fechaIngresoMeta,
        fechaIngreso.isAcceptableOrUnknown(
          data['fecha_ingreso']!,
          _fechaIngresoMeta,
        ),
      );
    }
    if (data.containsKey('nss')) {
      context.handle(
        _nssMeta,
        nss.isAcceptableOrUnknown(data['nss']!, _nssMeta),
      );
    } else if (isInserting) {
      context.missing(_nssMeta);
    }
    if (data.containsKey('foto')) {
      context.handle(
        _fotoMeta,
        foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta),
      );
    }
    if (data.containsKey('id_rol')) {
      context.handle(
        _idRolMeta,
        idRol.isAcceptableOrUnknown(data['id_rol']!, _idRolMeta),
      );
    }
    if (data.containsKey('id_turno')) {
      context.handle(
        _idTurnoMeta,
        idTurno.isAcceptableOrUnknown(data['id_turno']!, _idTurnoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Empleado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Empleado(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
      curp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}curp'],
      )!,
      rfc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rfc'],
      )!,
      fechaIngreso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_ingreso'],
      ),
      nss: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nss'],
      )!,
      foto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto'],
      ),
      idRol: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_rol'],
      ),
      idTurno: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_turno'],
      ),
    );
  }

  @override
  $EmpleadosTable createAlias(String alias) {
    return $EmpleadosTable(attachedDatabase, alias);
  }
}

class Empleado extends DataClass implements Insertable<Empleado> {
  final int id;
  final String? nombre;
  final String? telefono;
  final String curp;
  final String rfc;
  final String? fechaIngreso;
  final String nss;
  final String? foto;
  final int? idRol;
  final int? idTurno;
  const Empleado({
    required this.id,
    this.nombre,
    this.telefono,
    required this.curp,
    required this.rfc,
    this.fechaIngreso,
    required this.nss,
    this.foto,
    this.idRol,
    this.idTurno,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    map['curp'] = Variable<String>(curp);
    map['rfc'] = Variable<String>(rfc);
    if (!nullToAbsent || fechaIngreso != null) {
      map['fecha_ingreso'] = Variable<String>(fechaIngreso);
    }
    map['nss'] = Variable<String>(nss);
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String>(foto);
    }
    if (!nullToAbsent || idRol != null) {
      map['id_rol'] = Variable<int>(idRol);
    }
    if (!nullToAbsent || idTurno != null) {
      map['id_turno'] = Variable<int>(idTurno);
    }
    return map;
  }

  EmpleadosCompanion toCompanion(bool nullToAbsent) {
    return EmpleadosCompanion(
      id: Value(id),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      curp: Value(curp),
      rfc: Value(rfc),
      fechaIngreso: fechaIngreso == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaIngreso),
      nss: Value(nss),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
      idRol: idRol == null && nullToAbsent
          ? const Value.absent()
          : Value(idRol),
      idTurno: idTurno == null && nullToAbsent
          ? const Value.absent()
          : Value(idTurno),
    );
  }

  factory Empleado.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Empleado(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      curp: serializer.fromJson<String>(json['curp']),
      rfc: serializer.fromJson<String>(json['rfc']),
      fechaIngreso: serializer.fromJson<String?>(json['fechaIngreso']),
      nss: serializer.fromJson<String>(json['nss']),
      foto: serializer.fromJson<String?>(json['foto']),
      idRol: serializer.fromJson<int?>(json['idRol']),
      idTurno: serializer.fromJson<int?>(json['idTurno']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String?>(nombre),
      'telefono': serializer.toJson<String?>(telefono),
      'curp': serializer.toJson<String>(curp),
      'rfc': serializer.toJson<String>(rfc),
      'fechaIngreso': serializer.toJson<String?>(fechaIngreso),
      'nss': serializer.toJson<String>(nss),
      'foto': serializer.toJson<String?>(foto),
      'idRol': serializer.toJson<int?>(idRol),
      'idTurno': serializer.toJson<int?>(idTurno),
    };
  }

  Empleado copyWith({
    int? id,
    Value<String?> nombre = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
    String? curp,
    String? rfc,
    Value<String?> fechaIngreso = const Value.absent(),
    String? nss,
    Value<String?> foto = const Value.absent(),
    Value<int?> idRol = const Value.absent(),
    Value<int?> idTurno = const Value.absent(),
  }) => Empleado(
    id: id ?? this.id,
    nombre: nombre.present ? nombre.value : this.nombre,
    telefono: telefono.present ? telefono.value : this.telefono,
    curp: curp ?? this.curp,
    rfc: rfc ?? this.rfc,
    fechaIngreso: fechaIngreso.present ? fechaIngreso.value : this.fechaIngreso,
    nss: nss ?? this.nss,
    foto: foto.present ? foto.value : this.foto,
    idRol: idRol.present ? idRol.value : this.idRol,
    idTurno: idTurno.present ? idTurno.value : this.idTurno,
  );
  Empleado copyWithCompanion(EmpleadosCompanion data) {
    return Empleado(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      curp: data.curp.present ? data.curp.value : this.curp,
      rfc: data.rfc.present ? data.rfc.value : this.rfc,
      fechaIngreso: data.fechaIngreso.present
          ? data.fechaIngreso.value
          : this.fechaIngreso,
      nss: data.nss.present ? data.nss.value : this.nss,
      foto: data.foto.present ? data.foto.value : this.foto,
      idRol: data.idRol.present ? data.idRol.value : this.idRol,
      idTurno: data.idTurno.present ? data.idTurno.value : this.idTurno,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Empleado(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono, ')
          ..write('curp: $curp, ')
          ..write('rfc: $rfc, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('nss: $nss, ')
          ..write('foto: $foto, ')
          ..write('idRol: $idRol, ')
          ..write('idTurno: $idTurno')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nombre,
    telefono,
    curp,
    rfc,
    fechaIngreso,
    nss,
    foto,
    idRol,
    idTurno,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Empleado &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono &&
          other.curp == this.curp &&
          other.rfc == this.rfc &&
          other.fechaIngreso == this.fechaIngreso &&
          other.nss == this.nss &&
          other.foto == this.foto &&
          other.idRol == this.idRol &&
          other.idTurno == this.idTurno);
}

class EmpleadosCompanion extends UpdateCompanion<Empleado> {
  final Value<int> id;
  final Value<String?> nombre;
  final Value<String?> telefono;
  final Value<String> curp;
  final Value<String> rfc;
  final Value<String?> fechaIngreso;
  final Value<String> nss;
  final Value<String?> foto;
  final Value<int?> idRol;
  final Value<int?> idTurno;
  const EmpleadosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
    this.curp = const Value.absent(),
    this.rfc = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.nss = const Value.absent(),
    this.foto = const Value.absent(),
    this.idRol = const Value.absent(),
    this.idTurno = const Value.absent(),
  });
  EmpleadosCompanion.insert({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
    required String curp,
    required String rfc,
    this.fechaIngreso = const Value.absent(),
    required String nss,
    this.foto = const Value.absent(),
    this.idRol = const Value.absent(),
    this.idTurno = const Value.absent(),
  }) : curp = Value(curp),
       rfc = Value(rfc),
       nss = Value(nss);
  static Insertable<Empleado> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? telefono,
    Expression<String>? curp,
    Expression<String>? rfc,
    Expression<String>? fechaIngreso,
    Expression<String>? nss,
    Expression<String>? foto,
    Expression<int>? idRol,
    Expression<int>? idTurno,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
      if (curp != null) 'curp': curp,
      if (rfc != null) 'rfc': rfc,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (nss != null) 'nss': nss,
      if (foto != null) 'foto': foto,
      if (idRol != null) 'id_rol': idRol,
      if (idTurno != null) 'id_turno': idTurno,
    });
  }

  EmpleadosCompanion copyWith({
    Value<int>? id,
    Value<String?>? nombre,
    Value<String?>? telefono,
    Value<String>? curp,
    Value<String>? rfc,
    Value<String?>? fechaIngreso,
    Value<String>? nss,
    Value<String?>? foto,
    Value<int?>? idRol,
    Value<int?>? idTurno,
  }) {
    return EmpleadosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      curp: curp ?? this.curp,
      rfc: rfc ?? this.rfc,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      nss: nss ?? this.nss,
      foto: foto ?? this.foto,
      idRol: idRol ?? this.idRol,
      idTurno: idTurno ?? this.idTurno,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (curp.present) {
      map['curp'] = Variable<String>(curp.value);
    }
    if (rfc.present) {
      map['rfc'] = Variable<String>(rfc.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<String>(fechaIngreso.value);
    }
    if (nss.present) {
      map['nss'] = Variable<String>(nss.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    if (idRol.present) {
      map['id_rol'] = Variable<int>(idRol.value);
    }
    if (idTurno.present) {
      map['id_turno'] = Variable<int>(idTurno.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmpleadosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono, ')
          ..write('curp: $curp, ')
          ..write('rfc: $rfc, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('nss: $nss, ')
          ..write('foto: $foto, ')
          ..write('idRol: $idRol, ')
          ..write('idTurno: $idTurno')
          ..write(')'))
        .toString();
  }
}

class $NominasTable extends Nominas with TableInfo<$NominasTable, Nomina> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NominasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEmpleadoMeta = const VerificationMeta(
    'idEmpleado',
  );
  @override
  late final GeneratedColumn<int> idEmpleado = GeneratedColumn<int>(
    'id_empleado',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES empleados (id)',
    ),
  );
  static const VerificationMeta _fechaPagoMeta = const VerificationMeta(
    'fechaPago',
  );
  @override
  late final GeneratedColumn<String> fechaPago = GeneratedColumn<String>(
    'fecha_pago',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salarioTotalMeta = const VerificationMeta(
    'salarioTotal',
  );
  @override
  late final GeneratedColumn<double> salarioTotal = GeneratedColumn<double>(
    'salario_total',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [idEmpleado, fechaPago, salarioTotal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nominas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Nomina> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_empleado')) {
      context.handle(
        _idEmpleadoMeta,
        idEmpleado.isAcceptableOrUnknown(data['id_empleado']!, _idEmpleadoMeta),
      );
    } else if (isInserting) {
      context.missing(_idEmpleadoMeta);
    }
    if (data.containsKey('fecha_pago')) {
      context.handle(
        _fechaPagoMeta,
        fechaPago.isAcceptableOrUnknown(data['fecha_pago']!, _fechaPagoMeta),
      );
    } else if (isInserting) {
      context.missing(_fechaPagoMeta);
    }
    if (data.containsKey('salario_total')) {
      context.handle(
        _salarioTotalMeta,
        salarioTotal.isAcceptableOrUnknown(
          data['salario_total']!,
          _salarioTotalMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEmpleado, fechaPago};
  @override
  Nomina map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Nomina(
      idEmpleado: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_empleado'],
      )!,
      fechaPago: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_pago'],
      )!,
      salarioTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}salario_total'],
      ),
    );
  }

  @override
  $NominasTable createAlias(String alias) {
    return $NominasTable(attachedDatabase, alias);
  }
}

class Nomina extends DataClass implements Insertable<Nomina> {
  final int idEmpleado;
  final String fechaPago;
  final double? salarioTotal;
  const Nomina({
    required this.idEmpleado,
    required this.fechaPago,
    this.salarioTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_empleado'] = Variable<int>(idEmpleado);
    map['fecha_pago'] = Variable<String>(fechaPago);
    if (!nullToAbsent || salarioTotal != null) {
      map['salario_total'] = Variable<double>(salarioTotal);
    }
    return map;
  }

  NominasCompanion toCompanion(bool nullToAbsent) {
    return NominasCompanion(
      idEmpleado: Value(idEmpleado),
      fechaPago: Value(fechaPago),
      salarioTotal: salarioTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(salarioTotal),
    );
  }

  factory Nomina.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nomina(
      idEmpleado: serializer.fromJson<int>(json['idEmpleado']),
      fechaPago: serializer.fromJson<String>(json['fechaPago']),
      salarioTotal: serializer.fromJson<double?>(json['salarioTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEmpleado': serializer.toJson<int>(idEmpleado),
      'fechaPago': serializer.toJson<String>(fechaPago),
      'salarioTotal': serializer.toJson<double?>(salarioTotal),
    };
  }

  Nomina copyWith({
    int? idEmpleado,
    String? fechaPago,
    Value<double?> salarioTotal = const Value.absent(),
  }) => Nomina(
    idEmpleado: idEmpleado ?? this.idEmpleado,
    fechaPago: fechaPago ?? this.fechaPago,
    salarioTotal: salarioTotal.present ? salarioTotal.value : this.salarioTotal,
  );
  Nomina copyWithCompanion(NominasCompanion data) {
    return Nomina(
      idEmpleado: data.idEmpleado.present
          ? data.idEmpleado.value
          : this.idEmpleado,
      fechaPago: data.fechaPago.present ? data.fechaPago.value : this.fechaPago,
      salarioTotal: data.salarioTotal.present
          ? data.salarioTotal.value
          : this.salarioTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Nomina(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('fechaPago: $fechaPago, ')
          ..write('salarioTotal: $salarioTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idEmpleado, fechaPago, salarioTotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nomina &&
          other.idEmpleado == this.idEmpleado &&
          other.fechaPago == this.fechaPago &&
          other.salarioTotal == this.salarioTotal);
}

class NominasCompanion extends UpdateCompanion<Nomina> {
  final Value<int> idEmpleado;
  final Value<String> fechaPago;
  final Value<double?> salarioTotal;
  final Value<int> rowid;
  const NominasCompanion({
    this.idEmpleado = const Value.absent(),
    this.fechaPago = const Value.absent(),
    this.salarioTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NominasCompanion.insert({
    required int idEmpleado,
    required String fechaPago,
    this.salarioTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idEmpleado = Value(idEmpleado),
       fechaPago = Value(fechaPago);
  static Insertable<Nomina> custom({
    Expression<int>? idEmpleado,
    Expression<String>? fechaPago,
    Expression<double>? salarioTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idEmpleado != null) 'id_empleado': idEmpleado,
      if (fechaPago != null) 'fecha_pago': fechaPago,
      if (salarioTotal != null) 'salario_total': salarioTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NominasCompanion copyWith({
    Value<int>? idEmpleado,
    Value<String>? fechaPago,
    Value<double?>? salarioTotal,
    Value<int>? rowid,
  }) {
    return NominasCompanion(
      idEmpleado: idEmpleado ?? this.idEmpleado,
      fechaPago: fechaPago ?? this.fechaPago,
      salarioTotal: salarioTotal ?? this.salarioTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEmpleado.present) {
      map['id_empleado'] = Variable<int>(idEmpleado.value);
    }
    if (fechaPago.present) {
      map['fecha_pago'] = Variable<String>(fechaPago.value);
    }
    if (salarioTotal.present) {
      map['salario_total'] = Variable<double>(salarioTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NominasCompanion(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('fechaPago: $fechaPago, ')
          ..write('salarioTotal: $salarioTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BeneficiosTable extends Beneficios
    with TableInfo<$BeneficiosTable, Beneficio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BeneficiosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEmpleadoMeta = const VerificationMeta(
    'idEmpleado',
  );
  @override
  late final GeneratedColumn<int> idEmpleado = GeneratedColumn<int>(
    'id_empleado',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES nominas (id_empleado)',
    ),
  );
  static const VerificationMeta _fechaPagoNominaMeta = const VerificationMeta(
    'fechaPagoNomina',
  );
  @override
  late final GeneratedColumn<String> fechaPagoNomina = GeneratedColumn<String>(
    'fecha_pago_nomina',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES nominas (fecha_pago)',
    ),
  );
  static const VerificationMeta _idBonusMeta = const VerificationMeta(
    'idBonus',
  );
  @override
  late final GeneratedColumn<int> idBonus = GeneratedColumn<int>(
    'id_bonus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bonuses (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idEmpleado, fechaPagoNomina, idBonus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'beneficios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Beneficio> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_empleado')) {
      context.handle(
        _idEmpleadoMeta,
        idEmpleado.isAcceptableOrUnknown(data['id_empleado']!, _idEmpleadoMeta),
      );
    } else if (isInserting) {
      context.missing(_idEmpleadoMeta);
    }
    if (data.containsKey('fecha_pago_nomina')) {
      context.handle(
        _fechaPagoNominaMeta,
        fechaPagoNomina.isAcceptableOrUnknown(
          data['fecha_pago_nomina']!,
          _fechaPagoNominaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaPagoNominaMeta);
    }
    if (data.containsKey('id_bonus')) {
      context.handle(
        _idBonusMeta,
        idBonus.isAcceptableOrUnknown(data['id_bonus']!, _idBonusMeta),
      );
    } else if (isInserting) {
      context.missing(_idBonusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    idEmpleado,
    fechaPagoNomina,
    idBonus,
  };
  @override
  Beneficio map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Beneficio(
      idEmpleado: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_empleado'],
      )!,
      fechaPagoNomina: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_pago_nomina'],
      )!,
      idBonus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_bonus'],
      )!,
    );
  }

  @override
  $BeneficiosTable createAlias(String alias) {
    return $BeneficiosTable(attachedDatabase, alias);
  }
}

class Beneficio extends DataClass implements Insertable<Beneficio> {
  final int idEmpleado;
  final String fechaPagoNomina;
  final int idBonus;
  const Beneficio({
    required this.idEmpleado,
    required this.fechaPagoNomina,
    required this.idBonus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_empleado'] = Variable<int>(idEmpleado);
    map['fecha_pago_nomina'] = Variable<String>(fechaPagoNomina);
    map['id_bonus'] = Variable<int>(idBonus);
    return map;
  }

  BeneficiosCompanion toCompanion(bool nullToAbsent) {
    return BeneficiosCompanion(
      idEmpleado: Value(idEmpleado),
      fechaPagoNomina: Value(fechaPagoNomina),
      idBonus: Value(idBonus),
    );
  }

  factory Beneficio.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Beneficio(
      idEmpleado: serializer.fromJson<int>(json['idEmpleado']),
      fechaPagoNomina: serializer.fromJson<String>(json['fechaPagoNomina']),
      idBonus: serializer.fromJson<int>(json['idBonus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEmpleado': serializer.toJson<int>(idEmpleado),
      'fechaPagoNomina': serializer.toJson<String>(fechaPagoNomina),
      'idBonus': serializer.toJson<int>(idBonus),
    };
  }

  Beneficio copyWith({
    int? idEmpleado,
    String? fechaPagoNomina,
    int? idBonus,
  }) => Beneficio(
    idEmpleado: idEmpleado ?? this.idEmpleado,
    fechaPagoNomina: fechaPagoNomina ?? this.fechaPagoNomina,
    idBonus: idBonus ?? this.idBonus,
  );
  Beneficio copyWithCompanion(BeneficiosCompanion data) {
    return Beneficio(
      idEmpleado: data.idEmpleado.present
          ? data.idEmpleado.value
          : this.idEmpleado,
      fechaPagoNomina: data.fechaPagoNomina.present
          ? data.fechaPagoNomina.value
          : this.fechaPagoNomina,
      idBonus: data.idBonus.present ? data.idBonus.value : this.idBonus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Beneficio(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('fechaPagoNomina: $fechaPagoNomina, ')
          ..write('idBonus: $idBonus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idEmpleado, fechaPagoNomina, idBonus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Beneficio &&
          other.idEmpleado == this.idEmpleado &&
          other.fechaPagoNomina == this.fechaPagoNomina &&
          other.idBonus == this.idBonus);
}

class BeneficiosCompanion extends UpdateCompanion<Beneficio> {
  final Value<int> idEmpleado;
  final Value<String> fechaPagoNomina;
  final Value<int> idBonus;
  final Value<int> rowid;
  const BeneficiosCompanion({
    this.idEmpleado = const Value.absent(),
    this.fechaPagoNomina = const Value.absent(),
    this.idBonus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BeneficiosCompanion.insert({
    required int idEmpleado,
    required String fechaPagoNomina,
    required int idBonus,
    this.rowid = const Value.absent(),
  }) : idEmpleado = Value(idEmpleado),
       fechaPagoNomina = Value(fechaPagoNomina),
       idBonus = Value(idBonus);
  static Insertable<Beneficio> custom({
    Expression<int>? idEmpleado,
    Expression<String>? fechaPagoNomina,
    Expression<int>? idBonus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idEmpleado != null) 'id_empleado': idEmpleado,
      if (fechaPagoNomina != null) 'fecha_pago_nomina': fechaPagoNomina,
      if (idBonus != null) 'id_bonus': idBonus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BeneficiosCompanion copyWith({
    Value<int>? idEmpleado,
    Value<String>? fechaPagoNomina,
    Value<int>? idBonus,
    Value<int>? rowid,
  }) {
    return BeneficiosCompanion(
      idEmpleado: idEmpleado ?? this.idEmpleado,
      fechaPagoNomina: fechaPagoNomina ?? this.fechaPagoNomina,
      idBonus: idBonus ?? this.idBonus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEmpleado.present) {
      map['id_empleado'] = Variable<int>(idEmpleado.value);
    }
    if (fechaPagoNomina.present) {
      map['fecha_pago_nomina'] = Variable<String>(fechaPagoNomina.value);
    }
    if (idBonus.present) {
      map['id_bonus'] = Variable<int>(idBonus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BeneficiosCompanion(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('fechaPagoNomina: $fechaPagoNomina, ')
          ..write('idBonus: $idBonus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuentasTable extends Cuentas with TableInfo<$CuentasTable, Cuenta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuentasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEmpleadoMeta = const VerificationMeta(
    'idEmpleado',
  );
  @override
  late final GeneratedColumn<int> idEmpleado = GeneratedColumn<int>(
    'id_empleado',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES empleados (id)',
    ),
  );
  static const VerificationMeta _nombreUsuarioMeta = const VerificationMeta(
    'nombreUsuario',
  );
  @override
  late final GeneratedColumn<String> nombreUsuario = GeneratedColumn<String>(
    'nombre_usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [idEmpleado, nombreUsuario, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuentas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cuenta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_empleado')) {
      context.handle(
        _idEmpleadoMeta,
        idEmpleado.isAcceptableOrUnknown(data['id_empleado']!, _idEmpleadoMeta),
      );
    } else if (isInserting) {
      context.missing(_idEmpleadoMeta);
    }
    if (data.containsKey('nombre_usuario')) {
      context.handle(
        _nombreUsuarioMeta,
        nombreUsuario.isAcceptableOrUnknown(
          data['nombre_usuario']!,
          _nombreUsuarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nombreUsuarioMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEmpleado, nombreUsuario};
  @override
  Cuenta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cuenta(
      idEmpleado: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_empleado'],
      )!,
      nombreUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_usuario'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
    );
  }

  @override
  $CuentasTable createAlias(String alias) {
    return $CuentasTable(attachedDatabase, alias);
  }
}

class Cuenta extends DataClass implements Insertable<Cuenta> {
  final int idEmpleado;
  final String nombreUsuario;
  final String? password;
  const Cuenta({
    required this.idEmpleado,
    required this.nombreUsuario,
    this.password,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_empleado'] = Variable<int>(idEmpleado);
    map['nombre_usuario'] = Variable<String>(nombreUsuario);
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  CuentasCompanion toCompanion(bool nullToAbsent) {
    return CuentasCompanion(
      idEmpleado: Value(idEmpleado),
      nombreUsuario: Value(nombreUsuario),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory Cuenta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cuenta(
      idEmpleado: serializer.fromJson<int>(json['idEmpleado']),
      nombreUsuario: serializer.fromJson<String>(json['nombreUsuario']),
      password: serializer.fromJson<String?>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEmpleado': serializer.toJson<int>(idEmpleado),
      'nombreUsuario': serializer.toJson<String>(nombreUsuario),
      'password': serializer.toJson<String?>(password),
    };
  }

  Cuenta copyWith({
    int? idEmpleado,
    String? nombreUsuario,
    Value<String?> password = const Value.absent(),
  }) => Cuenta(
    idEmpleado: idEmpleado ?? this.idEmpleado,
    nombreUsuario: nombreUsuario ?? this.nombreUsuario,
    password: password.present ? password.value : this.password,
  );
  Cuenta copyWithCompanion(CuentasCompanion data) {
    return Cuenta(
      idEmpleado: data.idEmpleado.present
          ? data.idEmpleado.value
          : this.idEmpleado,
      nombreUsuario: data.nombreUsuario.present
          ? data.nombreUsuario.value
          : this.nombreUsuario,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cuenta(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('nombreUsuario: $nombreUsuario, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idEmpleado, nombreUsuario, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cuenta &&
          other.idEmpleado == this.idEmpleado &&
          other.nombreUsuario == this.nombreUsuario &&
          other.password == this.password);
}

class CuentasCompanion extends UpdateCompanion<Cuenta> {
  final Value<int> idEmpleado;
  final Value<String> nombreUsuario;
  final Value<String?> password;
  final Value<int> rowid;
  const CuentasCompanion({
    this.idEmpleado = const Value.absent(),
    this.nombreUsuario = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuentasCompanion.insert({
    required int idEmpleado,
    required String nombreUsuario,
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idEmpleado = Value(idEmpleado),
       nombreUsuario = Value(nombreUsuario);
  static Insertable<Cuenta> custom({
    Expression<int>? idEmpleado,
    Expression<String>? nombreUsuario,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idEmpleado != null) 'id_empleado': idEmpleado,
      if (nombreUsuario != null) 'nombre_usuario': nombreUsuario,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuentasCompanion copyWith({
    Value<int>? idEmpleado,
    Value<String>? nombreUsuario,
    Value<String?>? password,
    Value<int>? rowid,
  }) {
    return CuentasCompanion(
      idEmpleado: idEmpleado ?? this.idEmpleado,
      nombreUsuario: nombreUsuario ?? this.nombreUsuario,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEmpleado.present) {
      map['id_empleado'] = Variable<int>(idEmpleado.value);
    }
    if (nombreUsuario.present) {
      map['nombre_usuario'] = Variable<String>(nombreUsuario.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuentasCompanion(')
          ..write('idEmpleado: $idEmpleado, ')
          ..write('nombreUsuario: $nombreUsuario, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrdensTable extends Ordens with TableInfo<$OrdensTable, Orden> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idCherryLocalMeta = const VerificationMeta(
    'idCherryLocal',
  );
  @override
  late final GeneratedColumn<int> idCherryLocal = GeneratedColumn<int>(
    'id_cherry_local',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cherry_locals (id)',
    ),
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaRealizadaMeta = const VerificationMeta(
    'fechaRealizada',
  );
  @override
  late final GeneratedColumn<String> fechaRealizada = GeneratedColumn<String>(
    'fecha_realizada',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idEmpleadoMeta = const VerificationMeta(
    'idEmpleado',
  );
  @override
  late final GeneratedColumn<int> idEmpleado = GeneratedColumn<int>(
    'id_empleado',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES empleados (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idCherryLocal,
    total,
    fechaRealizada,
    idEmpleado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ordens';
  @override
  VerificationContext validateIntegrity(
    Insertable<Orden> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_cherry_local')) {
      context.handle(
        _idCherryLocalMeta,
        idCherryLocal.isAcceptableOrUnknown(
          data['id_cherry_local']!,
          _idCherryLocalMeta,
        ),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    }
    if (data.containsKey('fecha_realizada')) {
      context.handle(
        _fechaRealizadaMeta,
        fechaRealizada.isAcceptableOrUnknown(
          data['fecha_realizada']!,
          _fechaRealizadaMeta,
        ),
      );
    }
    if (data.containsKey('id_empleado')) {
      context.handle(
        _idEmpleadoMeta,
        idEmpleado.isAcceptableOrUnknown(data['id_empleado']!, _idEmpleadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Orden map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Orden(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      idCherryLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_cherry_local'],
      ),
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      ),
      fechaRealizada: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fecha_realizada'],
      ),
      idEmpleado: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_empleado'],
      ),
    );
  }

  @override
  $OrdensTable createAlias(String alias) {
    return $OrdensTable(attachedDatabase, alias);
  }
}

class Orden extends DataClass implements Insertable<Orden> {
  final int id;
  final int? idCherryLocal;
  final double? total;
  final String? fechaRealizada;
  final int? idEmpleado;
  const Orden({
    required this.id,
    this.idCherryLocal,
    this.total,
    this.fechaRealizada,
    this.idEmpleado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idCherryLocal != null) {
      map['id_cherry_local'] = Variable<int>(idCherryLocal);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<double>(total);
    }
    if (!nullToAbsent || fechaRealizada != null) {
      map['fecha_realizada'] = Variable<String>(fechaRealizada);
    }
    if (!nullToAbsent || idEmpleado != null) {
      map['id_empleado'] = Variable<int>(idEmpleado);
    }
    return map;
  }

  OrdensCompanion toCompanion(bool nullToAbsent) {
    return OrdensCompanion(
      id: Value(id),
      idCherryLocal: idCherryLocal == null && nullToAbsent
          ? const Value.absent()
          : Value(idCherryLocal),
      total: total == null && nullToAbsent
          ? const Value.absent()
          : Value(total),
      fechaRealizada: fechaRealizada == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaRealizada),
      idEmpleado: idEmpleado == null && nullToAbsent
          ? const Value.absent()
          : Value(idEmpleado),
    );
  }

  factory Orden.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Orden(
      id: serializer.fromJson<int>(json['id']),
      idCherryLocal: serializer.fromJson<int?>(json['idCherryLocal']),
      total: serializer.fromJson<double?>(json['total']),
      fechaRealizada: serializer.fromJson<String?>(json['fechaRealizada']),
      idEmpleado: serializer.fromJson<int?>(json['idEmpleado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCherryLocal': serializer.toJson<int?>(idCherryLocal),
      'total': serializer.toJson<double?>(total),
      'fechaRealizada': serializer.toJson<String?>(fechaRealizada),
      'idEmpleado': serializer.toJson<int?>(idEmpleado),
    };
  }

  Orden copyWith({
    int? id,
    Value<int?> idCherryLocal = const Value.absent(),
    Value<double?> total = const Value.absent(),
    Value<String?> fechaRealizada = const Value.absent(),
    Value<int?> idEmpleado = const Value.absent(),
  }) => Orden(
    id: id ?? this.id,
    idCherryLocal: idCherryLocal.present
        ? idCherryLocal.value
        : this.idCherryLocal,
    total: total.present ? total.value : this.total,
    fechaRealizada: fechaRealizada.present
        ? fechaRealizada.value
        : this.fechaRealizada,
    idEmpleado: idEmpleado.present ? idEmpleado.value : this.idEmpleado,
  );
  Orden copyWithCompanion(OrdensCompanion data) {
    return Orden(
      id: data.id.present ? data.id.value : this.id,
      idCherryLocal: data.idCherryLocal.present
          ? data.idCherryLocal.value
          : this.idCherryLocal,
      total: data.total.present ? data.total.value : this.total,
      fechaRealizada: data.fechaRealizada.present
          ? data.fechaRealizada.value
          : this.fechaRealizada,
      idEmpleado: data.idEmpleado.present
          ? data.idEmpleado.value
          : this.idEmpleado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Orden(')
          ..write('id: $id, ')
          ..write('idCherryLocal: $idCherryLocal, ')
          ..write('total: $total, ')
          ..write('fechaRealizada: $fechaRealizada, ')
          ..write('idEmpleado: $idEmpleado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idCherryLocal, total, fechaRealizada, idEmpleado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Orden &&
          other.id == this.id &&
          other.idCherryLocal == this.idCherryLocal &&
          other.total == this.total &&
          other.fechaRealizada == this.fechaRealizada &&
          other.idEmpleado == this.idEmpleado);
}

class OrdensCompanion extends UpdateCompanion<Orden> {
  final Value<int> id;
  final Value<int?> idCherryLocal;
  final Value<double?> total;
  final Value<String?> fechaRealizada;
  final Value<int?> idEmpleado;
  const OrdensCompanion({
    this.id = const Value.absent(),
    this.idCherryLocal = const Value.absent(),
    this.total = const Value.absent(),
    this.fechaRealizada = const Value.absent(),
    this.idEmpleado = const Value.absent(),
  });
  OrdensCompanion.insert({
    this.id = const Value.absent(),
    this.idCherryLocal = const Value.absent(),
    this.total = const Value.absent(),
    this.fechaRealizada = const Value.absent(),
    this.idEmpleado = const Value.absent(),
  });
  static Insertable<Orden> custom({
    Expression<int>? id,
    Expression<int>? idCherryLocal,
    Expression<double>? total,
    Expression<String>? fechaRealizada,
    Expression<int>? idEmpleado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCherryLocal != null) 'id_cherry_local': idCherryLocal,
      if (total != null) 'total': total,
      if (fechaRealizada != null) 'fecha_realizada': fechaRealizada,
      if (idEmpleado != null) 'id_empleado': idEmpleado,
    });
  }

  OrdensCompanion copyWith({
    Value<int>? id,
    Value<int?>? idCherryLocal,
    Value<double?>? total,
    Value<String?>? fechaRealizada,
    Value<int?>? idEmpleado,
  }) {
    return OrdensCompanion(
      id: id ?? this.id,
      idCherryLocal: idCherryLocal ?? this.idCherryLocal,
      total: total ?? this.total,
      fechaRealizada: fechaRealizada ?? this.fechaRealizada,
      idEmpleado: idEmpleado ?? this.idEmpleado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCherryLocal.present) {
      map['id_cherry_local'] = Variable<int>(idCherryLocal.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (fechaRealizada.present) {
      map['fecha_realizada'] = Variable<String>(fechaRealizada.value);
    }
    if (idEmpleado.present) {
      map['id_empleado'] = Variable<int>(idEmpleado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdensCompanion(')
          ..write('id: $id, ')
          ..write('idCherryLocal: $idCherryLocal, ')
          ..write('total: $total, ')
          ..write('fechaRealizada: $fechaRealizada, ')
          ..write('idEmpleado: $idEmpleado')
          ..write(')'))
        .toString();
  }
}

class $PagosTable extends Pagos with TableInfo<$PagosTable, Pago> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idMetodoPagoMeta = const VerificationMeta(
    'idMetodoPago',
  );
  @override
  late final GeneratedColumn<int> idMetodoPago = GeneratedColumn<int>(
    'id_metodo_pago',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES metodo_pagos (id)',
    ),
  );
  static const VerificationMeta _idOrdenMeta = const VerificationMeta(
    'idOrden',
  );
  @override
  late final GeneratedColumn<int> idOrden = GeneratedColumn<int>(
    'id_orden',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ordens (id)',
    ),
  );
  static const VerificationMeta _idCherryLocalMeta = const VerificationMeta(
    'idCherryLocal',
  );
  @override
  late final GeneratedColumn<int> idCherryLocal = GeneratedColumn<int>(
    'id_cherry_local',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cherry_locals (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    descripcion,
    idMetodoPago,
    idOrden,
    idCherryLocal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pagos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pago> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('id_metodo_pago')) {
      context.handle(
        _idMetodoPagoMeta,
        idMetodoPago.isAcceptableOrUnknown(
          data['id_metodo_pago']!,
          _idMetodoPagoMeta,
        ),
      );
    }
    if (data.containsKey('id_orden')) {
      context.handle(
        _idOrdenMeta,
        idOrden.isAcceptableOrUnknown(data['id_orden']!, _idOrdenMeta),
      );
    }
    if (data.containsKey('id_cherry_local')) {
      context.handle(
        _idCherryLocalMeta,
        idCherryLocal.isAcceptableOrUnknown(
          data['id_cherry_local']!,
          _idCherryLocalMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pago map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pago(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      idMetodoPago: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_metodo_pago'],
      ),
      idOrden: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_orden'],
      ),
      idCherryLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_cherry_local'],
      ),
    );
  }

  @override
  $PagosTable createAlias(String alias) {
    return $PagosTable(attachedDatabase, alias);
  }
}

class Pago extends DataClass implements Insertable<Pago> {
  final int id;
  final String? descripcion;
  final int? idMetodoPago;
  final int? idOrden;
  final int? idCherryLocal;
  const Pago({
    required this.id,
    this.descripcion,
    this.idMetodoPago,
    this.idOrden,
    this.idCherryLocal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || idMetodoPago != null) {
      map['id_metodo_pago'] = Variable<int>(idMetodoPago);
    }
    if (!nullToAbsent || idOrden != null) {
      map['id_orden'] = Variable<int>(idOrden);
    }
    if (!nullToAbsent || idCherryLocal != null) {
      map['id_cherry_local'] = Variable<int>(idCherryLocal);
    }
    return map;
  }

  PagosCompanion toCompanion(bool nullToAbsent) {
    return PagosCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      idMetodoPago: idMetodoPago == null && nullToAbsent
          ? const Value.absent()
          : Value(idMetodoPago),
      idOrden: idOrden == null && nullToAbsent
          ? const Value.absent()
          : Value(idOrden),
      idCherryLocal: idCherryLocal == null && nullToAbsent
          ? const Value.absent()
          : Value(idCherryLocal),
    );
  }

  factory Pago.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pago(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      idMetodoPago: serializer.fromJson<int?>(json['idMetodoPago']),
      idOrden: serializer.fromJson<int?>(json['idOrden']),
      idCherryLocal: serializer.fromJson<int?>(json['idCherryLocal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
      'idMetodoPago': serializer.toJson<int?>(idMetodoPago),
      'idOrden': serializer.toJson<int?>(idOrden),
      'idCherryLocal': serializer.toJson<int?>(idCherryLocal),
    };
  }

  Pago copyWith({
    int? id,
    Value<String?> descripcion = const Value.absent(),
    Value<int?> idMetodoPago = const Value.absent(),
    Value<int?> idOrden = const Value.absent(),
    Value<int?> idCherryLocal = const Value.absent(),
  }) => Pago(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    idMetodoPago: idMetodoPago.present ? idMetodoPago.value : this.idMetodoPago,
    idOrden: idOrden.present ? idOrden.value : this.idOrden,
    idCherryLocal: idCherryLocal.present
        ? idCherryLocal.value
        : this.idCherryLocal,
  );
  Pago copyWithCompanion(PagosCompanion data) {
    return Pago(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      idMetodoPago: data.idMetodoPago.present
          ? data.idMetodoPago.value
          : this.idMetodoPago,
      idOrden: data.idOrden.present ? data.idOrden.value : this.idOrden,
      idCherryLocal: data.idCherryLocal.present
          ? data.idCherryLocal.value
          : this.idCherryLocal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pago(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('idMetodoPago: $idMetodoPago, ')
          ..write('idOrden: $idOrden, ')
          ..write('idCherryLocal: $idCherryLocal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, descripcion, idMetodoPago, idOrden, idCherryLocal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pago &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.idMetodoPago == this.idMetodoPago &&
          other.idOrden == this.idOrden &&
          other.idCherryLocal == this.idCherryLocal);
}

class PagosCompanion extends UpdateCompanion<Pago> {
  final Value<int> id;
  final Value<String?> descripcion;
  final Value<int?> idMetodoPago;
  final Value<int?> idOrden;
  final Value<int?> idCherryLocal;
  const PagosCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.idMetodoPago = const Value.absent(),
    this.idOrden = const Value.absent(),
    this.idCherryLocal = const Value.absent(),
  });
  PagosCompanion.insert({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.idMetodoPago = const Value.absent(),
    this.idOrden = const Value.absent(),
    this.idCherryLocal = const Value.absent(),
  });
  static Insertable<Pago> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
    Expression<int>? idMetodoPago,
    Expression<int>? idOrden,
    Expression<int>? idCherryLocal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (idMetodoPago != null) 'id_metodo_pago': idMetodoPago,
      if (idOrden != null) 'id_orden': idOrden,
      if (idCherryLocal != null) 'id_cherry_local': idCherryLocal,
    });
  }

  PagosCompanion copyWith({
    Value<int>? id,
    Value<String?>? descripcion,
    Value<int?>? idMetodoPago,
    Value<int?>? idOrden,
    Value<int?>? idCherryLocal,
  }) {
    return PagosCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      idMetodoPago: idMetodoPago ?? this.idMetodoPago,
      idOrden: idOrden ?? this.idOrden,
      idCherryLocal: idCherryLocal ?? this.idCherryLocal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (idMetodoPago.present) {
      map['id_metodo_pago'] = Variable<int>(idMetodoPago.value);
    }
    if (idOrden.present) {
      map['id_orden'] = Variable<int>(idOrden.value);
    }
    if (idCherryLocal.present) {
      map['id_cherry_local'] = Variable<int>(idCherryLocal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagosCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('idMetodoPago: $idMetodoPago, ')
          ..write('idOrden: $idOrden, ')
          ..write('idCherryLocal: $idCherryLocal')
          ..write(')'))
        .toString();
  }
}

class $CategoriasTable extends Categorias
    with TableInfo<$CategoriasTable, Categoria> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categorias';
  @override
  VerificationContext validateIntegrity(
    Insertable<Categoria> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categoria map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Categoria(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $CategoriasTable createAlias(String alias) {
    return $CategoriasTable(attachedDatabase, alias);
  }
}

class Categoria extends DataClass implements Insertable<Categoria> {
  final int id;
  final String? nombre;
  final String? descripcion;
  const Categoria({required this.id, this.nombre, this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  CategoriasCompanion toCompanion(bool nullToAbsent) {
    return CategoriasCompanion(
      id: Value(id),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory Categoria.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Categoria(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String?>(nombre),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  Categoria copyWith({
    int? id,
    Value<String?> nombre = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
  }) => Categoria(
    id: id ?? this.id,
    nombre: nombre.present ? nombre.value : this.nombre,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  Categoria copyWithCompanion(CategoriasCompanion data) {
    return Categoria(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Categoria(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Categoria &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion);
}

class CategoriasCompanion extends UpdateCompanion<Categoria> {
  final Value<int> id;
  final Value<String?> nombre;
  final Value<String?> descripcion;
  const CategoriasCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  CategoriasCompanion.insert({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<Categoria> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  CategoriasCompanion copyWith({
    Value<int>? id,
    Value<String?>? nombre,
    Value<String?>? descripcion,
  }) {
    return CategoriasCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriasCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $ProductosTable extends Productos
    with TableInfo<$ProductosTable, Producto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _precioMeta = const VerificationMeta('precio');
  @override
  late final GeneratedColumn<double> precio = GeneratedColumn<double>(
    'precio',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idCategoriaMeta = const VerificationMeta(
    'idCategoria',
  );
  @override
  late final GeneratedColumn<int> idCategoria = GeneratedColumn<int>(
    'id_categoria',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categorias (id)',
    ),
  );
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
    'foto',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, precio, idCategoria, foto];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'productos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Producto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('precio')) {
      context.handle(
        _precioMeta,
        precio.isAcceptableOrUnknown(data['precio']!, _precioMeta),
      );
    }
    if (data.containsKey('id_categoria')) {
      context.handle(
        _idCategoriaMeta,
        idCategoria.isAcceptableOrUnknown(
          data['id_categoria']!,
          _idCategoriaMeta,
        ),
      );
    }
    if (data.containsKey('foto')) {
      context.handle(
        _fotoMeta,
        foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Producto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Producto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      precio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio'],
      ),
      idCategoria: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_categoria'],
      ),
      foto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto'],
      ),
    );
  }

  @override
  $ProductosTable createAlias(String alias) {
    return $ProductosTable(attachedDatabase, alias);
  }
}

class Producto extends DataClass implements Insertable<Producto> {
  final int id;
  final String? nombre;
  final double? precio;
  final int? idCategoria;
  final String? foto;
  const Producto({
    required this.id,
    this.nombre,
    this.precio,
    this.idCategoria,
    this.foto,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || precio != null) {
      map['precio'] = Variable<double>(precio);
    }
    if (!nullToAbsent || idCategoria != null) {
      map['id_categoria'] = Variable<int>(idCategoria);
    }
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String>(foto);
    }
    return map;
  }

  ProductosCompanion toCompanion(bool nullToAbsent) {
    return ProductosCompanion(
      id: Value(id),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      precio: precio == null && nullToAbsent
          ? const Value.absent()
          : Value(precio),
      idCategoria: idCategoria == null && nullToAbsent
          ? const Value.absent()
          : Value(idCategoria),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
    );
  }

  factory Producto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Producto(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      precio: serializer.fromJson<double?>(json['precio']),
      idCategoria: serializer.fromJson<int?>(json['idCategoria']),
      foto: serializer.fromJson<String?>(json['foto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String?>(nombre),
      'precio': serializer.toJson<double?>(precio),
      'idCategoria': serializer.toJson<int?>(idCategoria),
      'foto': serializer.toJson<String?>(foto),
    };
  }

  Producto copyWith({
    int? id,
    Value<String?> nombre = const Value.absent(),
    Value<double?> precio = const Value.absent(),
    Value<int?> idCategoria = const Value.absent(),
    Value<String?> foto = const Value.absent(),
  }) => Producto(
    id: id ?? this.id,
    nombre: nombre.present ? nombre.value : this.nombre,
    precio: precio.present ? precio.value : this.precio,
    idCategoria: idCategoria.present ? idCategoria.value : this.idCategoria,
    foto: foto.present ? foto.value : this.foto,
  );
  Producto copyWithCompanion(ProductosCompanion data) {
    return Producto(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      precio: data.precio.present ? data.precio.value : this.precio,
      idCategoria: data.idCategoria.present
          ? data.idCategoria.value
          : this.idCategoria,
      foto: data.foto.present ? data.foto.value : this.foto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Producto(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('idCategoria: $idCategoria, ')
          ..write('foto: $foto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, precio, idCategoria, foto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Producto &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.precio == this.precio &&
          other.idCategoria == this.idCategoria &&
          other.foto == this.foto);
}

class ProductosCompanion extends UpdateCompanion<Producto> {
  final Value<int> id;
  final Value<String?> nombre;
  final Value<double?> precio;
  final Value<int?> idCategoria;
  final Value<String?> foto;
  const ProductosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.precio = const Value.absent(),
    this.idCategoria = const Value.absent(),
    this.foto = const Value.absent(),
  });
  ProductosCompanion.insert({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.precio = const Value.absent(),
    this.idCategoria = const Value.absent(),
    this.foto = const Value.absent(),
  });
  static Insertable<Producto> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<double>? precio,
    Expression<int>? idCategoria,
    Expression<String>? foto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (precio != null) 'precio': precio,
      if (idCategoria != null) 'id_categoria': idCategoria,
      if (foto != null) 'foto': foto,
    });
  }

  ProductosCompanion copyWith({
    Value<int>? id,
    Value<String?>? nombre,
    Value<double?>? precio,
    Value<int?>? idCategoria,
    Value<String?>? foto,
  }) {
    return ProductosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      idCategoria: idCategoria ?? this.idCategoria,
      foto: foto ?? this.foto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    if (idCategoria.present) {
      map['id_categoria'] = Variable<int>(idCategoria.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('idCategoria: $idCategoria, ')
          ..write('foto: $foto')
          ..write(')'))
        .toString();
  }
}

class $ContienesTable extends Contienes
    with TableInfo<$ContienesTable, Contiene> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContienesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrdenMeta = const VerificationMeta(
    'idOrden',
  );
  @override
  late final GeneratedColumn<int> idOrden = GeneratedColumn<int>(
    'id_orden',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ordens (id)',
    ),
  );
  static const VerificationMeta _idCherryLocalMeta = const VerificationMeta(
    'idCherryLocal',
  );
  @override
  late final GeneratedColumn<int> idCherryLocal = GeneratedColumn<int>(
    'id_cherry_local',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cherry_locals (id)',
    ),
  );
  static const VerificationMeta _idProductoMeta = const VerificationMeta(
    'idProducto',
  );
  @override
  late final GeneratedColumn<int> idProducto = GeneratedColumn<int>(
    'id_producto',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES productos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idOrden, idCherryLocal, idProducto];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contienes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Contiene> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_orden')) {
      context.handle(
        _idOrdenMeta,
        idOrden.isAcceptableOrUnknown(data['id_orden']!, _idOrdenMeta),
      );
    } else if (isInserting) {
      context.missing(_idOrdenMeta);
    }
    if (data.containsKey('id_cherry_local')) {
      context.handle(
        _idCherryLocalMeta,
        idCherryLocal.isAcceptableOrUnknown(
          data['id_cherry_local']!,
          _idCherryLocalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idCherryLocalMeta);
    }
    if (data.containsKey('id_producto')) {
      context.handle(
        _idProductoMeta,
        idProducto.isAcceptableOrUnknown(data['id_producto']!, _idProductoMeta),
      );
    } else if (isInserting) {
      context.missing(_idProductoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrden, idCherryLocal, idProducto};
  @override
  Contiene map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contiene(
      idOrden: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_orden'],
      )!,
      idCherryLocal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_cherry_local'],
      )!,
      idProducto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_producto'],
      )!,
    );
  }

  @override
  $ContienesTable createAlias(String alias) {
    return $ContienesTable(attachedDatabase, alias);
  }
}

class Contiene extends DataClass implements Insertable<Contiene> {
  final int idOrden;
  final int idCherryLocal;
  final int idProducto;
  const Contiene({
    required this.idOrden,
    required this.idCherryLocal,
    required this.idProducto,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_orden'] = Variable<int>(idOrden);
    map['id_cherry_local'] = Variable<int>(idCherryLocal);
    map['id_producto'] = Variable<int>(idProducto);
    return map;
  }

  ContienesCompanion toCompanion(bool nullToAbsent) {
    return ContienesCompanion(
      idOrden: Value(idOrden),
      idCherryLocal: Value(idCherryLocal),
      idProducto: Value(idProducto),
    );
  }

  factory Contiene.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contiene(
      idOrden: serializer.fromJson<int>(json['idOrden']),
      idCherryLocal: serializer.fromJson<int>(json['idCherryLocal']),
      idProducto: serializer.fromJson<int>(json['idProducto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrden': serializer.toJson<int>(idOrden),
      'idCherryLocal': serializer.toJson<int>(idCherryLocal),
      'idProducto': serializer.toJson<int>(idProducto),
    };
  }

  Contiene copyWith({int? idOrden, int? idCherryLocal, int? idProducto}) =>
      Contiene(
        idOrden: idOrden ?? this.idOrden,
        idCherryLocal: idCherryLocal ?? this.idCherryLocal,
        idProducto: idProducto ?? this.idProducto,
      );
  Contiene copyWithCompanion(ContienesCompanion data) {
    return Contiene(
      idOrden: data.idOrden.present ? data.idOrden.value : this.idOrden,
      idCherryLocal: data.idCherryLocal.present
          ? data.idCherryLocal.value
          : this.idCherryLocal,
      idProducto: data.idProducto.present
          ? data.idProducto.value
          : this.idProducto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Contiene(')
          ..write('idOrden: $idOrden, ')
          ..write('idCherryLocal: $idCherryLocal, ')
          ..write('idProducto: $idProducto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOrden, idCherryLocal, idProducto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contiene &&
          other.idOrden == this.idOrden &&
          other.idCherryLocal == this.idCherryLocal &&
          other.idProducto == this.idProducto);
}

class ContienesCompanion extends UpdateCompanion<Contiene> {
  final Value<int> idOrden;
  final Value<int> idCherryLocal;
  final Value<int> idProducto;
  final Value<int> rowid;
  const ContienesCompanion({
    this.idOrden = const Value.absent(),
    this.idCherryLocal = const Value.absent(),
    this.idProducto = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContienesCompanion.insert({
    required int idOrden,
    required int idCherryLocal,
    required int idProducto,
    this.rowid = const Value.absent(),
  }) : idOrden = Value(idOrden),
       idCherryLocal = Value(idCherryLocal),
       idProducto = Value(idProducto);
  static Insertable<Contiene> custom({
    Expression<int>? idOrden,
    Expression<int>? idCherryLocal,
    Expression<int>? idProducto,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idOrden != null) 'id_orden': idOrden,
      if (idCherryLocal != null) 'id_cherry_local': idCherryLocal,
      if (idProducto != null) 'id_producto': idProducto,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContienesCompanion copyWith({
    Value<int>? idOrden,
    Value<int>? idCherryLocal,
    Value<int>? idProducto,
    Value<int>? rowid,
  }) {
    return ContienesCompanion(
      idOrden: idOrden ?? this.idOrden,
      idCherryLocal: idCherryLocal ?? this.idCherryLocal,
      idProducto: idProducto ?? this.idProducto,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrden.present) {
      map['id_orden'] = Variable<int>(idOrden.value);
    }
    if (idCherryLocal.present) {
      map['id_cherry_local'] = Variable<int>(idCherryLocal.value);
    }
    if (idProducto.present) {
      map['id_producto'] = Variable<int>(idProducto.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContienesCompanion(')
          ..write('idOrden: $idOrden, ')
          ..write('idCherryLocal: $idCherryLocal, ')
          ..write('idProducto: $idProducto, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DescuentosTable extends Descuentos
    with TableInfo<$DescuentosTable, Descuento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DescuentosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _porcentajeMeta = const VerificationMeta(
    'porcentaje',
  );
  @override
  late final GeneratedColumn<int> porcentaje = GeneratedColumn<int>(
    'porcentaje',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idProductoMeta = const VerificationMeta(
    'idProducto',
  );
  @override
  late final GeneratedColumn<int> idProducto = GeneratedColumn<int>(
    'id_producto',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES productos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    descripcion,
    porcentaje,
    idProducto,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'descuentos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Descuento> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('porcentaje')) {
      context.handle(
        _porcentajeMeta,
        porcentaje.isAcceptableOrUnknown(data['porcentaje']!, _porcentajeMeta),
      );
    }
    if (data.containsKey('id_producto')) {
      context.handle(
        _idProductoMeta,
        idProducto.isAcceptableOrUnknown(data['id_producto']!, _idProductoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Descuento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Descuento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      porcentaje: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}porcentaje'],
      ),
      idProducto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_producto'],
      ),
    );
  }

  @override
  $DescuentosTable createAlias(String alias) {
    return $DescuentosTable(attachedDatabase, alias);
  }
}

class Descuento extends DataClass implements Insertable<Descuento> {
  final int id;
  final String? descripcion;
  final int? porcentaje;
  final int? idProducto;
  const Descuento({
    required this.id,
    this.descripcion,
    this.porcentaje,
    this.idProducto,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || porcentaje != null) {
      map['porcentaje'] = Variable<int>(porcentaje);
    }
    if (!nullToAbsent || idProducto != null) {
      map['id_producto'] = Variable<int>(idProducto);
    }
    return map;
  }

  DescuentosCompanion toCompanion(bool nullToAbsent) {
    return DescuentosCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      porcentaje: porcentaje == null && nullToAbsent
          ? const Value.absent()
          : Value(porcentaje),
      idProducto: idProducto == null && nullToAbsent
          ? const Value.absent()
          : Value(idProducto),
    );
  }

  factory Descuento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Descuento(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      porcentaje: serializer.fromJson<int?>(json['porcentaje']),
      idProducto: serializer.fromJson<int?>(json['idProducto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
      'porcentaje': serializer.toJson<int?>(porcentaje),
      'idProducto': serializer.toJson<int?>(idProducto),
    };
  }

  Descuento copyWith({
    int? id,
    Value<String?> descripcion = const Value.absent(),
    Value<int?> porcentaje = const Value.absent(),
    Value<int?> idProducto = const Value.absent(),
  }) => Descuento(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    porcentaje: porcentaje.present ? porcentaje.value : this.porcentaje,
    idProducto: idProducto.present ? idProducto.value : this.idProducto,
  );
  Descuento copyWithCompanion(DescuentosCompanion data) {
    return Descuento(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      porcentaje: data.porcentaje.present
          ? data.porcentaje.value
          : this.porcentaje,
      idProducto: data.idProducto.present
          ? data.idProducto.value
          : this.idProducto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Descuento(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('porcentaje: $porcentaje, ')
          ..write('idProducto: $idProducto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion, porcentaje, idProducto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Descuento &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.porcentaje == this.porcentaje &&
          other.idProducto == this.idProducto);
}

class DescuentosCompanion extends UpdateCompanion<Descuento> {
  final Value<int> id;
  final Value<String?> descripcion;
  final Value<int?> porcentaje;
  final Value<int?> idProducto;
  const DescuentosCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.porcentaje = const Value.absent(),
    this.idProducto = const Value.absent(),
  });
  DescuentosCompanion.insert({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.porcentaje = const Value.absent(),
    this.idProducto = const Value.absent(),
  });
  static Insertable<Descuento> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
    Expression<int>? porcentaje,
    Expression<int>? idProducto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (porcentaje != null) 'porcentaje': porcentaje,
      if (idProducto != null) 'id_producto': idProducto,
    });
  }

  DescuentosCompanion copyWith({
    Value<int>? id,
    Value<String?>? descripcion,
    Value<int?>? porcentaje,
    Value<int?>? idProducto,
  }) {
    return DescuentosCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      porcentaje: porcentaje ?? this.porcentaje,
      idProducto: idProducto ?? this.idProducto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (porcentaje.present) {
      map['porcentaje'] = Variable<int>(porcentaje.value);
    }
    if (idProducto.present) {
      map['id_producto'] = Variable<int>(idProducto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DescuentosCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('porcentaje: $porcentaje, ')
          ..write('idProducto: $idProducto')
          ..write(')'))
        .toString();
  }
}

class $MedidasTable extends Medidas with TableInfo<$MedidasTable, Medida> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedidasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medidas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medida> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medida map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medida(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $MedidasTable createAlias(String alias) {
    return $MedidasTable(attachedDatabase, alias);
  }
}

class Medida extends DataClass implements Insertable<Medida> {
  final int id;
  final String? descripcion;
  const Medida({required this.id, this.descripcion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  MedidasCompanion toCompanion(bool nullToAbsent) {
    return MedidasCompanion(
      id: Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory Medida.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medida(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  Medida copyWith({
    int? id,
    Value<String?> descripcion = const Value.absent(),
  }) => Medida(
    id: id ?? this.id,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  Medida copyWithCompanion(MedidasCompanion data) {
    return Medida(
      id: data.id.present ? data.id.value : this.id,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medida(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medida &&
          other.id == this.id &&
          other.descripcion == this.descripcion);
}

class MedidasCompanion extends UpdateCompanion<Medida> {
  final Value<int> id;
  final Value<String?> descripcion;
  const MedidasCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  MedidasCompanion.insert({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<Medida> custom({
    Expression<int>? id,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  MedidasCompanion copyWith({Value<int>? id, Value<String?>? descripcion}) {
    return MedidasCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedidasCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $ProveedorsTable extends Proveedors
    with TableInfo<$ProveedorsTable, Proveedor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProveedorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, direccion, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proveedors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Proveedor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Proveedor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Proveedor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
    );
  }

  @override
  $ProveedorsTable createAlias(String alias) {
    return $ProveedorsTable(attachedDatabase, alias);
  }
}

class Proveedor extends DataClass implements Insertable<Proveedor> {
  final int id;
  final String? nombre;
  final String? direccion;
  final String? descripcion;
  const Proveedor({
    required this.id,
    this.nombre,
    this.direccion,
    this.descripcion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    return map;
  }

  ProveedorsCompanion toCompanion(bool nullToAbsent) {
    return ProveedorsCompanion(
      id: Value(id),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
    );
  }

  factory Proveedor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Proveedor(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String?>(nombre),
      'direccion': serializer.toJson<String?>(direccion),
      'descripcion': serializer.toJson<String?>(descripcion),
    };
  }

  Proveedor copyWith({
    int? id,
    Value<String?> nombre = const Value.absent(),
    Value<String?> direccion = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
  }) => Proveedor(
    id: id ?? this.id,
    nombre: nombre.present ? nombre.value : this.nombre,
    direccion: direccion.present ? direccion.value : this.direccion,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
  );
  Proveedor copyWithCompanion(ProveedorsCompanion data) {
    return Proveedor(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Proveedor(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('direccion: $direccion, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, direccion, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Proveedor &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.direccion == this.direccion &&
          other.descripcion == this.descripcion);
}

class ProveedorsCompanion extends UpdateCompanion<Proveedor> {
  final Value<int> id;
  final Value<String?> nombre;
  final Value<String?> direccion;
  final Value<String?> descripcion;
  const ProveedorsCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.direccion = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  ProveedorsCompanion.insert({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.direccion = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  static Insertable<Proveedor> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? direccion,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (direccion != null) 'direccion': direccion,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  ProveedorsCompanion copyWith({
    Value<int>? id,
    Value<String?>? nombre,
    Value<String?>? direccion,
    Value<String?>? descripcion,
  }) {
    return ProveedorsCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      direccion: direccion ?? this.direccion,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProveedorsCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('direccion: $direccion, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $InsumosTable extends Insumos with TableInfo<$InsumosTable, Insumo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsumosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _costoMeta = const VerificationMeta('costo');
  @override
  late final GeneratedColumn<double> costo = GeneratedColumn<double>(
    'costo',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idMedidaMeta = const VerificationMeta(
    'idMedida',
  );
  @override
  late final GeneratedColumn<int> idMedida = GeneratedColumn<int>(
    'id_medida',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medidas (id)',
    ),
  );
  static const VerificationMeta _enAlmacenMeta = const VerificationMeta(
    'enAlmacen',
  );
  @override
  late final GeneratedColumn<int> enAlmacen = GeneratedColumn<int>(
    'en_almacen',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    costo,
    descripcion,
    idMedida,
    enAlmacen,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insumos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Insumo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('costo')) {
      context.handle(
        _costoMeta,
        costo.isAcceptableOrUnknown(data['costo']!, _costoMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('id_medida')) {
      context.handle(
        _idMedidaMeta,
        idMedida.isAcceptableOrUnknown(data['id_medida']!, _idMedidaMeta),
      );
    }
    if (data.containsKey('en_almacen')) {
      context.handle(
        _enAlmacenMeta,
        enAlmacen.isAcceptableOrUnknown(data['en_almacen']!, _enAlmacenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Insumo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Insumo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      costo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      idMedida: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_medida'],
      ),
      enAlmacen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}en_almacen'],
      ),
    );
  }

  @override
  $InsumosTable createAlias(String alias) {
    return $InsumosTable(attachedDatabase, alias);
  }
}

class Insumo extends DataClass implements Insertable<Insumo> {
  final int id;
  final String? nombre;
  final double? costo;
  final String? descripcion;
  final int? idMedida;
  final int? enAlmacen;
  const Insumo({
    required this.id,
    this.nombre,
    this.costo,
    this.descripcion,
    this.idMedida,
    this.enAlmacen,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || costo != null) {
      map['costo'] = Variable<double>(costo);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || idMedida != null) {
      map['id_medida'] = Variable<int>(idMedida);
    }
    if (!nullToAbsent || enAlmacen != null) {
      map['en_almacen'] = Variable<int>(enAlmacen);
    }
    return map;
  }

  InsumosCompanion toCompanion(bool nullToAbsent) {
    return InsumosCompanion(
      id: Value(id),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      costo: costo == null && nullToAbsent
          ? const Value.absent()
          : Value(costo),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      idMedida: idMedida == null && nullToAbsent
          ? const Value.absent()
          : Value(idMedida),
      enAlmacen: enAlmacen == null && nullToAbsent
          ? const Value.absent()
          : Value(enAlmacen),
    );
  }

  factory Insumo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Insumo(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      costo: serializer.fromJson<double?>(json['costo']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      idMedida: serializer.fromJson<int?>(json['idMedida']),
      enAlmacen: serializer.fromJson<int?>(json['enAlmacen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String?>(nombre),
      'costo': serializer.toJson<double?>(costo),
      'descripcion': serializer.toJson<String?>(descripcion),
      'idMedida': serializer.toJson<int?>(idMedida),
      'enAlmacen': serializer.toJson<int?>(enAlmacen),
    };
  }

  Insumo copyWith({
    int? id,
    Value<String?> nombre = const Value.absent(),
    Value<double?> costo = const Value.absent(),
    Value<String?> descripcion = const Value.absent(),
    Value<int?> idMedida = const Value.absent(),
    Value<int?> enAlmacen = const Value.absent(),
  }) => Insumo(
    id: id ?? this.id,
    nombre: nombre.present ? nombre.value : this.nombre,
    costo: costo.present ? costo.value : this.costo,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    idMedida: idMedida.present ? idMedida.value : this.idMedida,
    enAlmacen: enAlmacen.present ? enAlmacen.value : this.enAlmacen,
  );
  Insumo copyWithCompanion(InsumosCompanion data) {
    return Insumo(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      costo: data.costo.present ? data.costo.value : this.costo,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      idMedida: data.idMedida.present ? data.idMedida.value : this.idMedida,
      enAlmacen: data.enAlmacen.present ? data.enAlmacen.value : this.enAlmacen,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Insumo(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('costo: $costo, ')
          ..write('descripcion: $descripcion, ')
          ..write('idMedida: $idMedida, ')
          ..write('enAlmacen: $enAlmacen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, costo, descripcion, idMedida, enAlmacen);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Insumo &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.costo == this.costo &&
          other.descripcion == this.descripcion &&
          other.idMedida == this.idMedida &&
          other.enAlmacen == this.enAlmacen);
}

class InsumosCompanion extends UpdateCompanion<Insumo> {
  final Value<int> id;
  final Value<String?> nombre;
  final Value<double?> costo;
  final Value<String?> descripcion;
  final Value<int?> idMedida;
  final Value<int?> enAlmacen;
  const InsumosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.costo = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.idMedida = const Value.absent(),
    this.enAlmacen = const Value.absent(),
  });
  InsumosCompanion.insert({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.costo = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.idMedida = const Value.absent(),
    this.enAlmacen = const Value.absent(),
  });
  static Insertable<Insumo> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<double>? costo,
    Expression<String>? descripcion,
    Expression<int>? idMedida,
    Expression<int>? enAlmacen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (costo != null) 'costo': costo,
      if (descripcion != null) 'descripcion': descripcion,
      if (idMedida != null) 'id_medida': idMedida,
      if (enAlmacen != null) 'en_almacen': enAlmacen,
    });
  }

  InsumosCompanion copyWith({
    Value<int>? id,
    Value<String?>? nombre,
    Value<double?>? costo,
    Value<String?>? descripcion,
    Value<int?>? idMedida,
    Value<int?>? enAlmacen,
  }) {
    return InsumosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      costo: costo ?? this.costo,
      descripcion: descripcion ?? this.descripcion,
      idMedida: idMedida ?? this.idMedida,
      enAlmacen: enAlmacen ?? this.enAlmacen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (costo.present) {
      map['costo'] = Variable<double>(costo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (idMedida.present) {
      map['id_medida'] = Variable<int>(idMedida.value);
    }
    if (enAlmacen.present) {
      map['en_almacen'] = Variable<int>(enAlmacen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsumosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('costo: $costo, ')
          ..write('descripcion: $descripcion, ')
          ..write('idMedida: $idMedida, ')
          ..write('enAlmacen: $enAlmacen')
          ..write(')'))
        .toString();
  }
}

class $IngredientsTable extends Ingredients
    with TableInfo<$IngredientsTable, Ingredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idProductoMeta = const VerificationMeta(
    'idProducto',
  );
  @override
  late final GeneratedColumn<int> idProducto = GeneratedColumn<int>(
    'id_producto',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES productos (id)',
    ),
  );
  static const VerificationMeta _idInsumoMeta = const VerificationMeta(
    'idInsumo',
  );
  @override
  late final GeneratedColumn<int> idInsumo = GeneratedColumn<int>(
    'id_insumo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES insumos (id)',
    ),
  );
  static const VerificationMeta _cantidadMeta = const VerificationMeta(
    'cantidad',
  );
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
    'cantidad',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [idProducto, idInsumo, cantidad];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ingredient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_producto')) {
      context.handle(
        _idProductoMeta,
        idProducto.isAcceptableOrUnknown(data['id_producto']!, _idProductoMeta),
      );
    } else if (isInserting) {
      context.missing(_idProductoMeta);
    }
    if (data.containsKey('id_insumo')) {
      context.handle(
        _idInsumoMeta,
        idInsumo.isAcceptableOrUnknown(data['id_insumo']!, _idInsumoMeta),
      );
    } else if (isInserting) {
      context.missing(_idInsumoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(
        _cantidadMeta,
        cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idInsumo, idProducto};
  @override
  Ingredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ingredient(
      idProducto: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_producto'],
      )!,
      idInsumo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_insumo'],
      )!,
      cantidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cantidad'],
      ),
    );
  }

  @override
  $IngredientsTable createAlias(String alias) {
    return $IngredientsTable(attachedDatabase, alias);
  }
}

class Ingredient extends DataClass implements Insertable<Ingredient> {
  final int idProducto;
  final int idInsumo;
  final int? cantidad;
  const Ingredient({
    required this.idProducto,
    required this.idInsumo,
    this.cantidad,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_producto'] = Variable<int>(idProducto);
    map['id_insumo'] = Variable<int>(idInsumo);
    if (!nullToAbsent || cantidad != null) {
      map['cantidad'] = Variable<int>(cantidad);
    }
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      idProducto: Value(idProducto),
      idInsumo: Value(idInsumo),
      cantidad: cantidad == null && nullToAbsent
          ? const Value.absent()
          : Value(cantidad),
    );
  }

  factory Ingredient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ingredient(
      idProducto: serializer.fromJson<int>(json['idProducto']),
      idInsumo: serializer.fromJson<int>(json['idInsumo']),
      cantidad: serializer.fromJson<int?>(json['cantidad']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idProducto': serializer.toJson<int>(idProducto),
      'idInsumo': serializer.toJson<int>(idInsumo),
      'cantidad': serializer.toJson<int?>(cantidad),
    };
  }

  Ingredient copyWith({
    int? idProducto,
    int? idInsumo,
    Value<int?> cantidad = const Value.absent(),
  }) => Ingredient(
    idProducto: idProducto ?? this.idProducto,
    idInsumo: idInsumo ?? this.idInsumo,
    cantidad: cantidad.present ? cantidad.value : this.cantidad,
  );
  Ingredient copyWithCompanion(IngredientsCompanion data) {
    return Ingredient(
      idProducto: data.idProducto.present
          ? data.idProducto.value
          : this.idProducto,
      idInsumo: data.idInsumo.present ? data.idInsumo.value : this.idInsumo,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ingredient(')
          ..write('idProducto: $idProducto, ')
          ..write('idInsumo: $idInsumo, ')
          ..write('cantidad: $cantidad')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idProducto, idInsumo, cantidad);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ingredient &&
          other.idProducto == this.idProducto &&
          other.idInsumo == this.idInsumo &&
          other.cantidad == this.cantidad);
}

class IngredientsCompanion extends UpdateCompanion<Ingredient> {
  final Value<int> idProducto;
  final Value<int> idInsumo;
  final Value<int?> cantidad;
  final Value<int> rowid;
  const IngredientsCompanion({
    this.idProducto = const Value.absent(),
    this.idInsumo = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientsCompanion.insert({
    required int idProducto,
    required int idInsumo,
    this.cantidad = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idProducto = Value(idProducto),
       idInsumo = Value(idInsumo);
  static Insertable<Ingredient> custom({
    Expression<int>? idProducto,
    Expression<int>? idInsumo,
    Expression<int>? cantidad,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idProducto != null) 'id_producto': idProducto,
      if (idInsumo != null) 'id_insumo': idInsumo,
      if (cantidad != null) 'cantidad': cantidad,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientsCompanion copyWith({
    Value<int>? idProducto,
    Value<int>? idInsumo,
    Value<int?>? cantidad,
    Value<int>? rowid,
  }) {
    return IngredientsCompanion(
      idProducto: idProducto ?? this.idProducto,
      idInsumo: idInsumo ?? this.idInsumo,
      cantidad: cantidad ?? this.cantidad,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idProducto.present) {
      map['id_producto'] = Variable<int>(idProducto.value);
    }
    if (idInsumo.present) {
      map['id_insumo'] = Variable<int>(idInsumo.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('idProducto: $idProducto, ')
          ..write('idInsumo: $idInsumo, ')
          ..write('cantidad: $cantidad, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContactosTable extends Contactos
    with TableInfo<$ContactosTable, Contacto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idProveedorMeta = const VerificationMeta(
    'idProveedor',
  );
  @override
  late final GeneratedColumn<int> idProveedor = GeneratedColumn<int>(
    'id_proveedor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES proveedors (id)',
    ),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<int> numero = GeneratedColumn<int>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [idProveedor, numero, nombre, telefono];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contactos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Contacto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_proveedor')) {
      context.handle(
        _idProveedorMeta,
        idProveedor.isAcceptableOrUnknown(
          data['id_proveedor']!,
          _idProveedorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idProveedorMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idProveedor, numero};
  @override
  Contacto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contacto(
      idProveedor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_proveedor'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numero'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
    );
  }

  @override
  $ContactosTable createAlias(String alias) {
    return $ContactosTable(attachedDatabase, alias);
  }
}

class Contacto extends DataClass implements Insertable<Contacto> {
  final int idProveedor;
  final int numero;
  final String? nombre;
  final String? telefono;
  const Contacto({
    required this.idProveedor,
    required this.numero,
    this.nombre,
    this.telefono,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_proveedor'] = Variable<int>(idProveedor);
    map['numero'] = Variable<int>(numero);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    return map;
  }

  ContactosCompanion toCompanion(bool nullToAbsent) {
    return ContactosCompanion(
      idProveedor: Value(idProveedor),
      numero: Value(numero),
      nombre: nombre == null && nullToAbsent
          ? const Value.absent()
          : Value(nombre),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
    );
  }

  factory Contacto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contacto(
      idProveedor: serializer.fromJson<int>(json['idProveedor']),
      numero: serializer.fromJson<int>(json['numero']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      telefono: serializer.fromJson<String?>(json['telefono']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idProveedor': serializer.toJson<int>(idProveedor),
      'numero': serializer.toJson<int>(numero),
      'nombre': serializer.toJson<String?>(nombre),
      'telefono': serializer.toJson<String?>(telefono),
    };
  }

  Contacto copyWith({
    int? idProveedor,
    int? numero,
    Value<String?> nombre = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
  }) => Contacto(
    idProveedor: idProveedor ?? this.idProveedor,
    numero: numero ?? this.numero,
    nombre: nombre.present ? nombre.value : this.nombre,
    telefono: telefono.present ? telefono.value : this.telefono,
  );
  Contacto copyWithCompanion(ContactosCompanion data) {
    return Contacto(
      idProveedor: data.idProveedor.present
          ? data.idProveedor.value
          : this.idProveedor,
      numero: data.numero.present ? data.numero.value : this.numero,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Contacto(')
          ..write('idProveedor: $idProveedor, ')
          ..write('numero: $numero, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idProveedor, numero, nombre, telefono);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contacto &&
          other.idProveedor == this.idProveedor &&
          other.numero == this.numero &&
          other.nombre == this.nombre &&
          other.telefono == this.telefono);
}

class ContactosCompanion extends UpdateCompanion<Contacto> {
  final Value<int> idProveedor;
  final Value<int> numero;
  final Value<String?> nombre;
  final Value<String?> telefono;
  final Value<int> rowid;
  const ContactosCompanion({
    this.idProveedor = const Value.absent(),
    this.numero = const Value.absent(),
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContactosCompanion.insert({
    required int idProveedor,
    required int numero,
    this.nombre = const Value.absent(),
    this.telefono = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idProveedor = Value(idProveedor),
       numero = Value(numero);
  static Insertable<Contacto> custom({
    Expression<int>? idProveedor,
    Expression<int>? numero,
    Expression<String>? nombre,
    Expression<String>? telefono,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idProveedor != null) 'id_proveedor': idProveedor,
      if (numero != null) 'numero': numero,
      if (nombre != null) 'nombre': nombre,
      if (telefono != null) 'telefono': telefono,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContactosCompanion copyWith({
    Value<int>? idProveedor,
    Value<int>? numero,
    Value<String?>? nombre,
    Value<String?>? telefono,
    Value<int>? rowid,
  }) {
    return ContactosCompanion(
      idProveedor: idProveedor ?? this.idProveedor,
      numero: numero ?? this.numero,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idProveedor.present) {
      map['id_proveedor'] = Variable<int>(idProveedor.value);
    }
    if (numero.present) {
      map['numero'] = Variable<int>(numero.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactosCompanion(')
          ..write('idProveedor: $idProveedor, ')
          ..write('numero: $numero, ')
          ..write('nombre: $nombre, ')
          ..write('telefono: $telefono, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TablaErrorsTable tablaErrors = $TablaErrorsTable(this);
  late final $MetodoPagosTable metodoPagos = $MetodoPagosTable(this);
  late final $CherryLocalsTable cherryLocals = $CherryLocalsTable(this);
  late final $RolsTable rols = $RolsTable(this);
  late final $TurnosTable turnos = $TurnosTable(this);
  late final $BonusesTable bonuses = $BonusesTable(this);
  late final $EmpleadosTable empleados = $EmpleadosTable(this);
  late final $NominasTable nominas = $NominasTable(this);
  late final $BeneficiosTable beneficios = $BeneficiosTable(this);
  late final $CuentasTable cuentas = $CuentasTable(this);
  late final $OrdensTable ordens = $OrdensTable(this);
  late final $PagosTable pagos = $PagosTable(this);
  late final $CategoriasTable categorias = $CategoriasTable(this);
  late final $ProductosTable productos = $ProductosTable(this);
  late final $ContienesTable contienes = $ContienesTable(this);
  late final $DescuentosTable descuentos = $DescuentosTable(this);
  late final $MedidasTable medidas = $MedidasTable(this);
  late final $ProveedorsTable proveedors = $ProveedorsTable(this);
  late final $InsumosTable insumos = $InsumosTable(this);
  late final $IngredientsTable ingredients = $IngredientsTable(this);
  late final $ContactosTable contactos = $ContactosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tablaErrors,
    metodoPagos,
    cherryLocals,
    rols,
    turnos,
    bonuses,
    empleados,
    nominas,
    beneficios,
    cuentas,
    ordens,
    pagos,
    categorias,
    productos,
    contienes,
    descuentos,
    medidas,
    proveedors,
    insumos,
    ingredients,
    contactos,
  ];
}

typedef $$TablaErrorsTableCreateCompanionBuilder =
    TablaErrorsCompanion Function({
      required String id,
      Value<String?> descripcion,
      Value<int> rowid,
    });
typedef $$TablaErrorsTableUpdateCompanionBuilder =
    TablaErrorsCompanion Function({
      Value<String> id,
      Value<String?> descripcion,
      Value<int> rowid,
    });

class $$TablaErrorsTableFilterComposer
    extends Composer<_$AppDatabase, $TablaErrorsTable> {
  $$TablaErrorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TablaErrorsTableOrderingComposer
    extends Composer<_$AppDatabase, $TablaErrorsTable> {
  $$TablaErrorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TablaErrorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TablaErrorsTable> {
  $$TablaErrorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );
}

class $$TablaErrorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TablaErrorsTable,
          TablaError,
          $$TablaErrorsTableFilterComposer,
          $$TablaErrorsTableOrderingComposer,
          $$TablaErrorsTableAnnotationComposer,
          $$TablaErrorsTableCreateCompanionBuilder,
          $$TablaErrorsTableUpdateCompanionBuilder,
          (
            TablaError,
            BaseReferences<_$AppDatabase, $TablaErrorsTable, TablaError>,
          ),
          TablaError,
          PrefetchHooks Function()
        > {
  $$TablaErrorsTableTableManager(_$AppDatabase db, $TablaErrorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TablaErrorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TablaErrorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TablaErrorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TablaErrorsCompanion(
                id: id,
                descripcion: descripcion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> descripcion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TablaErrorsCompanion.insert(
                id: id,
                descripcion: descripcion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TablaErrorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TablaErrorsTable,
      TablaError,
      $$TablaErrorsTableFilterComposer,
      $$TablaErrorsTableOrderingComposer,
      $$TablaErrorsTableAnnotationComposer,
      $$TablaErrorsTableCreateCompanionBuilder,
      $$TablaErrorsTableUpdateCompanionBuilder,
      (
        TablaError,
        BaseReferences<_$AppDatabase, $TablaErrorsTable, TablaError>,
      ),
      TablaError,
      PrefetchHooks Function()
    >;
typedef $$MetodoPagosTableCreateCompanionBuilder =
    MetodoPagosCompanion Function({Value<int> id, Value<String?> descripcion});
typedef $$MetodoPagosTableUpdateCompanionBuilder =
    MetodoPagosCompanion Function({Value<int> id, Value<String?> descripcion});

final class $$MetodoPagosTableReferences
    extends BaseReferences<_$AppDatabase, $MetodoPagosTable, MetodoPago> {
  $$MetodoPagosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PagosTable, List<Pago>> _pagosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pagos,
    aliasName: $_aliasNameGenerator(db.metodoPagos.id, db.pagos.idMetodoPago),
  );

  $$PagosTableProcessedTableManager get pagosRefs {
    final manager = $$PagosTableTableManager(
      $_db,
      $_db.pagos,
    ).filter((f) => f.idMetodoPago.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pagosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MetodoPagosTableFilterComposer
    extends Composer<_$AppDatabase, $MetodoPagosTable> {
  $$MetodoPagosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> pagosRefs(
    Expression<bool> Function($$PagosTableFilterComposer f) f,
  ) {
    final $$PagosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idMetodoPago,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableFilterComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MetodoPagosTableOrderingComposer
    extends Composer<_$AppDatabase, $MetodoPagosTable> {
  $$MetodoPagosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MetodoPagosTableAnnotationComposer
    extends Composer<_$AppDatabase, $MetodoPagosTable> {
  $$MetodoPagosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> pagosRefs<T extends Object>(
    Expression<T> Function($$PagosTableAnnotationComposer a) f,
  ) {
    final $$PagosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idMetodoPago,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableAnnotationComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MetodoPagosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MetodoPagosTable,
          MetodoPago,
          $$MetodoPagosTableFilterComposer,
          $$MetodoPagosTableOrderingComposer,
          $$MetodoPagosTableAnnotationComposer,
          $$MetodoPagosTableCreateCompanionBuilder,
          $$MetodoPagosTableUpdateCompanionBuilder,
          (MetodoPago, $$MetodoPagosTableReferences),
          MetodoPago,
          PrefetchHooks Function({bool pagosRefs})
        > {
  $$MetodoPagosTableTableManager(_$AppDatabase db, $MetodoPagosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetodoPagosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetodoPagosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetodoPagosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => MetodoPagosCompanion(id: id, descripcion: descripcion),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) =>
                  MetodoPagosCompanion.insert(id: id, descripcion: descripcion),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MetodoPagosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pagosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pagosRefs) db.pagos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pagosRefs)
                    await $_getPrefetchedData<
                      MetodoPago,
                      $MetodoPagosTable,
                      Pago
                    >(
                      currentTable: table,
                      referencedTable: $$MetodoPagosTableReferences
                          ._pagosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MetodoPagosTableReferences(db, table, p0).pagosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idMetodoPago == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MetodoPagosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MetodoPagosTable,
      MetodoPago,
      $$MetodoPagosTableFilterComposer,
      $$MetodoPagosTableOrderingComposer,
      $$MetodoPagosTableAnnotationComposer,
      $$MetodoPagosTableCreateCompanionBuilder,
      $$MetodoPagosTableUpdateCompanionBuilder,
      (MetodoPago, $$MetodoPagosTableReferences),
      MetodoPago,
      PrefetchHooks Function({bool pagosRefs})
    >;
typedef $$CherryLocalsTableCreateCompanionBuilder =
    CherryLocalsCompanion Function({
      Value<int> id,
      Value<String?> direccion,
      Value<String?> nombre,
      Value<String?> telefono,
    });
typedef $$CherryLocalsTableUpdateCompanionBuilder =
    CherryLocalsCompanion Function({
      Value<int> id,
      Value<String?> direccion,
      Value<String?> nombre,
      Value<String?> telefono,
    });

final class $$CherryLocalsTableReferences
    extends BaseReferences<_$AppDatabase, $CherryLocalsTable, CherryLocal> {
  $$CherryLocalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrdensTable, List<Orden>> _ordensRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ordens,
    aliasName: $_aliasNameGenerator(
      db.cherryLocals.id,
      db.ordens.idCherryLocal,
    ),
  );

  $$OrdensTableProcessedTableManager get ordensRefs {
    final manager = $$OrdensTableTableManager(
      $_db,
      $_db.ordens,
    ).filter((f) => f.idCherryLocal.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ordensRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PagosTable, List<Pago>> _pagosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pagos,
    aliasName: $_aliasNameGenerator(db.cherryLocals.id, db.pagos.idCherryLocal),
  );

  $$PagosTableProcessedTableManager get pagosRefs {
    final manager = $$PagosTableTableManager(
      $_db,
      $_db.pagos,
    ).filter((f) => f.idCherryLocal.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pagosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ContienesTable, List<Contiene>>
  _contienesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contienes,
    aliasName: $_aliasNameGenerator(
      db.cherryLocals.id,
      db.contienes.idCherryLocal,
    ),
  );

  $$ContienesTableProcessedTableManager get contienesRefs {
    final manager = $$ContienesTableTableManager(
      $_db,
      $_db.contienes,
    ).filter((f) => f.idCherryLocal.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contienesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CherryLocalsTableFilterComposer
    extends Composer<_$AppDatabase, $CherryLocalsTable> {
  $$CherryLocalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ordensRefs(
    Expression<bool> Function($$OrdensTableFilterComposer f) f,
  ) {
    final $$OrdensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableFilterComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pagosRefs(
    Expression<bool> Function($$PagosTableFilterComposer f) f,
  ) {
    final $$PagosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableFilterComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> contienesRefs(
    Expression<bool> Function($$ContienesTableFilterComposer f) f,
  ) {
    final $$ContienesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableFilterComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CherryLocalsTableOrderingComposer
    extends Composer<_$AppDatabase, $CherryLocalsTable> {
  $$CherryLocalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CherryLocalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CherryLocalsTable> {
  $$CherryLocalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  Expression<T> ordensRefs<T extends Object>(
    Expression<T> Function($$OrdensTableAnnotationComposer a) f,
  ) {
    final $$OrdensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableAnnotationComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pagosRefs<T extends Object>(
    Expression<T> Function($$PagosTableAnnotationComposer a) f,
  ) {
    final $$PagosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableAnnotationComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> contienesRefs<T extends Object>(
    Expression<T> Function($$ContienesTableAnnotationComposer a) f,
  ) {
    final $$ContienesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idCherryLocal,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableAnnotationComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CherryLocalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CherryLocalsTable,
          CherryLocal,
          $$CherryLocalsTableFilterComposer,
          $$CherryLocalsTableOrderingComposer,
          $$CherryLocalsTableAnnotationComposer,
          $$CherryLocalsTableCreateCompanionBuilder,
          $$CherryLocalsTableUpdateCompanionBuilder,
          (CherryLocal, $$CherryLocalsTableReferences),
          CherryLocal,
          PrefetchHooks Function({
            bool ordensRefs,
            bool pagosRefs,
            bool contienesRefs,
          })
        > {
  $$CherryLocalsTableTableManager(_$AppDatabase db, $CherryLocalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CherryLocalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CherryLocalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CherryLocalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
              }) => CherryLocalsCompanion(
                id: id,
                direccion: direccion,
                nombre: nombre,
                telefono: telefono,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
              }) => CherryLocalsCompanion.insert(
                id: id,
                direccion: direccion,
                nombre: nombre,
                telefono: telefono,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CherryLocalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ordensRefs = false, pagosRefs = false, contienesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ordensRefs) db.ordens,
                    if (pagosRefs) db.pagos,
                    if (contienesRefs) db.contienes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ordensRefs)
                        await $_getPrefetchedData<
                          CherryLocal,
                          $CherryLocalsTable,
                          Orden
                        >(
                          currentTable: table,
                          referencedTable: $$CherryLocalsTableReferences
                              ._ordensRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CherryLocalsTableReferences(
                                db,
                                table,
                                p0,
                              ).ordensRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idCherryLocal == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (pagosRefs)
                        await $_getPrefetchedData<
                          CherryLocal,
                          $CherryLocalsTable,
                          Pago
                        >(
                          currentTable: table,
                          referencedTable: $$CherryLocalsTableReferences
                              ._pagosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CherryLocalsTableReferences(
                                db,
                                table,
                                p0,
                              ).pagosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idCherryLocal == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (contienesRefs)
                        await $_getPrefetchedData<
                          CherryLocal,
                          $CherryLocalsTable,
                          Contiene
                        >(
                          currentTable: table,
                          referencedTable: $$CherryLocalsTableReferences
                              ._contienesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CherryLocalsTableReferences(
                                db,
                                table,
                                p0,
                              ).contienesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idCherryLocal == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CherryLocalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CherryLocalsTable,
      CherryLocal,
      $$CherryLocalsTableFilterComposer,
      $$CherryLocalsTableOrderingComposer,
      $$CherryLocalsTableAnnotationComposer,
      $$CherryLocalsTableCreateCompanionBuilder,
      $$CherryLocalsTableUpdateCompanionBuilder,
      (CherryLocal, $$CherryLocalsTableReferences),
      CherryLocal,
      PrefetchHooks Function({
        bool ordensRefs,
        bool pagosRefs,
        bool contienesRefs,
      })
    >;
typedef $$RolsTableCreateCompanionBuilder =
    RolsCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<double?> sueldo,
    });
typedef $$RolsTableUpdateCompanionBuilder =
    RolsCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<double?> sueldo,
    });

final class $$RolsTableReferences
    extends BaseReferences<_$AppDatabase, $RolsTable, Rol> {
  $$RolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EmpleadosTable, List<Empleado>>
  _empleadosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.empleados,
    aliasName: $_aliasNameGenerator(db.rols.id, db.empleados.idRol),
  );

  $$EmpleadosTableProcessedTableManager get empleadosRefs {
    final manager = $$EmpleadosTableTableManager(
      $_db,
      $_db.empleados,
    ).filter((f) => f.idRol.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_empleadosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RolsTableFilterComposer extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sueldo => $composableBuilder(
    column: $table.sueldo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> empleadosRefs(
    Expression<bool> Function($$EmpleadosTableFilterComposer f) f,
  ) {
    final $$EmpleadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.idRol,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableFilterComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RolsTableOrderingComposer extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sueldo => $composableBuilder(
    column: $table.sueldo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sueldo =>
      $composableBuilder(column: $table.sueldo, builder: (column) => column);

  Expression<T> empleadosRefs<T extends Object>(
    Expression<T> Function($$EmpleadosTableAnnotationComposer a) f,
  ) {
    final $$EmpleadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.idRol,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableAnnotationComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RolsTable,
          Rol,
          $$RolsTableFilterComposer,
          $$RolsTableOrderingComposer,
          $$RolsTableAnnotationComposer,
          $$RolsTableCreateCompanionBuilder,
          $$RolsTableUpdateCompanionBuilder,
          (Rol, $$RolsTableReferences),
          Rol,
          PrefetchHooks Function({bool empleadosRefs})
        > {
  $$RolsTableTableManager(_$AppDatabase db, $RolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<double?> sueldo = const Value.absent(),
              }) => RolsCompanion(
                id: id,
                descripcion: descripcion,
                sueldo: sueldo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<double?> sueldo = const Value.absent(),
              }) => RolsCompanion.insert(
                id: id,
                descripcion: descripcion,
                sueldo: sueldo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RolsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({empleadosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (empleadosRefs) db.empleados],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (empleadosRefs)
                    await $_getPrefetchedData<Rol, $RolsTable, Empleado>(
                      currentTable: table,
                      referencedTable: $$RolsTableReferences
                          ._empleadosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RolsTableReferences(db, table, p0).empleadosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idRol == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RolsTable,
      Rol,
      $$RolsTableFilterComposer,
      $$RolsTableOrderingComposer,
      $$RolsTableAnnotationComposer,
      $$RolsTableCreateCompanionBuilder,
      $$RolsTableUpdateCompanionBuilder,
      (Rol, $$RolsTableReferences),
      Rol,
      PrefetchHooks Function({bool empleadosRefs})
    >;
typedef $$TurnosTableCreateCompanionBuilder =
    TurnosCompanion Function({
      Value<int> id,
      Value<String?> horaInicio,
      Value<String?> horaFin,
      Value<String?> descripcion,
    });
typedef $$TurnosTableUpdateCompanionBuilder =
    TurnosCompanion Function({
      Value<int> id,
      Value<String?> horaInicio,
      Value<String?> horaFin,
      Value<String?> descripcion,
    });

final class $$TurnosTableReferences
    extends BaseReferences<_$AppDatabase, $TurnosTable, Turno> {
  $$TurnosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EmpleadosTable, List<Empleado>>
  _empleadosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.empleados,
    aliasName: $_aliasNameGenerator(db.turnos.id, db.empleados.idTurno),
  );

  $$EmpleadosTableProcessedTableManager get empleadosRefs {
    final manager = $$EmpleadosTableTableManager(
      $_db,
      $_db.empleados,
    ).filter((f) => f.idTurno.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_empleadosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TurnosTableFilterComposer
    extends Composer<_$AppDatabase, $TurnosTable> {
  $$TurnosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get horaInicio => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get horaFin => $composableBuilder(
    column: $table.horaFin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> empleadosRefs(
    Expression<bool> Function($$EmpleadosTableFilterComposer f) f,
  ) {
    final $$EmpleadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.idTurno,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableFilterComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TurnosTableOrderingComposer
    extends Composer<_$AppDatabase, $TurnosTable> {
  $$TurnosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get horaInicio => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get horaFin => $composableBuilder(
    column: $table.horaFin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TurnosTableAnnotationComposer
    extends Composer<_$AppDatabase, $TurnosTable> {
  $$TurnosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get horaInicio => $composableBuilder(
    column: $table.horaInicio,
    builder: (column) => column,
  );

  GeneratedColumn<String> get horaFin =>
      $composableBuilder(column: $table.horaFin, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> empleadosRefs<T extends Object>(
    Expression<T> Function($$EmpleadosTableAnnotationComposer a) f,
  ) {
    final $$EmpleadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.idTurno,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableAnnotationComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TurnosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TurnosTable,
          Turno,
          $$TurnosTableFilterComposer,
          $$TurnosTableOrderingComposer,
          $$TurnosTableAnnotationComposer,
          $$TurnosTableCreateCompanionBuilder,
          $$TurnosTableUpdateCompanionBuilder,
          (Turno, $$TurnosTableReferences),
          Turno,
          PrefetchHooks Function({bool empleadosRefs})
        > {
  $$TurnosTableTableManager(_$AppDatabase db, $TurnosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TurnosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TurnosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TurnosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFin = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => TurnosCompanion(
                id: id,
                horaInicio: horaInicio,
                horaFin: horaFin,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> horaInicio = const Value.absent(),
                Value<String?> horaFin = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => TurnosCompanion.insert(
                id: id,
                horaInicio: horaInicio,
                horaFin: horaFin,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TurnosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({empleadosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (empleadosRefs) db.empleados],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (empleadosRefs)
                    await $_getPrefetchedData<Turno, $TurnosTable, Empleado>(
                      currentTable: table,
                      referencedTable: $$TurnosTableReferences
                          ._empleadosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TurnosTableReferences(db, table, p0).empleadosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idTurno == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TurnosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TurnosTable,
      Turno,
      $$TurnosTableFilterComposer,
      $$TurnosTableOrderingComposer,
      $$TurnosTableAnnotationComposer,
      $$TurnosTableCreateCompanionBuilder,
      $$TurnosTableUpdateCompanionBuilder,
      (Turno, $$TurnosTableReferences),
      Turno,
      PrefetchHooks Function({bool empleadosRefs})
    >;
typedef $$BonusesTableCreateCompanionBuilder =
    BonusesCompanion Function({
      Value<int> id,
      Value<double?> valor,
      Value<String?> descripcion,
    });
typedef $$BonusesTableUpdateCompanionBuilder =
    BonusesCompanion Function({
      Value<int> id,
      Value<double?> valor,
      Value<String?> descripcion,
    });

final class $$BonusesTableReferences
    extends BaseReferences<_$AppDatabase, $BonusesTable, Bonuse> {
  $$BonusesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BeneficiosTable, List<Beneficio>>
  _beneficiosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.beneficios,
    aliasName: $_aliasNameGenerator(db.bonuses.id, db.beneficios.idBonus),
  );

  $$BeneficiosTableProcessedTableManager get beneficiosRefs {
    final manager = $$BeneficiosTableTableManager(
      $_db,
      $_db.beneficios,
    ).filter((f) => f.idBonus.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_beneficiosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BonusesTableFilterComposer
    extends Composer<_$AppDatabase, $BonusesTable> {
  $$BonusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valor => $composableBuilder(
    column: $table.valor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> beneficiosRefs(
    Expression<bool> Function($$BeneficiosTableFilterComposer f) f,
  ) {
    final $$BeneficiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.beneficios,
      getReferencedColumn: (t) => t.idBonus,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeneficiosTableFilterComposer(
            $db: $db,
            $table: $db.beneficios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BonusesTableOrderingComposer
    extends Composer<_$AppDatabase, $BonusesTable> {
  $$BonusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valor => $composableBuilder(
    column: $table.valor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BonusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BonusesTable> {
  $$BonusesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get valor =>
      $composableBuilder(column: $table.valor, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> beneficiosRefs<T extends Object>(
    Expression<T> Function($$BeneficiosTableAnnotationComposer a) f,
  ) {
    final $$BeneficiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.beneficios,
      getReferencedColumn: (t) => t.idBonus,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeneficiosTableAnnotationComposer(
            $db: $db,
            $table: $db.beneficios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BonusesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BonusesTable,
          Bonuse,
          $$BonusesTableFilterComposer,
          $$BonusesTableOrderingComposer,
          $$BonusesTableAnnotationComposer,
          $$BonusesTableCreateCompanionBuilder,
          $$BonusesTableUpdateCompanionBuilder,
          (Bonuse, $$BonusesTableReferences),
          Bonuse,
          PrefetchHooks Function({bool beneficiosRefs})
        > {
  $$BonusesTableTableManager(_$AppDatabase db, $BonusesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BonusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BonusesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BonusesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double?> valor = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => BonusesCompanion(
                id: id,
                valor: valor,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double?> valor = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => BonusesCompanion.insert(
                id: id,
                valor: valor,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BonusesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({beneficiosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (beneficiosRefs) db.beneficios],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (beneficiosRefs)
                    await $_getPrefetchedData<Bonuse, $BonusesTable, Beneficio>(
                      currentTable: table,
                      referencedTable: $$BonusesTableReferences
                          ._beneficiosRefsTable(db),
                      managerFromTypedResult: (p0) => $$BonusesTableReferences(
                        db,
                        table,
                        p0,
                      ).beneficiosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idBonus == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BonusesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BonusesTable,
      Bonuse,
      $$BonusesTableFilterComposer,
      $$BonusesTableOrderingComposer,
      $$BonusesTableAnnotationComposer,
      $$BonusesTableCreateCompanionBuilder,
      $$BonusesTableUpdateCompanionBuilder,
      (Bonuse, $$BonusesTableReferences),
      Bonuse,
      PrefetchHooks Function({bool beneficiosRefs})
    >;
typedef $$EmpleadosTableCreateCompanionBuilder =
    EmpleadosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> telefono,
      required String curp,
      required String rfc,
      Value<String?> fechaIngreso,
      required String nss,
      Value<String?> foto,
      Value<int?> idRol,
      Value<int?> idTurno,
    });
typedef $$EmpleadosTableUpdateCompanionBuilder =
    EmpleadosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> telefono,
      Value<String> curp,
      Value<String> rfc,
      Value<String?> fechaIngreso,
      Value<String> nss,
      Value<String?> foto,
      Value<int?> idRol,
      Value<int?> idTurno,
    });

final class $$EmpleadosTableReferences
    extends BaseReferences<_$AppDatabase, $EmpleadosTable, Empleado> {
  $$EmpleadosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RolsTable _idRolTable(_$AppDatabase db) =>
      db.rols.createAlias($_aliasNameGenerator(db.empleados.idRol, db.rols.id));

  $$RolsTableProcessedTableManager? get idRol {
    final $_column = $_itemColumn<int>('id_rol');
    if ($_column == null) return null;
    final manager = $$RolsTableTableManager(
      $_db,
      $_db.rols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idRolTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TurnosTable _idTurnoTable(_$AppDatabase db) => db.turnos.createAlias(
    $_aliasNameGenerator(db.empleados.idTurno, db.turnos.id),
  );

  $$TurnosTableProcessedTableManager? get idTurno {
    final $_column = $_itemColumn<int>('id_turno');
    if ($_column == null) return null;
    final manager = $$TurnosTableTableManager(
      $_db,
      $_db.turnos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idTurnoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NominasTable, List<Nomina>> _nominasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.nominas,
    aliasName: $_aliasNameGenerator(db.empleados.id, db.nominas.idEmpleado),
  );

  $$NominasTableProcessedTableManager get nominasRefs {
    final manager = $$NominasTableTableManager(
      $_db,
      $_db.nominas,
    ).filter((f) => f.idEmpleado.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_nominasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CuentasTable, List<Cuenta>> _cuentasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.cuentas,
    aliasName: $_aliasNameGenerator(db.empleados.id, db.cuentas.idEmpleado),
  );

  $$CuentasTableProcessedTableManager get cuentasRefs {
    final manager = $$CuentasTableTableManager(
      $_db,
      $_db.cuentas,
    ).filter((f) => f.idEmpleado.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cuentasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrdensTable, List<Orden>> _ordensRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ordens,
    aliasName: $_aliasNameGenerator(db.empleados.id, db.ordens.idEmpleado),
  );

  $$OrdensTableProcessedTableManager get ordensRefs {
    final manager = $$OrdensTableTableManager(
      $_db,
      $_db.ordens,
    ).filter((f) => f.idEmpleado.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ordensRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EmpleadosTableFilterComposer
    extends Composer<_$AppDatabase, $EmpleadosTable> {
  $$EmpleadosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get curp => $composableBuilder(
    column: $table.curp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rfc => $composableBuilder(
    column: $table.rfc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nss => $composableBuilder(
    column: $table.nss,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnFilters(column),
  );

  $$RolsTableFilterComposer get idRol {
    final $$RolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idRol,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableFilterComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TurnosTableFilterComposer get idTurno {
    final $$TurnosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idTurno,
      referencedTable: $db.turnos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TurnosTableFilterComposer(
            $db: $db,
            $table: $db.turnos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> nominasRefs(
    Expression<bool> Function($$NominasTableFilterComposer f) f,
  ) {
    final $$NominasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nominas,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NominasTableFilterComposer(
            $db: $db,
            $table: $db.nominas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cuentasRefs(
    Expression<bool> Function($$CuentasTableFilterComposer f) f,
  ) {
    final $$CuentasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cuentas,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuentasTableFilterComposer(
            $db: $db,
            $table: $db.cuentas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ordensRefs(
    Expression<bool> Function($$OrdensTableFilterComposer f) f,
  ) {
    final $$OrdensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableFilterComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmpleadosTableOrderingComposer
    extends Composer<_$AppDatabase, $EmpleadosTable> {
  $$EmpleadosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get curp => $composableBuilder(
    column: $table.curp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rfc => $composableBuilder(
    column: $table.rfc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nss => $composableBuilder(
    column: $table.nss,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnOrderings(column),
  );

  $$RolsTableOrderingComposer get idRol {
    final $$RolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idRol,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableOrderingComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TurnosTableOrderingComposer get idTurno {
    final $$TurnosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idTurno,
      referencedTable: $db.turnos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TurnosTableOrderingComposer(
            $db: $db,
            $table: $db.turnos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmpleadosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmpleadosTable> {
  $$EmpleadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get curp =>
      $composableBuilder(column: $table.curp, builder: (column) => column);

  GeneratedColumn<String> get rfc =>
      $composableBuilder(column: $table.rfc, builder: (column) => column);

  GeneratedColumn<String> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nss =>
      $composableBuilder(column: $table.nss, builder: (column) => column);

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);

  $$RolsTableAnnotationComposer get idRol {
    final $$RolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idRol,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableAnnotationComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TurnosTableAnnotationComposer get idTurno {
    final $$TurnosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idTurno,
      referencedTable: $db.turnos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TurnosTableAnnotationComposer(
            $db: $db,
            $table: $db.turnos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> nominasRefs<T extends Object>(
    Expression<T> Function($$NominasTableAnnotationComposer a) f,
  ) {
    final $$NominasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nominas,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NominasTableAnnotationComposer(
            $db: $db,
            $table: $db.nominas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cuentasRefs<T extends Object>(
    Expression<T> Function($$CuentasTableAnnotationComposer a) f,
  ) {
    final $$CuentasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cuentas,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuentasTableAnnotationComposer(
            $db: $db,
            $table: $db.cuentas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ordensRefs<T extends Object>(
    Expression<T> Function($$OrdensTableAnnotationComposer a) f,
  ) {
    final $$OrdensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.idEmpleado,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableAnnotationComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmpleadosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmpleadosTable,
          Empleado,
          $$EmpleadosTableFilterComposer,
          $$EmpleadosTableOrderingComposer,
          $$EmpleadosTableAnnotationComposer,
          $$EmpleadosTableCreateCompanionBuilder,
          $$EmpleadosTableUpdateCompanionBuilder,
          (Empleado, $$EmpleadosTableReferences),
          Empleado,
          PrefetchHooks Function({
            bool idRol,
            bool idTurno,
            bool nominasRefs,
            bool cuentasRefs,
            bool ordensRefs,
          })
        > {
  $$EmpleadosTableTableManager(_$AppDatabase db, $EmpleadosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmpleadosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmpleadosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmpleadosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String> curp = const Value.absent(),
                Value<String> rfc = const Value.absent(),
                Value<String?> fechaIngreso = const Value.absent(),
                Value<String> nss = const Value.absent(),
                Value<String?> foto = const Value.absent(),
                Value<int?> idRol = const Value.absent(),
                Value<int?> idTurno = const Value.absent(),
              }) => EmpleadosCompanion(
                id: id,
                nombre: nombre,
                telefono: telefono,
                curp: curp,
                rfc: rfc,
                fechaIngreso: fechaIngreso,
                nss: nss,
                foto: foto,
                idRol: idRol,
                idTurno: idTurno,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                required String curp,
                required String rfc,
                Value<String?> fechaIngreso = const Value.absent(),
                required String nss,
                Value<String?> foto = const Value.absent(),
                Value<int?> idRol = const Value.absent(),
                Value<int?> idTurno = const Value.absent(),
              }) => EmpleadosCompanion.insert(
                id: id,
                nombre: nombre,
                telefono: telefono,
                curp: curp,
                rfc: rfc,
                fechaIngreso: fechaIngreso,
                nss: nss,
                foto: foto,
                idRol: idRol,
                idTurno: idTurno,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmpleadosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idRol = false,
                idTurno = false,
                nominasRefs = false,
                cuentasRefs = false,
                ordensRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (nominasRefs) db.nominas,
                    if (cuentasRefs) db.cuentas,
                    if (ordensRefs) db.ordens,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idRol) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idRol,
                                    referencedTable: $$EmpleadosTableReferences
                                        ._idRolTable(db),
                                    referencedColumn: $$EmpleadosTableReferences
                                        ._idRolTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idTurno) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idTurno,
                                    referencedTable: $$EmpleadosTableReferences
                                        ._idTurnoTable(db),
                                    referencedColumn: $$EmpleadosTableReferences
                                        ._idTurnoTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (nominasRefs)
                        await $_getPrefetchedData<
                          Empleado,
                          $EmpleadosTable,
                          Nomina
                        >(
                          currentTable: table,
                          referencedTable: $$EmpleadosTableReferences
                              ._nominasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmpleadosTableReferences(
                                db,
                                table,
                                p0,
                              ).nominasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idEmpleado == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cuentasRefs)
                        await $_getPrefetchedData<
                          Empleado,
                          $EmpleadosTable,
                          Cuenta
                        >(
                          currentTable: table,
                          referencedTable: $$EmpleadosTableReferences
                              ._cuentasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmpleadosTableReferences(
                                db,
                                table,
                                p0,
                              ).cuentasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idEmpleado == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ordensRefs)
                        await $_getPrefetchedData<
                          Empleado,
                          $EmpleadosTable,
                          Orden
                        >(
                          currentTable: table,
                          referencedTable: $$EmpleadosTableReferences
                              ._ordensRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmpleadosTableReferences(
                                db,
                                table,
                                p0,
                              ).ordensRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idEmpleado == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EmpleadosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmpleadosTable,
      Empleado,
      $$EmpleadosTableFilterComposer,
      $$EmpleadosTableOrderingComposer,
      $$EmpleadosTableAnnotationComposer,
      $$EmpleadosTableCreateCompanionBuilder,
      $$EmpleadosTableUpdateCompanionBuilder,
      (Empleado, $$EmpleadosTableReferences),
      Empleado,
      PrefetchHooks Function({
        bool idRol,
        bool idTurno,
        bool nominasRefs,
        bool cuentasRefs,
        bool ordensRefs,
      })
    >;
typedef $$NominasTableCreateCompanionBuilder =
    NominasCompanion Function({
      required int idEmpleado,
      required String fechaPago,
      Value<double?> salarioTotal,
      Value<int> rowid,
    });
typedef $$NominasTableUpdateCompanionBuilder =
    NominasCompanion Function({
      Value<int> idEmpleado,
      Value<String> fechaPago,
      Value<double?> salarioTotal,
      Value<int> rowid,
    });

final class $$NominasTableReferences
    extends BaseReferences<_$AppDatabase, $NominasTable, Nomina> {
  $$NominasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmpleadosTable _idEmpleadoTable(_$AppDatabase db) =>
      db.empleados.createAlias(
        $_aliasNameGenerator(db.nominas.idEmpleado, db.empleados.id),
      );

  $$EmpleadosTableProcessedTableManager get idEmpleado {
    final $_column = $_itemColumn<int>('id_empleado')!;

    final manager = $$EmpleadosTableTableManager(
      $_db,
      $_db.empleados,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEmpleadoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BeneficiosTable, List<Beneficio>>
  _beneficiosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.beneficios,
    aliasName: $_aliasNameGenerator(
      db.nominas.fechaPago,
      db.beneficios.fechaPagoNomina,
    ),
  );

  $$BeneficiosTableProcessedTableManager get beneficiosRefs {
    final manager = $$BeneficiosTableTableManager($_db, $_db.beneficios).filter(
      (f) => f.fechaPagoNomina.fechaPago.sqlEquals(
        $_itemColumn<String>('fecha_pago')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_beneficiosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NominasTableFilterComposer
    extends Composer<_$AppDatabase, $NominasTable> {
  $$NominasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get fechaPago => $composableBuilder(
    column: $table.fechaPago,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salarioTotal => $composableBuilder(
    column: $table.salarioTotal,
    builder: (column) => ColumnFilters(column),
  );

  $$EmpleadosTableFilterComposer get idEmpleado {
    final $$EmpleadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableFilterComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> beneficiosRefs(
    Expression<bool> Function($$BeneficiosTableFilterComposer f) f,
  ) {
    final $$BeneficiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fechaPago,
      referencedTable: $db.beneficios,
      getReferencedColumn: (t) => t.fechaPagoNomina,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeneficiosTableFilterComposer(
            $db: $db,
            $table: $db.beneficios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NominasTableOrderingComposer
    extends Composer<_$AppDatabase, $NominasTable> {
  $$NominasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get fechaPago => $composableBuilder(
    column: $table.fechaPago,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salarioTotal => $composableBuilder(
    column: $table.salarioTotal,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmpleadosTableOrderingComposer get idEmpleado {
    final $$EmpleadosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableOrderingComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NominasTableAnnotationComposer
    extends Composer<_$AppDatabase, $NominasTable> {
  $$NominasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get fechaPago =>
      $composableBuilder(column: $table.fechaPago, builder: (column) => column);

  GeneratedColumn<double> get salarioTotal => $composableBuilder(
    column: $table.salarioTotal,
    builder: (column) => column,
  );

  $$EmpleadosTableAnnotationComposer get idEmpleado {
    final $$EmpleadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableAnnotationComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> beneficiosRefs<T extends Object>(
    Expression<T> Function($$BeneficiosTableAnnotationComposer a) f,
  ) {
    final $$BeneficiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fechaPago,
      referencedTable: $db.beneficios,
      getReferencedColumn: (t) => t.fechaPagoNomina,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeneficiosTableAnnotationComposer(
            $db: $db,
            $table: $db.beneficios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NominasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NominasTable,
          Nomina,
          $$NominasTableFilterComposer,
          $$NominasTableOrderingComposer,
          $$NominasTableAnnotationComposer,
          $$NominasTableCreateCompanionBuilder,
          $$NominasTableUpdateCompanionBuilder,
          (Nomina, $$NominasTableReferences),
          Nomina,
          PrefetchHooks Function({bool idEmpleado, bool beneficiosRefs})
        > {
  $$NominasTableTableManager(_$AppDatabase db, $NominasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NominasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NominasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NominasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idEmpleado = const Value.absent(),
                Value<String> fechaPago = const Value.absent(),
                Value<double?> salarioTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NominasCompanion(
                idEmpleado: idEmpleado,
                fechaPago: fechaPago,
                salarioTotal: salarioTotal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idEmpleado,
                required String fechaPago,
                Value<double?> salarioTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NominasCompanion.insert(
                idEmpleado: idEmpleado,
                fechaPago: fechaPago,
                salarioTotal: salarioTotal,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NominasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idEmpleado = false, beneficiosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (beneficiosRefs) db.beneficios],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idEmpleado) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idEmpleado,
                                    referencedTable: $$NominasTableReferences
                                        ._idEmpleadoTable(db),
                                    referencedColumn: $$NominasTableReferences
                                        ._idEmpleadoTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (beneficiosRefs)
                        await $_getPrefetchedData<
                          Nomina,
                          $NominasTable,
                          Beneficio
                        >(
                          currentTable: table,
                          referencedTable: $$NominasTableReferences
                              ._beneficiosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NominasTableReferences(
                                db,
                                table,
                                p0,
                              ).beneficiosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.fechaPagoNomina == item.fechaPago,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$NominasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NominasTable,
      Nomina,
      $$NominasTableFilterComposer,
      $$NominasTableOrderingComposer,
      $$NominasTableAnnotationComposer,
      $$NominasTableCreateCompanionBuilder,
      $$NominasTableUpdateCompanionBuilder,
      (Nomina, $$NominasTableReferences),
      Nomina,
      PrefetchHooks Function({bool idEmpleado, bool beneficiosRefs})
    >;
typedef $$BeneficiosTableCreateCompanionBuilder =
    BeneficiosCompanion Function({
      required int idEmpleado,
      required String fechaPagoNomina,
      required int idBonus,
      Value<int> rowid,
    });
typedef $$BeneficiosTableUpdateCompanionBuilder =
    BeneficiosCompanion Function({
      Value<int> idEmpleado,
      Value<String> fechaPagoNomina,
      Value<int> idBonus,
      Value<int> rowid,
    });

final class $$BeneficiosTableReferences
    extends BaseReferences<_$AppDatabase, $BeneficiosTable, Beneficio> {
  $$BeneficiosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NominasTable _fechaPagoNominaTable(_$AppDatabase db) =>
      db.nominas.createAlias(
        $_aliasNameGenerator(
          db.beneficios.fechaPagoNomina,
          db.nominas.fechaPago,
        ),
      );

  $$NominasTableProcessedTableManager get fechaPagoNomina {
    final $_column = $_itemColumn<String>('fecha_pago_nomina')!;

    final manager = $$NominasTableTableManager(
      $_db,
      $_db.nominas,
    ).filter((f) => f.fechaPago.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fechaPagoNominaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BonusesTable _idBonusTable(_$AppDatabase db) => db.bonuses
      .createAlias($_aliasNameGenerator(db.beneficios.idBonus, db.bonuses.id));

  $$BonusesTableProcessedTableManager get idBonus {
    final $_column = $_itemColumn<int>('id_bonus')!;

    final manager = $$BonusesTableTableManager(
      $_db,
      $_db.bonuses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idBonusTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BeneficiosTableFilterComposer
    extends Composer<_$AppDatabase, $BeneficiosTable> {
  $$BeneficiosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NominasTableFilterComposer get fechaPagoNomina {
    final $$NominasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fechaPagoNomina,
      referencedTable: $db.nominas,
      getReferencedColumn: (t) => t.fechaPago,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NominasTableFilterComposer(
            $db: $db,
            $table: $db.nominas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BonusesTableFilterComposer get idBonus {
    final $$BonusesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBonus,
      referencedTable: $db.bonuses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BonusesTableFilterComposer(
            $db: $db,
            $table: $db.bonuses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BeneficiosTableOrderingComposer
    extends Composer<_$AppDatabase, $BeneficiosTable> {
  $$BeneficiosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NominasTableOrderingComposer get fechaPagoNomina {
    final $$NominasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fechaPagoNomina,
      referencedTable: $db.nominas,
      getReferencedColumn: (t) => t.fechaPago,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NominasTableOrderingComposer(
            $db: $db,
            $table: $db.nominas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BonusesTableOrderingComposer get idBonus {
    final $$BonusesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBonus,
      referencedTable: $db.bonuses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BonusesTableOrderingComposer(
            $db: $db,
            $table: $db.bonuses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BeneficiosTableAnnotationComposer
    extends Composer<_$AppDatabase, $BeneficiosTable> {
  $$BeneficiosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$NominasTableAnnotationComposer get fechaPagoNomina {
    final $$NominasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fechaPagoNomina,
      referencedTable: $db.nominas,
      getReferencedColumn: (t) => t.fechaPago,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NominasTableAnnotationComposer(
            $db: $db,
            $table: $db.nominas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BonusesTableAnnotationComposer get idBonus {
    final $$BonusesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idBonus,
      referencedTable: $db.bonuses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BonusesTableAnnotationComposer(
            $db: $db,
            $table: $db.bonuses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BeneficiosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BeneficiosTable,
          Beneficio,
          $$BeneficiosTableFilterComposer,
          $$BeneficiosTableOrderingComposer,
          $$BeneficiosTableAnnotationComposer,
          $$BeneficiosTableCreateCompanionBuilder,
          $$BeneficiosTableUpdateCompanionBuilder,
          (Beneficio, $$BeneficiosTableReferences),
          Beneficio,
          PrefetchHooks Function({bool fechaPagoNomina, bool idBonus})
        > {
  $$BeneficiosTableTableManager(_$AppDatabase db, $BeneficiosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BeneficiosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BeneficiosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BeneficiosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idEmpleado = const Value.absent(),
                Value<String> fechaPagoNomina = const Value.absent(),
                Value<int> idBonus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BeneficiosCompanion(
                idEmpleado: idEmpleado,
                fechaPagoNomina: fechaPagoNomina,
                idBonus: idBonus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idEmpleado,
                required String fechaPagoNomina,
                required int idBonus,
                Value<int> rowid = const Value.absent(),
              }) => BeneficiosCompanion.insert(
                idEmpleado: idEmpleado,
                fechaPagoNomina: fechaPagoNomina,
                idBonus: idBonus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BeneficiosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({fechaPagoNomina = false, idBonus = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (fechaPagoNomina) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.fechaPagoNomina,
                                referencedTable: $$BeneficiosTableReferences
                                    ._fechaPagoNominaTable(db),
                                referencedColumn: $$BeneficiosTableReferences
                                    ._fechaPagoNominaTable(db)
                                    .fechaPago,
                              )
                              as T;
                    }
                    if (idBonus) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idBonus,
                                referencedTable: $$BeneficiosTableReferences
                                    ._idBonusTable(db),
                                referencedColumn: $$BeneficiosTableReferences
                                    ._idBonusTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BeneficiosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BeneficiosTable,
      Beneficio,
      $$BeneficiosTableFilterComposer,
      $$BeneficiosTableOrderingComposer,
      $$BeneficiosTableAnnotationComposer,
      $$BeneficiosTableCreateCompanionBuilder,
      $$BeneficiosTableUpdateCompanionBuilder,
      (Beneficio, $$BeneficiosTableReferences),
      Beneficio,
      PrefetchHooks Function({bool fechaPagoNomina, bool idBonus})
    >;
typedef $$CuentasTableCreateCompanionBuilder =
    CuentasCompanion Function({
      required int idEmpleado,
      required String nombreUsuario,
      Value<String?> password,
      Value<int> rowid,
    });
typedef $$CuentasTableUpdateCompanionBuilder =
    CuentasCompanion Function({
      Value<int> idEmpleado,
      Value<String> nombreUsuario,
      Value<String?> password,
      Value<int> rowid,
    });

final class $$CuentasTableReferences
    extends BaseReferences<_$AppDatabase, $CuentasTable, Cuenta> {
  $$CuentasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmpleadosTable _idEmpleadoTable(_$AppDatabase db) =>
      db.empleados.createAlias(
        $_aliasNameGenerator(db.cuentas.idEmpleado, db.empleados.id),
      );

  $$EmpleadosTableProcessedTableManager get idEmpleado {
    final $_column = $_itemColumn<int>('id_empleado')!;

    final manager = $$EmpleadosTableTableManager(
      $_db,
      $_db.empleados,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEmpleadoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CuentasTableFilterComposer
    extends Composer<_$AppDatabase, $CuentasTable> {
  $$CuentasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nombreUsuario => $composableBuilder(
    column: $table.nombreUsuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  $$EmpleadosTableFilterComposer get idEmpleado {
    final $$EmpleadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableFilterComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CuentasTableOrderingComposer
    extends Composer<_$AppDatabase, $CuentasTable> {
  $$CuentasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nombreUsuario => $composableBuilder(
    column: $table.nombreUsuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmpleadosTableOrderingComposer get idEmpleado {
    final $$EmpleadosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableOrderingComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CuentasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CuentasTable> {
  $$CuentasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nombreUsuario => $composableBuilder(
    column: $table.nombreUsuario,
    builder: (column) => column,
  );

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  $$EmpleadosTableAnnotationComposer get idEmpleado {
    final $$EmpleadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableAnnotationComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CuentasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CuentasTable,
          Cuenta,
          $$CuentasTableFilterComposer,
          $$CuentasTableOrderingComposer,
          $$CuentasTableAnnotationComposer,
          $$CuentasTableCreateCompanionBuilder,
          $$CuentasTableUpdateCompanionBuilder,
          (Cuenta, $$CuentasTableReferences),
          Cuenta,
          PrefetchHooks Function({bool idEmpleado})
        > {
  $$CuentasTableTableManager(_$AppDatabase db, $CuentasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CuentasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CuentasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CuentasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idEmpleado = const Value.absent(),
                Value<String> nombreUsuario = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CuentasCompanion(
                idEmpleado: idEmpleado,
                nombreUsuario: nombreUsuario,
                password: password,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idEmpleado,
                required String nombreUsuario,
                Value<String?> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CuentasCompanion.insert(
                idEmpleado: idEmpleado,
                nombreUsuario: nombreUsuario,
                password: password,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CuentasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idEmpleado = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idEmpleado) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idEmpleado,
                                referencedTable: $$CuentasTableReferences
                                    ._idEmpleadoTable(db),
                                referencedColumn: $$CuentasTableReferences
                                    ._idEmpleadoTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CuentasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CuentasTable,
      Cuenta,
      $$CuentasTableFilterComposer,
      $$CuentasTableOrderingComposer,
      $$CuentasTableAnnotationComposer,
      $$CuentasTableCreateCompanionBuilder,
      $$CuentasTableUpdateCompanionBuilder,
      (Cuenta, $$CuentasTableReferences),
      Cuenta,
      PrefetchHooks Function({bool idEmpleado})
    >;
typedef $$OrdensTableCreateCompanionBuilder =
    OrdensCompanion Function({
      Value<int> id,
      Value<int?> idCherryLocal,
      Value<double?> total,
      Value<String?> fechaRealizada,
      Value<int?> idEmpleado,
    });
typedef $$OrdensTableUpdateCompanionBuilder =
    OrdensCompanion Function({
      Value<int> id,
      Value<int?> idCherryLocal,
      Value<double?> total,
      Value<String?> fechaRealizada,
      Value<int?> idEmpleado,
    });

final class $$OrdensTableReferences
    extends BaseReferences<_$AppDatabase, $OrdensTable, Orden> {
  $$OrdensTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CherryLocalsTable _idCherryLocalTable(_$AppDatabase db) =>
      db.cherryLocals.createAlias(
        $_aliasNameGenerator(db.ordens.idCherryLocal, db.cherryLocals.id),
      );

  $$CherryLocalsTableProcessedTableManager? get idCherryLocal {
    final $_column = $_itemColumn<int>('id_cherry_local');
    if ($_column == null) return null;
    final manager = $$CherryLocalsTableTableManager(
      $_db,
      $_db.cherryLocals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCherryLocalTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EmpleadosTable _idEmpleadoTable(_$AppDatabase db) => db.empleados
      .createAlias($_aliasNameGenerator(db.ordens.idEmpleado, db.empleados.id));

  $$EmpleadosTableProcessedTableManager? get idEmpleado {
    final $_column = $_itemColumn<int>('id_empleado');
    if ($_column == null) return null;
    final manager = $$EmpleadosTableTableManager(
      $_db,
      $_db.empleados,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEmpleadoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PagosTable, List<Pago>> _pagosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.pagos,
    aliasName: $_aliasNameGenerator(db.ordens.id, db.pagos.idOrden),
  );

  $$PagosTableProcessedTableManager get pagosRefs {
    final manager = $$PagosTableTableManager(
      $_db,
      $_db.pagos,
    ).filter((f) => f.idOrden.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pagosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ContienesTable, List<Contiene>>
  _contienesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contienes,
    aliasName: $_aliasNameGenerator(db.ordens.id, db.contienes.idOrden),
  );

  $$ContienesTableProcessedTableManager get contienesRefs {
    final manager = $$ContienesTableTableManager(
      $_db,
      $_db.contienes,
    ).filter((f) => f.idOrden.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contienesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrdensTableFilterComposer
    extends Composer<_$AppDatabase, $OrdensTable> {
  $$OrdensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fechaRealizada => $composableBuilder(
    column: $table.fechaRealizada,
    builder: (column) => ColumnFilters(column),
  );

  $$CherryLocalsTableFilterComposer get idCherryLocal {
    final $$CherryLocalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableFilterComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmpleadosTableFilterComposer get idEmpleado {
    final $$EmpleadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableFilterComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> pagosRefs(
    Expression<bool> Function($$PagosTableFilterComposer f) f,
  ) {
    final $$PagosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idOrden,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableFilterComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> contienesRefs(
    Expression<bool> Function($$ContienesTableFilterComposer f) f,
  ) {
    final $$ContienesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idOrden,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableFilterComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdensTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdensTable> {
  $$OrdensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fechaRealizada => $composableBuilder(
    column: $table.fechaRealizada,
    builder: (column) => ColumnOrderings(column),
  );

  $$CherryLocalsTableOrderingComposer get idCherryLocal {
    final $$CherryLocalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableOrderingComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmpleadosTableOrderingComposer get idEmpleado {
    final $$EmpleadosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableOrderingComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdensTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdensTable> {
  $$OrdensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get fechaRealizada => $composableBuilder(
    column: $table.fechaRealizada,
    builder: (column) => column,
  );

  $$CherryLocalsTableAnnotationComposer get idCherryLocal {
    final $$CherryLocalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableAnnotationComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmpleadosTableAnnotationComposer get idEmpleado {
    final $$EmpleadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEmpleado,
      referencedTable: $db.empleados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmpleadosTableAnnotationComposer(
            $db: $db,
            $table: $db.empleados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> pagosRefs<T extends Object>(
    Expression<T> Function($$PagosTableAnnotationComposer a) f,
  ) {
    final $$PagosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pagos,
      getReferencedColumn: (t) => t.idOrden,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PagosTableAnnotationComposer(
            $db: $db,
            $table: $db.pagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> contienesRefs<T extends Object>(
    Expression<T> Function($$ContienesTableAnnotationComposer a) f,
  ) {
    final $$ContienesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idOrden,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableAnnotationComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdensTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdensTable,
          Orden,
          $$OrdensTableFilterComposer,
          $$OrdensTableOrderingComposer,
          $$OrdensTableAnnotationComposer,
          $$OrdensTableCreateCompanionBuilder,
          $$OrdensTableUpdateCompanionBuilder,
          (Orden, $$OrdensTableReferences),
          Orden,
          PrefetchHooks Function({
            bool idCherryLocal,
            bool idEmpleado,
            bool pagosRefs,
            bool contienesRefs,
          })
        > {
  $$OrdensTableTableManager(_$AppDatabase db, $OrdensTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> idCherryLocal = const Value.absent(),
                Value<double?> total = const Value.absent(),
                Value<String?> fechaRealizada = const Value.absent(),
                Value<int?> idEmpleado = const Value.absent(),
              }) => OrdensCompanion(
                id: id,
                idCherryLocal: idCherryLocal,
                total: total,
                fechaRealizada: fechaRealizada,
                idEmpleado: idEmpleado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> idCherryLocal = const Value.absent(),
                Value<double?> total = const Value.absent(),
                Value<String?> fechaRealizada = const Value.absent(),
                Value<int?> idEmpleado = const Value.absent(),
              }) => OrdensCompanion.insert(
                id: id,
                idCherryLocal: idCherryLocal,
                total: total,
                fechaRealizada: fechaRealizada,
                idEmpleado: idEmpleado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$OrdensTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idCherryLocal = false,
                idEmpleado = false,
                pagosRefs = false,
                contienesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (pagosRefs) db.pagos,
                    if (contienesRefs) db.contienes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idCherryLocal) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idCherryLocal,
                                    referencedTable: $$OrdensTableReferences
                                        ._idCherryLocalTable(db),
                                    referencedColumn: $$OrdensTableReferences
                                        ._idCherryLocalTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idEmpleado) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idEmpleado,
                                    referencedTable: $$OrdensTableReferences
                                        ._idEmpleadoTable(db),
                                    referencedColumn: $$OrdensTableReferences
                                        ._idEmpleadoTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (pagosRefs)
                        await $_getPrefetchedData<Orden, $OrdensTable, Pago>(
                          currentTable: table,
                          referencedTable: $$OrdensTableReferences
                              ._pagosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdensTableReferences(db, table, p0).pagosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrden == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (contienesRefs)
                        await $_getPrefetchedData<
                          Orden,
                          $OrdensTable,
                          Contiene
                        >(
                          currentTable: table,
                          referencedTable: $$OrdensTableReferences
                              ._contienesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdensTableReferences(
                                db,
                                table,
                                p0,
                              ).contienesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrden == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrdensTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdensTable,
      Orden,
      $$OrdensTableFilterComposer,
      $$OrdensTableOrderingComposer,
      $$OrdensTableAnnotationComposer,
      $$OrdensTableCreateCompanionBuilder,
      $$OrdensTableUpdateCompanionBuilder,
      (Orden, $$OrdensTableReferences),
      Orden,
      PrefetchHooks Function({
        bool idCherryLocal,
        bool idEmpleado,
        bool pagosRefs,
        bool contienesRefs,
      })
    >;
typedef $$PagosTableCreateCompanionBuilder =
    PagosCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<int?> idMetodoPago,
      Value<int?> idOrden,
      Value<int?> idCherryLocal,
    });
typedef $$PagosTableUpdateCompanionBuilder =
    PagosCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<int?> idMetodoPago,
      Value<int?> idOrden,
      Value<int?> idCherryLocal,
    });

final class $$PagosTableReferences
    extends BaseReferences<_$AppDatabase, $PagosTable, Pago> {
  $$PagosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MetodoPagosTable _idMetodoPagoTable(_$AppDatabase db) =>
      db.metodoPagos.createAlias(
        $_aliasNameGenerator(db.pagos.idMetodoPago, db.metodoPagos.id),
      );

  $$MetodoPagosTableProcessedTableManager? get idMetodoPago {
    final $_column = $_itemColumn<int>('id_metodo_pago');
    if ($_column == null) return null;
    final manager = $$MetodoPagosTableTableManager(
      $_db,
      $_db.metodoPagos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idMetodoPagoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrdensTable _idOrdenTable(_$AppDatabase db) => db.ordens.createAlias(
    $_aliasNameGenerator(db.pagos.idOrden, db.ordens.id),
  );

  $$OrdensTableProcessedTableManager? get idOrden {
    final $_column = $_itemColumn<int>('id_orden');
    if ($_column == null) return null;
    final manager = $$OrdensTableTableManager(
      $_db,
      $_db.ordens,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrdenTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CherryLocalsTable _idCherryLocalTable(_$AppDatabase db) =>
      db.cherryLocals.createAlias(
        $_aliasNameGenerator(db.pagos.idCherryLocal, db.cherryLocals.id),
      );

  $$CherryLocalsTableProcessedTableManager? get idCherryLocal {
    final $_column = $_itemColumn<int>('id_cherry_local');
    if ($_column == null) return null;
    final manager = $$CherryLocalsTableTableManager(
      $_db,
      $_db.cherryLocals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCherryLocalTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PagosTableFilterComposer extends Composer<_$AppDatabase, $PagosTable> {
  $$PagosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  $$MetodoPagosTableFilterComposer get idMetodoPago {
    final $$MetodoPagosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMetodoPago,
      referencedTable: $db.metodoPagos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetodoPagosTableFilterComposer(
            $db: $db,
            $table: $db.metodoPagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdensTableFilterComposer get idOrden {
    final $$OrdensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableFilterComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableFilterComposer get idCherryLocal {
    final $$CherryLocalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableFilterComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PagosTableOrderingComposer
    extends Composer<_$AppDatabase, $PagosTable> {
  $$PagosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  $$MetodoPagosTableOrderingComposer get idMetodoPago {
    final $$MetodoPagosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMetodoPago,
      referencedTable: $db.metodoPagos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetodoPagosTableOrderingComposer(
            $db: $db,
            $table: $db.metodoPagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdensTableOrderingComposer get idOrden {
    final $$OrdensTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableOrderingComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableOrderingComposer get idCherryLocal {
    final $$CherryLocalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableOrderingComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PagosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PagosTable> {
  $$PagosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  $$MetodoPagosTableAnnotationComposer get idMetodoPago {
    final $$MetodoPagosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMetodoPago,
      referencedTable: $db.metodoPagos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetodoPagosTableAnnotationComposer(
            $db: $db,
            $table: $db.metodoPagos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrdensTableAnnotationComposer get idOrden {
    final $$OrdensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableAnnotationComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableAnnotationComposer get idCherryLocal {
    final $$CherryLocalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableAnnotationComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PagosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PagosTable,
          Pago,
          $$PagosTableFilterComposer,
          $$PagosTableOrderingComposer,
          $$PagosTableAnnotationComposer,
          $$PagosTableCreateCompanionBuilder,
          $$PagosTableUpdateCompanionBuilder,
          (Pago, $$PagosTableReferences),
          Pago,
          PrefetchHooks Function({
            bool idMetodoPago,
            bool idOrden,
            bool idCherryLocal,
          })
        > {
  $$PagosTableTableManager(_$AppDatabase db, $PagosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PagosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PagosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PagosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> idMetodoPago = const Value.absent(),
                Value<int?> idOrden = const Value.absent(),
                Value<int?> idCherryLocal = const Value.absent(),
              }) => PagosCompanion(
                id: id,
                descripcion: descripcion,
                idMetodoPago: idMetodoPago,
                idOrden: idOrden,
                idCherryLocal: idCherryLocal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> idMetodoPago = const Value.absent(),
                Value<int?> idOrden = const Value.absent(),
                Value<int?> idCherryLocal = const Value.absent(),
              }) => PagosCompanion.insert(
                id: id,
                descripcion: descripcion,
                idMetodoPago: idMetodoPago,
                idOrden: idOrden,
                idCherryLocal: idCherryLocal,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PagosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({idMetodoPago = false, idOrden = false, idCherryLocal = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idMetodoPago) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idMetodoPago,
                                    referencedTable: $$PagosTableReferences
                                        ._idMetodoPagoTable(db),
                                    referencedColumn: $$PagosTableReferences
                                        ._idMetodoPagoTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idOrden) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idOrden,
                                    referencedTable: $$PagosTableReferences
                                        ._idOrdenTable(db),
                                    referencedColumn: $$PagosTableReferences
                                        ._idOrdenTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idCherryLocal) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idCherryLocal,
                                    referencedTable: $$PagosTableReferences
                                        ._idCherryLocalTable(db),
                                    referencedColumn: $$PagosTableReferences
                                        ._idCherryLocalTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$PagosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PagosTable,
      Pago,
      $$PagosTableFilterComposer,
      $$PagosTableOrderingComposer,
      $$PagosTableAnnotationComposer,
      $$PagosTableCreateCompanionBuilder,
      $$PagosTableUpdateCompanionBuilder,
      (Pago, $$PagosTableReferences),
      Pago,
      PrefetchHooks Function({
        bool idMetodoPago,
        bool idOrden,
        bool idCherryLocal,
      })
    >;
typedef $$CategoriasTableCreateCompanionBuilder =
    CategoriasCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> descripcion,
    });
typedef $$CategoriasTableUpdateCompanionBuilder =
    CategoriasCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> descripcion,
    });

final class $$CategoriasTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriasTable, Categoria> {
  $$CategoriasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductosTable, List<Producto>>
  _productosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productos,
    aliasName: $_aliasNameGenerator(db.categorias.id, db.productos.idCategoria),
  );

  $$ProductosTableProcessedTableManager get productosRefs {
    final manager = $$ProductosTableTableManager(
      $_db,
      $_db.productos,
    ).filter((f) => f.idCategoria.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriasTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productosRefs(
    Expression<bool> Function($$ProductosTableFilterComposer f) f,
  ) {
    final $$ProductosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableFilterComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriasTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriasTable> {
  $$CategoriasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> productosRefs<T extends Object>(
    Expression<T> Function($$ProductosTableAnnotationComposer a) f,
  ) {
    final $$ProductosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableAnnotationComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriasTable,
          Categoria,
          $$CategoriasTableFilterComposer,
          $$CategoriasTableOrderingComposer,
          $$CategoriasTableAnnotationComposer,
          $$CategoriasTableCreateCompanionBuilder,
          $$CategoriasTableUpdateCompanionBuilder,
          (Categoria, $$CategoriasTableReferences),
          Categoria,
          PrefetchHooks Function({bool productosRefs})
        > {
  $$CategoriasTableTableManager(_$AppDatabase db, $CategoriasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => CategoriasCompanion(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => CategoriasCompanion.insert(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productosRefs) db.productos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productosRefs)
                    await $_getPrefetchedData<
                      Categoria,
                      $CategoriasTable,
                      Producto
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriasTableReferences
                          ._productosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriasTableReferences(
                            db,
                            table,
                            p0,
                          ).productosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idCategoria == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriasTable,
      Categoria,
      $$CategoriasTableFilterComposer,
      $$CategoriasTableOrderingComposer,
      $$CategoriasTableAnnotationComposer,
      $$CategoriasTableCreateCompanionBuilder,
      $$CategoriasTableUpdateCompanionBuilder,
      (Categoria, $$CategoriasTableReferences),
      Categoria,
      PrefetchHooks Function({bool productosRefs})
    >;
typedef $$ProductosTableCreateCompanionBuilder =
    ProductosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<double?> precio,
      Value<int?> idCategoria,
      Value<String?> foto,
    });
typedef $$ProductosTableUpdateCompanionBuilder =
    ProductosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<double?> precio,
      Value<int?> idCategoria,
      Value<String?> foto,
    });

final class $$ProductosTableReferences
    extends BaseReferences<_$AppDatabase, $ProductosTable, Producto> {
  $$ProductosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriasTable _idCategoriaTable(_$AppDatabase db) =>
      db.categorias.createAlias(
        $_aliasNameGenerator(db.productos.idCategoria, db.categorias.id),
      );

  $$CategoriasTableProcessedTableManager? get idCategoria {
    final $_column = $_itemColumn<int>('id_categoria');
    if ($_column == null) return null;
    final manager = $$CategoriasTableTableManager(
      $_db,
      $_db.categorias,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCategoriaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ContienesTable, List<Contiene>>
  _contienesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contienes,
    aliasName: $_aliasNameGenerator(db.productos.id, db.contienes.idProducto),
  );

  $$ContienesTableProcessedTableManager get contienesRefs {
    final manager = $$ContienesTableTableManager(
      $_db,
      $_db.contienes,
    ).filter((f) => f.idProducto.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contienesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DescuentosTable, List<Descuento>>
  _descuentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.descuentos,
    aliasName: $_aliasNameGenerator(db.productos.id, db.descuentos.idProducto),
  );

  $$DescuentosTableProcessedTableManager get descuentosRefs {
    final manager = $$DescuentosTableTableManager(
      $_db,
      $_db.descuentos,
    ).filter((f) => f.idProducto.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_descuentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$IngredientsTable, List<Ingredient>>
  _ingredientsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ingredients,
    aliasName: $_aliasNameGenerator(db.productos.id, db.ingredients.idProducto),
  );

  $$IngredientsTableProcessedTableManager get ingredientsRefs {
    final manager = $$IngredientsTableTableManager(
      $_db,
      $_db.ingredients,
    ).filter((f) => f.idProducto.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ingredientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductosTableFilterComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriasTableFilterComposer get idCategoria {
    final $$CategoriasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableFilterComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> contienesRefs(
    Expression<bool> Function($$ContienesTableFilterComposer f) f,
  ) {
    final $$ContienesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableFilterComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> descuentosRefs(
    Expression<bool> Function($$DescuentosTableFilterComposer f) f,
  ) {
    final $$DescuentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.descuentos,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DescuentosTableFilterComposer(
            $db: $db,
            $table: $db.descuentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ingredientsRefs(
    Expression<bool> Function($$IngredientsTableFilterComposer f) f,
  ) {
    final $$IngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableFilterComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriasTableOrderingComposer get idCategoria {
    final $$CategoriasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableOrderingComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get precio =>
      $composableBuilder(column: $table.precio, builder: (column) => column);

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);

  $$CategoriasTableAnnotationComposer get idCategoria {
    final $$CategoriasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categorias,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriasTableAnnotationComposer(
            $db: $db,
            $table: $db.categorias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> contienesRefs<T extends Object>(
    Expression<T> Function($$ContienesTableAnnotationComposer a) f,
  ) {
    final $$ContienesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contienes,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContienesTableAnnotationComposer(
            $db: $db,
            $table: $db.contienes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> descuentosRefs<T extends Object>(
    Expression<T> Function($$DescuentosTableAnnotationComposer a) f,
  ) {
    final $$DescuentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.descuentos,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DescuentosTableAnnotationComposer(
            $db: $db,
            $table: $db.descuentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ingredientsRefs<T extends Object>(
    Expression<T> Function($$IngredientsTableAnnotationComposer a) f,
  ) {
    final $$IngredientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.idProducto,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductosTable,
          Producto,
          $$ProductosTableFilterComposer,
          $$ProductosTableOrderingComposer,
          $$ProductosTableAnnotationComposer,
          $$ProductosTableCreateCompanionBuilder,
          $$ProductosTableUpdateCompanionBuilder,
          (Producto, $$ProductosTableReferences),
          Producto,
          PrefetchHooks Function({
            bool idCategoria,
            bool contienesRefs,
            bool descuentosRefs,
            bool ingredientsRefs,
          })
        > {
  $$ProductosTableTableManager(_$AppDatabase db, $ProductosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<double?> precio = const Value.absent(),
                Value<int?> idCategoria = const Value.absent(),
                Value<String?> foto = const Value.absent(),
              }) => ProductosCompanion(
                id: id,
                nombre: nombre,
                precio: precio,
                idCategoria: idCategoria,
                foto: foto,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<double?> precio = const Value.absent(),
                Value<int?> idCategoria = const Value.absent(),
                Value<String?> foto = const Value.absent(),
              }) => ProductosCompanion.insert(
                id: id,
                nombre: nombre,
                precio: precio,
                idCategoria: idCategoria,
                foto: foto,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idCategoria = false,
                contienesRefs = false,
                descuentosRefs = false,
                ingredientsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (contienesRefs) db.contienes,
                    if (descuentosRefs) db.descuentos,
                    if (ingredientsRefs) db.ingredients,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idCategoria) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idCategoria,
                                    referencedTable: $$ProductosTableReferences
                                        ._idCategoriaTable(db),
                                    referencedColumn: $$ProductosTableReferences
                                        ._idCategoriaTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (contienesRefs)
                        await $_getPrefetchedData<
                          Producto,
                          $ProductosTable,
                          Contiene
                        >(
                          currentTable: table,
                          referencedTable: $$ProductosTableReferences
                              ._contienesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductosTableReferences(
                                db,
                                table,
                                p0,
                              ).contienesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idProducto == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (descuentosRefs)
                        await $_getPrefetchedData<
                          Producto,
                          $ProductosTable,
                          Descuento
                        >(
                          currentTable: table,
                          referencedTable: $$ProductosTableReferences
                              ._descuentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductosTableReferences(
                                db,
                                table,
                                p0,
                              ).descuentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idProducto == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ingredientsRefs)
                        await $_getPrefetchedData<
                          Producto,
                          $ProductosTable,
                          Ingredient
                        >(
                          currentTable: table,
                          referencedTable: $$ProductosTableReferences
                              ._ingredientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductosTableReferences(
                                db,
                                table,
                                p0,
                              ).ingredientsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idProducto == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductosTable,
      Producto,
      $$ProductosTableFilterComposer,
      $$ProductosTableOrderingComposer,
      $$ProductosTableAnnotationComposer,
      $$ProductosTableCreateCompanionBuilder,
      $$ProductosTableUpdateCompanionBuilder,
      (Producto, $$ProductosTableReferences),
      Producto,
      PrefetchHooks Function({
        bool idCategoria,
        bool contienesRefs,
        bool descuentosRefs,
        bool ingredientsRefs,
      })
    >;
typedef $$ContienesTableCreateCompanionBuilder =
    ContienesCompanion Function({
      required int idOrden,
      required int idCherryLocal,
      required int idProducto,
      Value<int> rowid,
    });
typedef $$ContienesTableUpdateCompanionBuilder =
    ContienesCompanion Function({
      Value<int> idOrden,
      Value<int> idCherryLocal,
      Value<int> idProducto,
      Value<int> rowid,
    });

final class $$ContienesTableReferences
    extends BaseReferences<_$AppDatabase, $ContienesTable, Contiene> {
  $$ContienesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OrdensTable _idOrdenTable(_$AppDatabase db) => db.ordens.createAlias(
    $_aliasNameGenerator(db.contienes.idOrden, db.ordens.id),
  );

  $$OrdensTableProcessedTableManager get idOrden {
    final $_column = $_itemColumn<int>('id_orden')!;

    final manager = $$OrdensTableTableManager(
      $_db,
      $_db.ordens,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrdenTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CherryLocalsTable _idCherryLocalTable(_$AppDatabase db) =>
      db.cherryLocals.createAlias(
        $_aliasNameGenerator(db.contienes.idCherryLocal, db.cherryLocals.id),
      );

  $$CherryLocalsTableProcessedTableManager get idCherryLocal {
    final $_column = $_itemColumn<int>('id_cherry_local')!;

    final manager = $$CherryLocalsTableTableManager(
      $_db,
      $_db.cherryLocals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCherryLocalTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductosTable _idProductoTable(_$AppDatabase db) =>
      db.productos.createAlias(
        $_aliasNameGenerator(db.contienes.idProducto, db.productos.id),
      );

  $$ProductosTableProcessedTableManager get idProducto {
    final $_column = $_itemColumn<int>('id_producto')!;

    final manager = $$ProductosTableTableManager(
      $_db,
      $_db.productos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idProductoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContienesTableFilterComposer
    extends Composer<_$AppDatabase, $ContienesTable> {
  $$ContienesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OrdensTableFilterComposer get idOrden {
    final $$OrdensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableFilterComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableFilterComposer get idCherryLocal {
    final $$CherryLocalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableFilterComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableFilterComposer get idProducto {
    final $$ProductosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableFilterComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContienesTableOrderingComposer
    extends Composer<_$AppDatabase, $ContienesTable> {
  $$ContienesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OrdensTableOrderingComposer get idOrden {
    final $$OrdensTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableOrderingComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableOrderingComposer get idCherryLocal {
    final $$CherryLocalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableOrderingComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableOrderingComposer get idProducto {
    final $$ProductosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableOrderingComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContienesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContienesTable> {
  $$ContienesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$OrdensTableAnnotationComposer get idOrden {
    final $$OrdensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrden,
      referencedTable: $db.ordens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdensTableAnnotationComposer(
            $db: $db,
            $table: $db.ordens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CherryLocalsTableAnnotationComposer get idCherryLocal {
    final $$CherryLocalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCherryLocal,
      referencedTable: $db.cherryLocals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CherryLocalsTableAnnotationComposer(
            $db: $db,
            $table: $db.cherryLocals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductosTableAnnotationComposer get idProducto {
    final $$ProductosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableAnnotationComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContienesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContienesTable,
          Contiene,
          $$ContienesTableFilterComposer,
          $$ContienesTableOrderingComposer,
          $$ContienesTableAnnotationComposer,
          $$ContienesTableCreateCompanionBuilder,
          $$ContienesTableUpdateCompanionBuilder,
          (Contiene, $$ContienesTableReferences),
          Contiene,
          PrefetchHooks Function({
            bool idOrden,
            bool idCherryLocal,
            bool idProducto,
          })
        > {
  $$ContienesTableTableManager(_$AppDatabase db, $ContienesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContienesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContienesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContienesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOrden = const Value.absent(),
                Value<int> idCherryLocal = const Value.absent(),
                Value<int> idProducto = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContienesCompanion(
                idOrden: idOrden,
                idCherryLocal: idCherryLocal,
                idProducto: idProducto,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idOrden,
                required int idCherryLocal,
                required int idProducto,
                Value<int> rowid = const Value.absent(),
              }) => ContienesCompanion.insert(
                idOrden: idOrden,
                idCherryLocal: idCherryLocal,
                idProducto: idProducto,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContienesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idOrden = false, idCherryLocal = false, idProducto = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idOrden) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idOrden,
                                    referencedTable: $$ContienesTableReferences
                                        ._idOrdenTable(db),
                                    referencedColumn: $$ContienesTableReferences
                                        ._idOrdenTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idCherryLocal) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idCherryLocal,
                                    referencedTable: $$ContienesTableReferences
                                        ._idCherryLocalTable(db),
                                    referencedColumn: $$ContienesTableReferences
                                        ._idCherryLocalTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (idProducto) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idProducto,
                                    referencedTable: $$ContienesTableReferences
                                        ._idProductoTable(db),
                                    referencedColumn: $$ContienesTableReferences
                                        ._idProductoTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ContienesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContienesTable,
      Contiene,
      $$ContienesTableFilterComposer,
      $$ContienesTableOrderingComposer,
      $$ContienesTableAnnotationComposer,
      $$ContienesTableCreateCompanionBuilder,
      $$ContienesTableUpdateCompanionBuilder,
      (Contiene, $$ContienesTableReferences),
      Contiene,
      PrefetchHooks Function({
        bool idOrden,
        bool idCherryLocal,
        bool idProducto,
      })
    >;
typedef $$DescuentosTableCreateCompanionBuilder =
    DescuentosCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<int?> porcentaje,
      Value<int?> idProducto,
    });
typedef $$DescuentosTableUpdateCompanionBuilder =
    DescuentosCompanion Function({
      Value<int> id,
      Value<String?> descripcion,
      Value<int?> porcentaje,
      Value<int?> idProducto,
    });

final class $$DescuentosTableReferences
    extends BaseReferences<_$AppDatabase, $DescuentosTable, Descuento> {
  $$DescuentosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductosTable _idProductoTable(_$AppDatabase db) =>
      db.productos.createAlias(
        $_aliasNameGenerator(db.descuentos.idProducto, db.productos.id),
      );

  $$ProductosTableProcessedTableManager? get idProducto {
    final $_column = $_itemColumn<int>('id_producto');
    if ($_column == null) return null;
    final manager = $$ProductosTableTableManager(
      $_db,
      $_db.productos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idProductoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DescuentosTableFilterComposer
    extends Composer<_$AppDatabase, $DescuentosTable> {
  $$DescuentosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get porcentaje => $composableBuilder(
    column: $table.porcentaje,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductosTableFilterComposer get idProducto {
    final $$ProductosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableFilterComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DescuentosTableOrderingComposer
    extends Composer<_$AppDatabase, $DescuentosTable> {
  $$DescuentosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get porcentaje => $composableBuilder(
    column: $table.porcentaje,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductosTableOrderingComposer get idProducto {
    final $$ProductosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableOrderingComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DescuentosTableAnnotationComposer
    extends Composer<_$AppDatabase, $DescuentosTable> {
  $$DescuentosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get porcentaje => $composableBuilder(
    column: $table.porcentaje,
    builder: (column) => column,
  );

  $$ProductosTableAnnotationComposer get idProducto {
    final $$ProductosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableAnnotationComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DescuentosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DescuentosTable,
          Descuento,
          $$DescuentosTableFilterComposer,
          $$DescuentosTableOrderingComposer,
          $$DescuentosTableAnnotationComposer,
          $$DescuentosTableCreateCompanionBuilder,
          $$DescuentosTableUpdateCompanionBuilder,
          (Descuento, $$DescuentosTableReferences),
          Descuento,
          PrefetchHooks Function({bool idProducto})
        > {
  $$DescuentosTableTableManager(_$AppDatabase db, $DescuentosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DescuentosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DescuentosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DescuentosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> porcentaje = const Value.absent(),
                Value<int?> idProducto = const Value.absent(),
              }) => DescuentosCompanion(
                id: id,
                descripcion: descripcion,
                porcentaje: porcentaje,
                idProducto: idProducto,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> porcentaje = const Value.absent(),
                Value<int?> idProducto = const Value.absent(),
              }) => DescuentosCompanion.insert(
                id: id,
                descripcion: descripcion,
                porcentaje: porcentaje,
                idProducto: idProducto,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DescuentosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idProducto = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idProducto) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idProducto,
                                referencedTable: $$DescuentosTableReferences
                                    ._idProductoTable(db),
                                referencedColumn: $$DescuentosTableReferences
                                    ._idProductoTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DescuentosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DescuentosTable,
      Descuento,
      $$DescuentosTableFilterComposer,
      $$DescuentosTableOrderingComposer,
      $$DescuentosTableAnnotationComposer,
      $$DescuentosTableCreateCompanionBuilder,
      $$DescuentosTableUpdateCompanionBuilder,
      (Descuento, $$DescuentosTableReferences),
      Descuento,
      PrefetchHooks Function({bool idProducto})
    >;
typedef $$MedidasTableCreateCompanionBuilder =
    MedidasCompanion Function({Value<int> id, Value<String?> descripcion});
typedef $$MedidasTableUpdateCompanionBuilder =
    MedidasCompanion Function({Value<int> id, Value<String?> descripcion});

final class $$MedidasTableReferences
    extends BaseReferences<_$AppDatabase, $MedidasTable, Medida> {
  $$MedidasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InsumosTable, List<Insumo>> _insumosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.insumos,
    aliasName: $_aliasNameGenerator(db.medidas.id, db.insumos.idMedida),
  );

  $$InsumosTableProcessedTableManager get insumosRefs {
    final manager = $$InsumosTableTableManager(
      $_db,
      $_db.insumos,
    ).filter((f) => f.idMedida.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_insumosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedidasTableFilterComposer
    extends Composer<_$AppDatabase, $MedidasTable> {
  $$MedidasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> insumosRefs(
    Expression<bool> Function($$InsumosTableFilterComposer f) f,
  ) {
    final $$InsumosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insumos,
      getReferencedColumn: (t) => t.idMedida,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsumosTableFilterComposer(
            $db: $db,
            $table: $db.insumos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedidasTableOrderingComposer
    extends Composer<_$AppDatabase, $MedidasTable> {
  $$MedidasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedidasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedidasTable> {
  $$MedidasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> insumosRefs<T extends Object>(
    Expression<T> Function($$InsumosTableAnnotationComposer a) f,
  ) {
    final $$InsumosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insumos,
      getReferencedColumn: (t) => t.idMedida,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsumosTableAnnotationComposer(
            $db: $db,
            $table: $db.insumos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedidasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedidasTable,
          Medida,
          $$MedidasTableFilterComposer,
          $$MedidasTableOrderingComposer,
          $$MedidasTableAnnotationComposer,
          $$MedidasTableCreateCompanionBuilder,
          $$MedidasTableUpdateCompanionBuilder,
          (Medida, $$MedidasTableReferences),
          Medida,
          PrefetchHooks Function({bool insumosRefs})
        > {
  $$MedidasTableTableManager(_$AppDatabase db, $MedidasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedidasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedidasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedidasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => MedidasCompanion(id: id, descripcion: descripcion),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => MedidasCompanion.insert(id: id, descripcion: descripcion),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedidasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({insumosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (insumosRefs) db.insumos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (insumosRefs)
                    await $_getPrefetchedData<Medida, $MedidasTable, Insumo>(
                      currentTable: table,
                      referencedTable: $$MedidasTableReferences
                          ._insumosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MedidasTableReferences(db, table, p0).insumosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idMedida == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MedidasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedidasTable,
      Medida,
      $$MedidasTableFilterComposer,
      $$MedidasTableOrderingComposer,
      $$MedidasTableAnnotationComposer,
      $$MedidasTableCreateCompanionBuilder,
      $$MedidasTableUpdateCompanionBuilder,
      (Medida, $$MedidasTableReferences),
      Medida,
      PrefetchHooks Function({bool insumosRefs})
    >;
typedef $$ProveedorsTableCreateCompanionBuilder =
    ProveedorsCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> direccion,
      Value<String?> descripcion,
    });
typedef $$ProveedorsTableUpdateCompanionBuilder =
    ProveedorsCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<String?> direccion,
      Value<String?> descripcion,
    });

final class $$ProveedorsTableReferences
    extends BaseReferences<_$AppDatabase, $ProveedorsTable, Proveedor> {
  $$ProveedorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ContactosTable, List<Contacto>>
  _contactosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contactos,
    aliasName: $_aliasNameGenerator(db.proveedors.id, db.contactos.idProveedor),
  );

  $$ContactosTableProcessedTableManager get contactosRefs {
    final manager = $$ContactosTableTableManager(
      $_db,
      $_db.contactos,
    ).filter((f) => f.idProveedor.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contactosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProveedorsTableFilterComposer
    extends Composer<_$AppDatabase, $ProveedorsTable> {
  $$ProveedorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> contactosRefs(
    Expression<bool> Function($$ContactosTableFilterComposer f) f,
  ) {
    final $$ContactosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contactos,
      getReferencedColumn: (t) => t.idProveedor,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactosTableFilterComposer(
            $db: $db,
            $table: $db.contactos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProveedorsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProveedorsTable> {
  $$ProveedorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProveedorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProveedorsTable> {
  $$ProveedorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> contactosRefs<T extends Object>(
    Expression<T> Function($$ContactosTableAnnotationComposer a) f,
  ) {
    final $$ContactosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contactos,
      getReferencedColumn: (t) => t.idProveedor,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactosTableAnnotationComposer(
            $db: $db,
            $table: $db.contactos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProveedorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProveedorsTable,
          Proveedor,
          $$ProveedorsTableFilterComposer,
          $$ProveedorsTableOrderingComposer,
          $$ProveedorsTableAnnotationComposer,
          $$ProveedorsTableCreateCompanionBuilder,
          $$ProveedorsTableUpdateCompanionBuilder,
          (Proveedor, $$ProveedorsTableReferences),
          Proveedor,
          PrefetchHooks Function({bool contactosRefs})
        > {
  $$ProveedorsTableTableManager(_$AppDatabase db, $ProveedorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProveedorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProveedorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProveedorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => ProveedorsCompanion(
                id: id,
                nombre: nombre,
                direccion: direccion,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
              }) => ProveedorsCompanion.insert(
                id: id,
                nombre: nombre,
                direccion: direccion,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProveedorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contactosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (contactosRefs) db.contactos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contactosRefs)
                    await $_getPrefetchedData<
                      Proveedor,
                      $ProveedorsTable,
                      Contacto
                    >(
                      currentTable: table,
                      referencedTable: $$ProveedorsTableReferences
                          ._contactosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProveedorsTableReferences(
                            db,
                            table,
                            p0,
                          ).contactosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idProveedor == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProveedorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProveedorsTable,
      Proveedor,
      $$ProveedorsTableFilterComposer,
      $$ProveedorsTableOrderingComposer,
      $$ProveedorsTableAnnotationComposer,
      $$ProveedorsTableCreateCompanionBuilder,
      $$ProveedorsTableUpdateCompanionBuilder,
      (Proveedor, $$ProveedorsTableReferences),
      Proveedor,
      PrefetchHooks Function({bool contactosRefs})
    >;
typedef $$InsumosTableCreateCompanionBuilder =
    InsumosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<double?> costo,
      Value<String?> descripcion,
      Value<int?> idMedida,
      Value<int?> enAlmacen,
    });
typedef $$InsumosTableUpdateCompanionBuilder =
    InsumosCompanion Function({
      Value<int> id,
      Value<String?> nombre,
      Value<double?> costo,
      Value<String?> descripcion,
      Value<int?> idMedida,
      Value<int?> enAlmacen,
    });

final class $$InsumosTableReferences
    extends BaseReferences<_$AppDatabase, $InsumosTable, Insumo> {
  $$InsumosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedidasTable _idMedidaTable(_$AppDatabase db) => db.medidas
      .createAlias($_aliasNameGenerator(db.insumos.idMedida, db.medidas.id));

  $$MedidasTableProcessedTableManager? get idMedida {
    final $_column = $_itemColumn<int>('id_medida');
    if ($_column == null) return null;
    final manager = $$MedidasTableTableManager(
      $_db,
      $_db.medidas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idMedidaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IngredientsTable, List<Ingredient>>
  _ingredientsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ingredients,
    aliasName: $_aliasNameGenerator(db.insumos.id, db.ingredients.idInsumo),
  );

  $$IngredientsTableProcessedTableManager get ingredientsRefs {
    final manager = $$IngredientsTableTableManager(
      $_db,
      $_db.ingredients,
    ).filter((f) => f.idInsumo.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ingredientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InsumosTableFilterComposer
    extends Composer<_$AppDatabase, $InsumosTable> {
  $$InsumosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enAlmacen => $composableBuilder(
    column: $table.enAlmacen,
    builder: (column) => ColumnFilters(column),
  );

  $$MedidasTableFilterComposer get idMedida {
    final $$MedidasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMedida,
      referencedTable: $db.medidas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedidasTableFilterComposer(
            $db: $db,
            $table: $db.medidas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ingredientsRefs(
    Expression<bool> Function($$IngredientsTableFilterComposer f) f,
  ) {
    final $$IngredientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.idInsumo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableFilterComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsumosTableOrderingComposer
    extends Composer<_$AppDatabase, $InsumosTable> {
  $$InsumosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enAlmacen => $composableBuilder(
    column: $table.enAlmacen,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedidasTableOrderingComposer get idMedida {
    final $$MedidasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMedida,
      referencedTable: $db.medidas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedidasTableOrderingComposer(
            $db: $db,
            $table: $db.medidas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InsumosTableAnnotationComposer
    extends Composer<_$AppDatabase, $InsumosTable> {
  $$InsumosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get costo =>
      $composableBuilder(column: $table.costo, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enAlmacen =>
      $composableBuilder(column: $table.enAlmacen, builder: (column) => column);

  $$MedidasTableAnnotationComposer get idMedida {
    final $$MedidasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMedida,
      referencedTable: $db.medidas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedidasTableAnnotationComposer(
            $db: $db,
            $table: $db.medidas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ingredientsRefs<T extends Object>(
    Expression<T> Function($$IngredientsTableAnnotationComposer a) f,
  ) {
    final $$IngredientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredients,
      getReferencedColumn: (t) => t.idInsumo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientsTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsumosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InsumosTable,
          Insumo,
          $$InsumosTableFilterComposer,
          $$InsumosTableOrderingComposer,
          $$InsumosTableAnnotationComposer,
          $$InsumosTableCreateCompanionBuilder,
          $$InsumosTableUpdateCompanionBuilder,
          (Insumo, $$InsumosTableReferences),
          Insumo,
          PrefetchHooks Function({bool idMedida, bool ingredientsRefs})
        > {
  $$InsumosTableTableManager(_$AppDatabase db, $InsumosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InsumosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InsumosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InsumosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<double?> costo = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> idMedida = const Value.absent(),
                Value<int?> enAlmacen = const Value.absent(),
              }) => InsumosCompanion(
                id: id,
                nombre: nombre,
                costo: costo,
                descripcion: descripcion,
                idMedida: idMedida,
                enAlmacen: enAlmacen,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<double?> costo = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<int?> idMedida = const Value.absent(),
                Value<int?> enAlmacen = const Value.absent(),
              }) => InsumosCompanion.insert(
                id: id,
                nombre: nombre,
                costo: costo,
                descripcion: descripcion,
                idMedida: idMedida,
                enAlmacen: enAlmacen,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InsumosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idMedida = false, ingredientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ingredientsRefs) db.ingredients],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idMedida) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idMedida,
                                referencedTable: $$InsumosTableReferences
                                    ._idMedidaTable(db),
                                referencedColumn: $$InsumosTableReferences
                                    ._idMedidaTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ingredientsRefs)
                    await $_getPrefetchedData<
                      Insumo,
                      $InsumosTable,
                      Ingredient
                    >(
                      currentTable: table,
                      referencedTable: $$InsumosTableReferences
                          ._ingredientsRefsTable(db),
                      managerFromTypedResult: (p0) => $$InsumosTableReferences(
                        db,
                        table,
                        p0,
                      ).ingredientsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.idInsumo == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InsumosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InsumosTable,
      Insumo,
      $$InsumosTableFilterComposer,
      $$InsumosTableOrderingComposer,
      $$InsumosTableAnnotationComposer,
      $$InsumosTableCreateCompanionBuilder,
      $$InsumosTableUpdateCompanionBuilder,
      (Insumo, $$InsumosTableReferences),
      Insumo,
      PrefetchHooks Function({bool idMedida, bool ingredientsRefs})
    >;
typedef $$IngredientsTableCreateCompanionBuilder =
    IngredientsCompanion Function({
      required int idProducto,
      required int idInsumo,
      Value<int?> cantidad,
      Value<int> rowid,
    });
typedef $$IngredientsTableUpdateCompanionBuilder =
    IngredientsCompanion Function({
      Value<int> idProducto,
      Value<int> idInsumo,
      Value<int?> cantidad,
      Value<int> rowid,
    });

final class $$IngredientsTableReferences
    extends BaseReferences<_$AppDatabase, $IngredientsTable, Ingredient> {
  $$IngredientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductosTable _idProductoTable(_$AppDatabase db) =>
      db.productos.createAlias(
        $_aliasNameGenerator(db.ingredients.idProducto, db.productos.id),
      );

  $$ProductosTableProcessedTableManager get idProducto {
    final $_column = $_itemColumn<int>('id_producto')!;

    final manager = $$ProductosTableTableManager(
      $_db,
      $_db.productos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idProductoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InsumosTable _idInsumoTable(_$AppDatabase db) =>
      db.insumos.createAlias(
        $_aliasNameGenerator(db.ingredients.idInsumo, db.insumos.id),
      );

  $$InsumosTableProcessedTableManager get idInsumo {
    final $_column = $_itemColumn<int>('id_insumo')!;

    final manager = $$InsumosTableTableManager(
      $_db,
      $_db.insumos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idInsumoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IngredientsTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductosTableFilterComposer get idProducto {
    final $$ProductosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableFilterComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsumosTableFilterComposer get idInsumo {
    final $$InsumosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idInsumo,
      referencedTable: $db.insumos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsumosTableFilterComposer(
            $db: $db,
            $table: $db.insumos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientsTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductosTableOrderingComposer get idProducto {
    final $$ProductosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableOrderingComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsumosTableOrderingComposer get idInsumo {
    final $$InsumosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idInsumo,
      referencedTable: $db.insumos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsumosTableOrderingComposer(
            $db: $db,
            $table: $db.insumos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientsTable> {
  $$IngredientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  $$ProductosTableAnnotationComposer get idProducto {
    final $$ProductosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProducto,
      referencedTable: $db.productos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductosTableAnnotationComposer(
            $db: $db,
            $table: $db.productos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsumosTableAnnotationComposer get idInsumo {
    final $$InsumosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idInsumo,
      referencedTable: $db.insumos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsumosTableAnnotationComposer(
            $db: $db,
            $table: $db.insumos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientsTable,
          Ingredient,
          $$IngredientsTableFilterComposer,
          $$IngredientsTableOrderingComposer,
          $$IngredientsTableAnnotationComposer,
          $$IngredientsTableCreateCompanionBuilder,
          $$IngredientsTableUpdateCompanionBuilder,
          (Ingredient, $$IngredientsTableReferences),
          Ingredient,
          PrefetchHooks Function({bool idProducto, bool idInsumo})
        > {
  $$IngredientsTableTableManager(_$AppDatabase db, $IngredientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idProducto = const Value.absent(),
                Value<int> idInsumo = const Value.absent(),
                Value<int?> cantidad = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientsCompanion(
                idProducto: idProducto,
                idInsumo: idInsumo,
                cantidad: cantidad,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idProducto,
                required int idInsumo,
                Value<int?> cantidad = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientsCompanion.insert(
                idProducto: idProducto,
                idInsumo: idInsumo,
                cantidad: cantidad,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idProducto = false, idInsumo = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idProducto) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idProducto,
                                referencedTable: $$IngredientsTableReferences
                                    ._idProductoTable(db),
                                referencedColumn: $$IngredientsTableReferences
                                    ._idProductoTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (idInsumo) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idInsumo,
                                referencedTable: $$IngredientsTableReferences
                                    ._idInsumoTable(db),
                                referencedColumn: $$IngredientsTableReferences
                                    ._idInsumoTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IngredientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientsTable,
      Ingredient,
      $$IngredientsTableFilterComposer,
      $$IngredientsTableOrderingComposer,
      $$IngredientsTableAnnotationComposer,
      $$IngredientsTableCreateCompanionBuilder,
      $$IngredientsTableUpdateCompanionBuilder,
      (Ingredient, $$IngredientsTableReferences),
      Ingredient,
      PrefetchHooks Function({bool idProducto, bool idInsumo})
    >;
typedef $$ContactosTableCreateCompanionBuilder =
    ContactosCompanion Function({
      required int idProveedor,
      required int numero,
      Value<String?> nombre,
      Value<String?> telefono,
      Value<int> rowid,
    });
typedef $$ContactosTableUpdateCompanionBuilder =
    ContactosCompanion Function({
      Value<int> idProveedor,
      Value<int> numero,
      Value<String?> nombre,
      Value<String?> telefono,
      Value<int> rowid,
    });

final class $$ContactosTableReferences
    extends BaseReferences<_$AppDatabase, $ContactosTable, Contacto> {
  $$ContactosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProveedorsTable _idProveedorTable(_$AppDatabase db) =>
      db.proveedors.createAlias(
        $_aliasNameGenerator(db.contactos.idProveedor, db.proveedors.id),
      );

  $$ProveedorsTableProcessedTableManager get idProveedor {
    final $_column = $_itemColumn<int>('id_proveedor')!;

    final manager = $$ProveedorsTableTableManager(
      $_db,
      $_db.proveedors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idProveedorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContactosTableFilterComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  $$ProveedorsTableFilterComposer get idProveedor {
    final $$ProveedorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProveedor,
      referencedTable: $db.proveedors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProveedorsTableFilterComposer(
            $db: $db,
            $table: $db.proveedors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactosTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProveedorsTableOrderingComposer get idProveedor {
    final $$ProveedorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProveedor,
      referencedTable: $db.proveedors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProveedorsTableOrderingComposer(
            $db: $db,
            $table: $db.proveedors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactosTable> {
  $$ContactosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  $$ProveedorsTableAnnotationComposer get idProveedor {
    final $$ProveedorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idProveedor,
      referencedTable: $db.proveedors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProveedorsTableAnnotationComposer(
            $db: $db,
            $table: $db.proveedors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContactosTable,
          Contacto,
          $$ContactosTableFilterComposer,
          $$ContactosTableOrderingComposer,
          $$ContactosTableAnnotationComposer,
          $$ContactosTableCreateCompanionBuilder,
          $$ContactosTableUpdateCompanionBuilder,
          (Contacto, $$ContactosTableReferences),
          Contacto,
          PrefetchHooks Function({bool idProveedor})
        > {
  $$ContactosTableTableManager(_$AppDatabase db, $ContactosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idProveedor = const Value.absent(),
                Value<int> numero = const Value.absent(),
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContactosCompanion(
                idProveedor: idProveedor,
                numero: numero,
                nombre: nombre,
                telefono: telefono,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idProveedor,
                required int numero,
                Value<String?> nombre = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContactosCompanion.insert(
                idProveedor: idProveedor,
                numero: numero,
                nombre: nombre,
                telefono: telefono,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContactosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idProveedor = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idProveedor) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idProveedor,
                                referencedTable: $$ContactosTableReferences
                                    ._idProveedorTable(db),
                                referencedColumn: $$ContactosTableReferences
                                    ._idProveedorTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ContactosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContactosTable,
      Contacto,
      $$ContactosTableFilterComposer,
      $$ContactosTableOrderingComposer,
      $$ContactosTableAnnotationComposer,
      $$ContactosTableCreateCompanionBuilder,
      $$ContactosTableUpdateCompanionBuilder,
      (Contacto, $$ContactosTableReferences),
      Contacto,
      PrefetchHooks Function({bool idProveedor})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TablaErrorsTableTableManager get tablaErrors =>
      $$TablaErrorsTableTableManager(_db, _db.tablaErrors);
  $$MetodoPagosTableTableManager get metodoPagos =>
      $$MetodoPagosTableTableManager(_db, _db.metodoPagos);
  $$CherryLocalsTableTableManager get cherryLocals =>
      $$CherryLocalsTableTableManager(_db, _db.cherryLocals);
  $$RolsTableTableManager get rols => $$RolsTableTableManager(_db, _db.rols);
  $$TurnosTableTableManager get turnos =>
      $$TurnosTableTableManager(_db, _db.turnos);
  $$BonusesTableTableManager get bonuses =>
      $$BonusesTableTableManager(_db, _db.bonuses);
  $$EmpleadosTableTableManager get empleados =>
      $$EmpleadosTableTableManager(_db, _db.empleados);
  $$NominasTableTableManager get nominas =>
      $$NominasTableTableManager(_db, _db.nominas);
  $$BeneficiosTableTableManager get beneficios =>
      $$BeneficiosTableTableManager(_db, _db.beneficios);
  $$CuentasTableTableManager get cuentas =>
      $$CuentasTableTableManager(_db, _db.cuentas);
  $$OrdensTableTableManager get ordens =>
      $$OrdensTableTableManager(_db, _db.ordens);
  $$PagosTableTableManager get pagos =>
      $$PagosTableTableManager(_db, _db.pagos);
  $$CategoriasTableTableManager get categorias =>
      $$CategoriasTableTableManager(_db, _db.categorias);
  $$ProductosTableTableManager get productos =>
      $$ProductosTableTableManager(_db, _db.productos);
  $$ContienesTableTableManager get contienes =>
      $$ContienesTableTableManager(_db, _db.contienes);
  $$DescuentosTableTableManager get descuentos =>
      $$DescuentosTableTableManager(_db, _db.descuentos);
  $$MedidasTableTableManager get medidas =>
      $$MedidasTableTableManager(_db, _db.medidas);
  $$ProveedorsTableTableManager get proveedors =>
      $$ProveedorsTableTableManager(_db, _db.proveedors);
  $$InsumosTableTableManager get insumos =>
      $$InsumosTableTableManager(_db, _db.insumos);
  $$IngredientsTableTableManager get ingredients =>
      $$IngredientsTableTableManager(_db, _db.ingredients);
  $$ContactosTableTableManager get contactos =>
      $$ContactosTableTableManager(_db, _db.contactos);
}
