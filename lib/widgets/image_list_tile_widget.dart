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
    required this.onAdd,
    required this.id,
  });

  @override
  ConsumerState<ImageListTileWidget> createState() =>
      _ImageListTileWidgetState();
}

class _ImageListTileWidgetState extends ConsumerState<ImageListTileWidget> {
  bool masInformacion = false;
  bool tieneDescuento = false;
  late int descuento;
  List<String> ingredientes = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
  final daohelper = ref.read(daoHelperProvider);

  final resultadoDescuento = await daohelper.obtenerDescuentos(widget.id);
  final resultadoIngredientes = await daohelper.ingredientesPorProducto(widget.id);

  setState(() {
    if (resultadoDescuento != null) {
      tieneDescuento = true;
      descuento = resultadoDescuento["porcentaje"];
    } else {
      tieneDescuento = false;
      descuento = 0;
    }

    ingredientes = resultadoIngredientes;
  });
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
                      Container(
                        width: 300,
                        height: 100,
                        child: Image.asset(
                          widget.imagen!.isEmpty
                              ? "sources/images/fotosProducto/placeholder.png"
                              : 'sources/images/fotosProducto/${widget.imagen!}',
                        ),
                      ),
                      Text("Ingredientes: ", style: Styles.baseText,),
                      masInformacion == false
                          ? Text(". . .", style: Styles.phantomPointsText)
                          : SizedBox(height: 10),
                      masInformacion == true
                          ? ListView.builder(
                            itemCount: ingredientes.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    '• ${ingredientes[index]}',
                                    style: Styles.phantomText,
                                  ),
                                ],
                              );
                            })
                          : SizedBox(),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                style: Styles.titleText,
                                overflow:
                                    TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '\$${(widget.precio).toStringAsFixed(2)}',
                              style: tieneDescuento == true
                                  ? Styles.discountText_
                                  : Styles.priceText,
                            ),
                          ],
                        ),
                      ),
                      if (tieneDescuento)
                        Text(
                          '\$${(widget.precio - widget.precio * descuento / 100).toStringAsFixed(2)}',
                          style: Styles.priceText,
                        ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          widget.onAdd(
                            widget.title, 
                            widget.precio, 
                            widget.id);
                        },
                        style: Styles.buttonStyle,
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        tieneDescuento == true
            ? Positioned(
                top: 20,
                right: 20,
                child: DiscountStickerWidget(descuento: descuento.toString()),
              )
            : SizedBox(),
      ],
    );
  }
}