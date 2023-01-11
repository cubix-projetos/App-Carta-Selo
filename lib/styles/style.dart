import 'package:flutter/material.dart';

const brightness = Brightness.light;

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText2: new TextStyle(
        fontFamily: "Quicksand",
      ),
      bodyText1: TextStyle(
        fontFamily: "Quicksand",
      ),
      button: TextStyle(
        fontFamily: "Quicksand",
      ),
      caption: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline4: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline3: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline2: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline1: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline5: TextStyle(
        fontFamily: "Quicksand",
      ),
      overline: TextStyle(
        fontFamily: "Quicksand",
      ),
      subtitle1: TextStyle(
        fontFamily: "Quicksand",
      ),
      subtitle2: TextStyle(
        fontFamily: "Quicksand",
      ),
      headline6: TextStyle(
        fontFamily: "Quicksand",
      ),
    ),
    primaryColor: Colors.blue,
    accentColor: Colors.white,
  );
}
