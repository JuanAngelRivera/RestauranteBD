import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/views/admin_view.dart';
import 'package:restaurante_base_de_datos/views/login_view.dart';
import 'package:restaurante_base_de_datos/views/order_view.dart';

late AppDatabase database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = AppDatabase();
  print("base de datos construida");
  await database.customStatement('PRAGMA user_version;');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Cherry Café',
      home: loginView(),
      routes: {
        "/admin" : (context) => adminView(),
        "/order" : (context) => orderView()
      },
    );
  }
}