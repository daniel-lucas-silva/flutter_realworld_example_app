import 'package:flutter/material.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/auth/register_view.dart';

enum DialogAction {
  cancel,
  register,
  login,
}

class LoginForm {
  static void show(BuildContext profileContext) {
    showDialog(
      context: profileContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Login'),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context, DialogAction.cancel);
                },
              ),
            ],
          ),
          titlePadding:
              EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 7),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    isDense: false,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    isDense: false,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Need an account?'),
              textColor: RwColors.green,
              onPressed: () {
                Navigator.pop(context, DialogAction.register);
                push(context, RegisterView(profileContext));
              },
            ),
            FlatButton(
              child: Text('LOGIN'),
              onPressed: () {
                Navigator.pop(context, DialogAction.login);
              },
            ),
          ],
        );
      },
    ).then<void>((value) {
      print(value);
    }); 
  }
}