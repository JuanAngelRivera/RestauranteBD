import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/views/admin_view.dart';
import 'package:restaurante_base_de_datos/views/login_view.dart';
import 'package:restaurante_base_de_datos/views/order_view.dart';

void main() => runApp(const MyApp());

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