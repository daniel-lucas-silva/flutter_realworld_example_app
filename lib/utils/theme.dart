import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
    headline: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
    title: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),
    subhead: TextStyle(fontSize: 14.0),
    body1: TextStyle(fontSize: 13.0),
    body2: TextStyle(fontSize: 12.0),
  ),
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 22,
          fontFamily: "Titillium",
          fontWeight: FontWeight.w700,
        ),
        body1: TextStyle(color: Colors.white),
        body2: TextStyle(color: Colors.white70, fontSize: 11.0),
      ),
      iconTheme: IconThemeData(color: Colors.white)),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xAAECEFF1),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: RwColors.green,
    textTheme: ButtonTextTheme.primary,
    layoutBehavior: ButtonBarLayoutBehavior.padded,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: EdgeInsets.all(15),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.0),
    ),
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontFamily: "Titillium",
      fontWeight: FontWeight.w600,
      color: RwColors.grey[800]
    ),
  ),
);

var markdownStyle = MarkdownStyleSheet(
  a: TextStyle(
      color: RwColors.green[600], decoration: TextDecoration.underline),
  p: rwTheme.textTheme.body1,
  code: TextStyle(
      color: Colors.grey.shade700,
      fontFamily: "monospace",
      fontSize: rwTheme.textTheme.body1.fontSize * 0.85),
  h1: rwTheme.textTheme.headline,
  h2: rwTheme.textTheme.title,
  h3: rwTheme.textTheme.subhead,
  h4: rwTheme.textTheme.body1,
  h5: rwTheme.textTheme.body1,
  h6: rwTheme.textTheme.body1,
  em: const TextStyle(fontStyle: FontStyle.italic),
  strong: const TextStyle(fontWeight: FontWeight.bold),
  blockquote: rwTheme.textTheme.body1,
  img: rwTheme.textTheme.body1,
  blockSpacing: 8.0,
  listIndent: 32.0,
  blockquotePadding: 10.0,
  blockquoteDecoration: BoxDecoration(
      color: Colors.grey[200], borderRadius: BorderRadius.circular(10.0)),
  codeblockPadding: 10.0,
  codeblockDecoration: BoxDecoration(
      color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10.0)),
  horizontalRuleDecoration: BoxDecoration(
    border: Border(top: BorderSide(width: 5.0, color: Colors.grey.shade300)),
  ),
);
