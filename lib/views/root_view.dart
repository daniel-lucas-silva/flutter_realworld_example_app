import 'package:flutter/material.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/home/home_view.dart';

class RootView extends StatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        checkerboardOffscreenLayers: false,
        title: 'Conduite',
        theme: rwTheme,
        home: HomeView(),
      ),
    );
  }
}