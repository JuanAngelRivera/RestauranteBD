import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/data/app_database.dart';
import 'package:restaurante_base_de_datos/views/admin_view.dart';
import 'package:restaurante_base_de_datos/views/login_view.dart';
import 'package:restaurante_base_de_datos/views/order_view.dart';

late AppDatabase database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Cherry Café',
      home: LoginView(),
      routes: {
        "/admin" : (context) => adminView(),
        "/order" : (context) => orderView()
      },
    );
  }
}