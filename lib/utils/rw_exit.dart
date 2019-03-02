import 'package:flutter/material.dart';

Future<bool> rwExit(context, title, description) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$title'),
            content: Text('$description'),
            actions: <Widget>[
              FlatButton(
                child: Text('Nao'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      ) ??
      false;
}
