import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';

class ImageListTileWidget extends StatefulWidget {
  final String title;
  final String? imagen;
  final String precio;

  const ImageListTileWidget({
    super.key,
    required this.title,
    this.imagen,
    required this.precio,
  });

  @override
  State<ImageListTileWidget> createState() => _ImageListTileWidgetState();
}

class _ImageListTileWidgetState extends State<ImageListTileWidget> {
  bool masInformacion = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        : widget.imagen!,
                    width: 100,
                  ),
                  masInformacion == false ? Text(". . .", style: Styles.phantomPointsText) : SizedBox(height: 10,),
                  masInformacion == true
                      ? Text(
                          "Ingredientes\nIngredientes\nIngredientes\nIngredientes\nIngredientes\n",
                          style: Styles.phantomText,
                        )
                      : SizedBox(),
                ],
              ),
              Divider(),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
          
                  Text(widget.title, style: Styles.titleText),
                  Text('\$${widget.precio}', style: Styles.baseText),
                    ],
                  ),
                  TextButton(
                    style: Styles.imageListAddButtonStyle,
                    onPressed: () {
                      //añadir a la orden local
                    },
                    child: Image.asset(
                      "sources/images/loginImage.png",
                      width: 80,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
