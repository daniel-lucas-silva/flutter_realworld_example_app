import 'package:flutter/material.dart';

class RwAppBar extends StatelessWidget implements PreferredSizeWidget {
  RwAppBar({this.actions, this.bottom})
      : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  final List<Widget> actions;
  final PreferredSizeWidget bottom;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        "Conduite",
        style: TextStyle(fontFamily: "Titillium", fontWeight: FontWeight.w700),
      ),
      actions: actions,
      bottom: bottom,
      centerTitle: true,
    );
  }

  @override
  final Size preferredSize;
}
