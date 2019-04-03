import 'package:flutter/material.dart';
import 'package:realworld/views/home/profile/login_form.dart';

class RegisterView extends StatefulWidget {

  final BuildContext profileContext;

  RegisterView(this.profileContext);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
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
                    LoginForm.show(widget.profileContext);
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
