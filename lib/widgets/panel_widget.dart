import 'package:flutter/material.dart';

class panelWidget extends StatefulWidget {
  final Color colorBase;
  final Color colorBorde;
  final Widget? child;
  final EdgeInsets padding;

  const panelWidget({super.key, this.colorBase = Colors.grey, this.colorBorde = Colors.black, this.child, this.padding = const EdgeInsets.all(0)});

  @override
  State<panelWidget> createState() => _panelWidgetState();
}

class _panelWidgetState extends State<panelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.colorBase,
        borderRadius: BorderRadius.circular(10)),
      padding: widget.padding,
      margin: EdgeInsets.all(4),
      child: widget.child,
    );
  }
}