import 'package:flutter/material.dart';

class RwColors {
  static const int _greenPrimaryValue = 0xFF5CB85C;
  static const int _greyPrimaryValue = 0xFF818a91;

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
       50: Color(0xFFA6D8A6),
      100: Color(0xFF97D197),
      200: Color(0xFF88CB88),
      300: Color(0xFF79C479),
      400: Color(0xFF6ABE6A),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF54A854),
      700: Color(0xFF4C974C),
      800: Color(0xFF438643),
      900: Color(0xFF3B763B),
    },
  );

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
       50: Color(0xFFBABFC3),
      100: Color(0xFFAEB4B9),
      200: Color(0xFFA3A9AF),
      300: Color(0xFF979FA5),
      400: Color(0xFF8C949B),
      500: Color(_greyPrimaryValue),
      600: Color(0xFF767E84),
      700: Color(0xFF6A7177),
      800: Color(0xFF5E656A),
      900: Color(0xFF53585D),
    },
  );
}

ThemeData rwTheme = ThemeData(
  primarySwatch: RwColors.green,
  primaryColor: RwColors.green,
  accentColor: RwColors.grey,
  // fontFamily: '',
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    body1: TextStyle(fontSize:14.0),
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: TextStyle(fontSize: 22, fontFamily: "Titillium", fontWeight: FontWeight.w700),
      body1: TextStyle(color: Colors.white)
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: Colors.grey[50],
  )
);
