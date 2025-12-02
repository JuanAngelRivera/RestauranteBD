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
    required this.onCantidadChanged,
  });

  @override
  State<OrderListTileWidget> createState() => _OrderListTileWidgetState();
}

class _OrderListTileWidgetState extends State<OrderListTileWidget> {
  late TextEditingController cantidadController;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    cantidadController = TextEditingController(
      text: widget.cantidad.toString(),
    );
    focusNode = FocusNode();
    focusNode.addListener(() {
    if (!focusNode.hasFocus) {
      updateContador(cantidadController.text);
    }
  });
  }

  @override
  void dispose() {
    cantidadController.dispose();
    focusNode = FocusNode();
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
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.nombreProducto, style: Styles.baseText),
              SizedBox(width: MediaQuery.of(context).size.width * 0.001),
              Text("\$${widget.precio.toStringAsFixed(2)}"),
              SizedBox(width: MediaQuery.of(context).size.width * 0.001),
              SizedBox(
                width: 80,
                height: 30,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: Styles.createInputDecoration(
                    "",
                    Styles.fondoClaro,
                  ),
                  controller: cantidadController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  "\$${widget.subtotal.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: widget.onRemove, 
                style: Styles.buttonStyle,
                child: Text("-")),
            ],
          ),
        ],
      ),
    );
  }

  void updateContador(value) {
    int nuevaCantidad = int.tryParse(value) ?? 1;
    if (nuevaCantidad < 1) {
      nuevaCantidad = 1;
      cantidadController.text = "1";
    }
    widget.onCantidadChanged(nuevaCantidad);
  }
}