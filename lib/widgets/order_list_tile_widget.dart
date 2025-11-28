import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class OrderListTileWidget extends StatefulWidget {
  final String nombreProducto;
  final double precio;
  final VoidCallback onRemove;
  final int cantidad;
  final double subtotal;
  final Function(int nuevaCantidad) onCantidadChanged;
  
  const OrderListTileWidget({
    super.key, 
    required this.nombreProducto, 
    required this.precio, 
    required this.onRemove, 
    required this.cantidad, 
    required this.subtotal, 
    required this.onCantidadChanged
    });

  @override
  State<OrderListTileWidget> createState() => _OrderListTileWidgetState();
}

class _OrderListTileWidgetState extends State<OrderListTileWidget> {
  late TextEditingController cantidadController;

  @override
  void initState(){
    super.initState();
    cantidadController = TextEditingController(text: widget.cantidad.toString());
  }

  @override
  void dispose(){
    cantidadController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant OrderListTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.cantidad != widget.cantidad) {
      cantidadController.text = widget.cantidad.toString();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return PanelWidget(
      colorBase: Colors.grey.shade300,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 2,
        bottom: 2
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.nombreProducto,
                style: Styles.titleText,
              ),
              Text("\$${widget.precio.toStringAsFixed(2)}"),
              SizedBox(
                width: 80,
                height: 30,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: Styles.createInputDecoration("", Styles.fondoClaro),
                  controller: cantidadController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    setState(() {
                      int nuevaCantidad = int.tryParse(value) ?? 1;

                      if (nuevaCantidad < 1){
                        nuevaCantidad = 1;
                        cantidadController.text = "1";
                        cantidadController.selection = TextSelection.collapsed(
                          offset: cantidadController.text.length);
                      }
                      widget.onCantidadChanged(nuevaCantidad);
                    }
                    );
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  "\$${widget.subtotal.toStringAsFixed(2)}", 
                  textAlign: TextAlign.center,)),
              ElevatedButton(
                onPressed: widget.onRemove, 
                child: Text("-"))
            ],
          ),
        ],
      ),
    );
  }
}