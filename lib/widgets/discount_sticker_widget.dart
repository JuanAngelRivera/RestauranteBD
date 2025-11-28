import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class DiscountStickerWidget extends StatefulWidget {
  final String descuento;
  const DiscountStickerWidget({
    super.key,
    required this.descuento});

  @override
  State<DiscountStickerWidget> createState() => _DiscountStickerWidgetState();
}

class _DiscountStickerWidgetState extends State<DiscountStickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Image.asset(
          "sources/images/ui/discountSticker.png",
          width: 50),
        Text(
          "-${widget.descuento}%",
          style: Styles.priceText,)
      ],
    );
  }
}