import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class IdleScreenWidget extends StatefulWidget {
  const IdleScreenWidget({super.key});

  @override
  State<IdleScreenWidget> createState() => _IdleScreenWidgetState();
}

class _IdleScreenWidgetState extends State<IdleScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: Text(
            "Bienvenido\nAdministrador",
            style: Styles.titleText.copyWith(fontSize: 72),
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: AlignmentGeometry.bottomRight,
          child: Image.asset(
            "sources/images/loginImage.png",
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
      ],
    );
  }
}
