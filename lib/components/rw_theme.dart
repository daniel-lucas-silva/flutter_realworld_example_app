import 'package:flutter/material.dart';

class RwTheme {
  static ThemeData light(context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      tabBarTheme: TabBarTheme(
        labelColor: Colors.green,
        unselectedLabelColor: Colors.black54,
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.green, fontSize: 18.0),
          button: TextStyle(color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
      ),
    );
  }
}
