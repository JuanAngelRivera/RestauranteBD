import 'package:flutter/material.dart';
import 'package:restaurante_base_de_datos/utils/styles.dart';
import 'package:restaurante_base_de_datos/widgets/panel_widget.dart';

class adminView extends StatefulWidget {
  const adminView({super.key});

  @override
  State<adminView> createState() => _adminViewState();
}

class _adminViewState extends State<adminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.fondoOscuro,
      body: SizedBox.expand(
        child: PanelWidget(
          colorBase: Styles.fondoOscuro,
          padding: EdgeInsets.all(10),    
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PanelWidget(
                colorBase: Styles.fondoClaro,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Cherry Café", style: Styles.titleText,),
                    SizedBox(width: 30,),
                    Text("NOMBRE DEL LOCAL", style: Styles.baseText,),
                    Expanded(child: SizedBox()),
                    Image.asset("sources/images/loginImage.png", width: 50,)
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }
}