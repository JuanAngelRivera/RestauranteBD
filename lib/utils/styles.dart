import 'package:flutter/material.dart';

class Styles {
  static final TextStyle baseText = TextStyle(
    color: fondoOscuro,
    fontSize: 16,
    fontFamily: "Roboto",
  );

  static final TextStyle titleText = TextStyle(
    color: fondoOscuro,
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: "Roboto",
  );

  static final ButtonStyle buttonStyle = ButtonStyle(
    maximumSize: WidgetStateProperty.resolveWith<Size>((
      Set<WidgetState> states,
    ) {
      return Size(200, 100);
    }),
    alignment: Alignment.center,
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white;
      } else if (states.contains(WidgetState.disabled)) {
        return Colors.white;
      }
      return Colors.white;
    }),
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        return contraste;
      } else if (states.contains(WidgetState.disabled)) {
        return contraste;
      }
      return Colors.black;
    }),
  );

  static final Color contraste = Color.fromARGB(255, 235, 24, 137);

  static final Color fondoClaro = Colors.grey.shade500;

  static final Color fondoOscuro = Colors.grey.shade900;

  static final TextStyle baseTextW = baseText.copyWith(
    color: Colors.white);

  static final TextStyle titleTextW = titleText.copyWith(
    color: Colors.white);

  static final TextStyle phantomText = baseText.copyWith(
    color: Colors.grey.shade500);

  static final TextStyle phantomPointsText = phantomText.copyWith(
    fontSize: 24);

  static final TextStyle priceText = titleText.copyWith(
    color: contraste,
  );

  static final TextStyle discountText = priceText.copyWith(
    decoration: TextDecoration.lineThrough,
    decorationColor: contraste,
    fontSize: 16
  );

  static InputDecoration createInputDecoration(String text, Color colorBase) {
    InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: colorBase,
      labelStyle: baseText.copyWith(color: contraste),
      label: Text(text,),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: contraste,
        )
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red
        )
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5)
      )
    );

    return inputDecoration;
  }

  static ButtonStyle imageListButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(10))),
    backgroundColor: WidgetStatePropertyAll(Colors.grey.shade300),
    overlayColor: WidgetStatePropertyAll(Colors.transparent)
  );

  static ButtonStyle imageListAddButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(10))),
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStatePropertyAll(Colors.transparent)
  );
}
