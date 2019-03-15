import 'package:flutter/material.dart';

navigate(context, Widget screen, { pop: false }) {
  if(pop)
    Navigator.of(context).pop();

  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

replace(context, Widget screen) {
  return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => screen),
          (_) => false);
}
