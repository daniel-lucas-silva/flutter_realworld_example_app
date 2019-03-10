import 'package:flutter/material.dart';
import 'package:realworld/blocs/app.bloc.dart';
// screens
import 'package:realworld/screens.dart';
// blocs
import 'package:realworld/blocs/auth.bloc.dart';

void main() => runApp(Conduit());

class Conduit extends StatefulWidget {
  @override
  _ConduitState createState() => _ConduitState();
}

class _ConduitState extends State<Conduit> {
  @override
  void initState() {
    appBloc.initState();
    authBloc.initState();
    super.initState();
  }

  @override
  void dispose() {
    appBloc.dispose();
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conduit',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
        'login': (context) => AuthLoginScreen(),
        'register': (context) => AuthRegisterScreen(),
      },
    );
  }
}
