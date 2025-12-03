import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/providers/dao_providers.dart';
import 'package:restaurante_base_de_datos/views/admin_view.dart';
import 'package:restaurante_base_de_datos/views/historial_view.dart';
import 'package:restaurante_base_de_datos/views/login_view.dart';
import 'package:restaurante_base_de_datos/views/order_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  /*
  final result = await database
      .customSelect(
        "PRAGMA table_info('Empleado');", // usa el nombre real de la tabla en la DB
      )
      .get();

  for (final row in result) {
    print(
      'Columna: ${row.read<String>('name')} - Tipo: ${row.read<String>('type')}',
    );
  } */

  runApp(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cherry Café',
      home: LoginView(),
      routes: {
        "/admin": (context) => adminView(),
        "/order": (context) => orderView(),
        "/historial": (context) => HistorialView(),
      },
    );
  }
}