import 'package:flutter/material.dart';
class Styles {
  static final TextStyle baseText = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: "Roboto");

  static final TextStyle titleText = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: "Roboto");

  static final ButtonStyle buttonStyle = ButtonStyle(
    maximumSize: WidgetStateProperty.resolveWith<Size>((
      Set<WidgetState> states
    ){
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
        return Color.fromARGB(255, 235, 24, 137);
      } else if (states.contains(WidgetState.disabled)) {
        return const Color.fromARGB(255, 235, 24, 137);
      }
      return Colors.black;
    }),
  );

  static final TextStyle buttonTextStyle = baseText.copyWith(color: Colors.white);

  static InputDecoration createInputDecoration(String text)
  {
    InputDecoration inputDecoration = InputDecoration(
      filled: true,
    fillColor: Colors.grey.shade300,
    focusColor: Colors.red,
    labelStyle: baseText,
    label: Text(text),
    border: OutlineInputBorder());

    return inputDecoration;
  }
}