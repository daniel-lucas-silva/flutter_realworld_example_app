import 'package:flutter/material.dart';
// screens
import 'package:realworld/screens/home_screen.dart';

void main() => runApp(Conduit());

class Conduit extends StatefulWidget {
  @override
  _ConduitState createState() => _ConduitState();
}

class _ConduitState extends State<Conduit> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conduit',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen()
      },
    );
  }
}
