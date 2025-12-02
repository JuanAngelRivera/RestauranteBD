import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class DiscountListTileWidget extends StatefulWidget {
  final String nombre;
  final int? descuento;
  final double subtotal;
  const DiscountListTileWidget({
    super.key, 
    required this.nombre, 
    this.descuento, 
    required this.subtotal});

  @override
  State<DiscountListTileWidget> createState() => _DiscountListTileWidgetState();
}

class _DiscountListTileWidgetState extends State<DiscountListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.descuento == null 
    ? SizedBox() 
    : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 30,
      children: [
        Text(
          widget.nombre,
          style: Styles.discountText,),
        Text(
          "${widget.descuento}%",
          style: Styles.discountText_,),
        Text(
          "-\$${widget.subtotal.toStringAsFixed(2)}",
          style: Styles.discountText,)
      ],
    );
  }
}