import 'package:flutter/material.dart';

class panelWidget extends StatefulWidget {
  const panelWidget({super.key});

  @override
  State<panelWidget> createState() => _panelWidgetState();
}

class _panelWidgetState extends State<panelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.all(color: Colors.blue, style: BorderStyle.solid)
      ),
    );
  }
}