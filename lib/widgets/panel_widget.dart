import 'package:flutter/material.dart';

class PanelWidget extends StatefulWidget {
  final Color colorBase;
  final Color colorBorde;
  final Widget? child;
  final EdgeInsets padding;
  final int transparencia;

  const PanelWidget({
    super.key, 
    this.colorBase = Colors.grey, 
    this.colorBorde = Colors.black, 
    this.child, 
    this.padding = const EdgeInsets.all(0),
    this.transparencia = 255});

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.colorBase.withAlpha(widget.transparencia),
        borderRadius: BorderRadius.circular(10)),
      padding: widget.padding,
      margin: EdgeInsets.all(4),
      child: widget.child,
    );
  }
}