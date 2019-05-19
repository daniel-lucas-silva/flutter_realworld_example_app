import 'package:flutter/material.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/views/auth/register_bloc.dart';
import 'package:realworld/views/home/home_view.dart';
import 'package:realworld/views/login_dialog.dart';

class RegisterView extends StatefulWidget {
  final BuildContext parentContext;

  RegisterView(this.parentContext);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  RegisterBloc _bloc = RegisterBloc();

  @override
  void initState() {
    _bloc.initState();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        brightness: Brightness.dark,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            StreamBuilder<String>(
              stream: _bloc.username,
              builder: (context, snapshot) {
                return _textField(
                  onChanged: _bloc.changeUsername,
                  label: "Username",
                  icon: Icons.person_outline,
                  error: snapshot.error,
                );
              }
            ),
            StreamBuilder<String>(
              stream: _bloc.email,
              builder: (context, snapshot) {
                return _textField(
                  onChanged: _bloc.changeEmail,
                  label: "Email",
                  icon: Icons.mail_outline,
                  error: snapshot.error,
                );
              }
            ),
            StreamBuilder<String>(
              stream: _bloc.password,
              builder: (context, snapshot) {
                return _textField(
                  onChanged: _bloc.changePassword,
                  label: "Password",
                  icon: Icons.lock_outline,
                  error: snapshot.error,
                  obscureText: true,
                );
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text("Have an account?"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    LoginDialog(widget.parentContext);
                  },
                ),
                RaisedButton(
                  child: Text("Sign Up"),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  onPressed: () {
                    _bloc.validate().then((_) {
                      print("here");
                      _bloc.send().then((_) {
                        push(context, HomeView());
                      });
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _textField({
    String label,
    IconData icon,
    String error,
    bool obscureText: false,
    Function(String) onChanged,
    TextInputType keyboardType: TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          errorText: error,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
      ),
    );
  }
}
