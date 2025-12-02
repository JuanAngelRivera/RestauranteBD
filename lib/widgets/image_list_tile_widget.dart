import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurante_base_de_datos/providers/dao_helper_provider.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/discount_sticker_widget.dart';

class ImageListTileWidget extends ConsumerStatefulWidget {
  final String title;
  final String? imagen;
  final double precio;
  final int id;

  final void Function(
    String nombre, 
    double precio,
    int id) onAdd;

  const ImageListTileWidget({
    super.key,
    required this.title,
    this.imagen,
    required this.precio,
    required this.onAdd, required this.id,
  });

  @override
  ConsumerState<ImageListTileWidget> createState() => _ImageListTileWidgetState();
}

class _ImageListTileWidgetState extends ConsumerState<ImageListTileWidget> {
  bool masInformacion = false;
  bool tieneDescuento = false;
  late int descuento;

  @override
  void initState(){
    super.initState();
    init();
  }

  void init() async {
    final daohelper = ref.read(daoHelperProvider);
    final resultado = await daohelper.obtenerDescuentos(widget.id);
    if (resultado == null) {
      descuento = 0;
    } else {
      tieneDescuento = true;
      descuento = resultado["porcentaje"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tieneDescuento == false) descuento = 0;
    return Stack(
      children: [
        Container(
        margin: EdgeInsets.all(10),
        child: TextButton(
          style: Styles.imageListButtonStyle,
          onPressed: () {
            setState(() {
              masInformacion = !masInformacion;
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      widget.imagen!.isEmpty
                          ? "sources/images/fotosProducto/placeholder.png"
                          : 'sources/images/fotosProducto/${widget.imagen!}',
                      width: 100,
                    ),
                    masInformacion == false ? Text(". . .", style: Styles.phantomPointsText) : SizedBox(height: 10,),
                    masInformacion == true
                        ? Text(
                            "Ingredientes\nIngredientes\nIngredientes\nIngredientes\nIngredientes\n",
                            style: Styles.phantomText,
                            textAlign: TextAlign.left,
                          )
                        : SizedBox(),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
            
                    Text(widget.title, style: Styles.titleText),
                    Text(
                      '\$${(widget.precio).toStringAsFixed(2)}',
                      style: tieneDescuento == true ? Styles.discountText_ : Styles.priceText),
                      ],
                    ),
                    tieneDescuento == true ? 
                    Text(
                      '\$${(widget.precio - widget.precio * descuento / 100).toStringAsFixed(2)}',
                      style: Styles.priceText)
                    : SizedBox(),
                    ElevatedButton(
                      onPressed: () {
                        widget.onAdd(
                          widget.title, 
                          widget.precio,
                          widget.id);
                      },
                      style: Styles.buttonStyle,
                      child: Text("+", style: TextStyle(fontSize: 40), textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      tieneDescuento == true ? 
      Positioned(
          top: 20,
          right: 20,
          child: DiscountStickerWidget(
            descuento: descuento.toString())) : 
      SizedBox(),
    ]);
  }
}
