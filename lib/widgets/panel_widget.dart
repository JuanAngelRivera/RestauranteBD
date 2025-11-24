import 'package:flutter/material.dart';

class PanelWidget extends StatefulWidget {
  final Color colorBase;
  final Color colorBorde;
  final Widget? child;
  final EdgeInsets padding;
  final int transparencia;
  final bool sombra;
  final bool neon;

  const PanelWidget({
    super.key, 
    this.colorBase = Colors.grey, 
    this.colorBorde = Colors.black, 
    this.child, 
    this.padding = const EdgeInsets.all(0),
    this.transparencia = 255,
    this.sombra = false,
    this.neon = false});

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      decoration: BoxDecoration(
        boxShadow: widget.sombra == true ? [
          BoxShadow(
            blurRadius: 3,
            color: widget.colorBorde.withValues(
              red: widget.colorBorde.r * .5, 
              green: widget.colorBorde.g * .5, 
              blue: widget.colorBorde.b * .5), 
            offset: Offset(3, 3)),
          BoxShadow(
            blurRadius: 3,
            color: widget.neon == true ? Colors.white : widget.colorBorde, 
            offset: Offset(1, 1)),
        ] : [],
        color: widget.colorBase.withAlpha(widget.sombra == true ? 255 : widget.transparencia  ),
        borderRadius: BorderRadius.circular(10)),
      padding: widget.padding,
      margin: EdgeInsets.all(4),
      child: widget.child,
    );
  }
}