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
    required this.precio});

  @override
  State<ImageListTileWidget> createState() => _ImageListTileWidgetState();
}

class _ImageListTileWidgetState extends State<ImageListTileWidget> {
  bool masInformacion = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        setState(() {
          masInformacion = !masInformacion;
        });
      },
      child: Column(
        children: [
          Image.asset(widget.imagen!.isEmpty ?  
          "sources/images/fotosProducto/placeholder.png" : 
          widget.imagen!,
          width: 100,),
          Text(
            widget.title,
            style: Styles.titleText,
          ),
          Text(
            '\$${widget.precio}', 
            style: Styles.baseText),
          masInformacion == true ? Text(
            "Ingredientes\nIngredientes\nIngredientes\nIngredientes\nIngredientes\n",
            style: Styles.baseText,) : SizedBox(),
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: TextButton(
              onPressed: (){
                //añadir a la orden local
            }, 
            child: Image.asset("sources/images/loginImage.png", width: 50,)),
          ),
        ],
      ),
    );
  }
}