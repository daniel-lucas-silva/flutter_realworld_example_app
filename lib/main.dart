import 'package:flutter/material.dart';
import 'package:realworld/blocs.dart' show appBloc, authBloc;
import 'package:realworld/screens.dart' show HomeScreen;
import 'package:realworld/utils.dart' show storage, request;

void main() async {
  final String token = await storage.read(key: "token");
  request.auth(token);
  runApp(Conduit(token));
}

class Conduit extends StatefulWidget {
  final String token;

  Conduit(this.token);

  @override
  _ConduitState createState() => _ConduitState();
}

class _ConduitState extends State<Conduit> {
  @override
  void initState() {
    appBloc.initState();
    authBloc.initState();

    if (widget.token != null) authBloc.loadUser();

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
      home: HomeScreen(),
    );
  }
}
