import 'package:flutter/material.dart';

class RwDivider extends StatelessWidget {
  final double value;

  RwDivider({
    this.value: 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value,
      width: value,
    );
  }
}
