import 'package:flutter/material.dart';
import 'package:realworld/views/login_dialog.dart';

class RegisterView extends StatefulWidget {
  final BuildContext parentContext;

  RegisterView(this.parentContext);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: "Username",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                labelText: "Email",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
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
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
