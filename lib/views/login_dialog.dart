import 'package:flutter/material.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/auth/register_view.dart';
import 'package:realworld/views/login_bloc.dart';
import 'package:realworld/views/login_form.dart';

enum DialogAction {
  cancel,
  register,
  login,
}

class LoginDialog {
  LoginDialog(BuildContext parentContext, {Function() callback}) {
    showDialog(
      context: parentContext,
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
          content: LoginForm(),
          actions: <Widget>[
            FlatButton(
              child: Text('Need an account?'),
              textColor: RwColors.green,
              onPressed: () {
                Navigator.pop(context, DialogAction.register);
                push(context, RegisterView(parentContext));
              },
            ),
            FlatButton(
              child: Text('LOGIN'),
              onPressed: () {
                loginBloc.login().then((_) {
                  Navigator.pop(context, DialogAction.login);
                });
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
