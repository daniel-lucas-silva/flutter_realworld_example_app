import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text("Conduite"),
          ),
          RaisedButton(
            child: Text("Sign In"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}