import 'package:flutter/material.dart';
import 'package:realworld/forms.dart';

class AuthRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  _logo(),
                  _signIn(context),
                  _form(),
                ],
              ),
            ),
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          )
        ],
      ),
    );
  }

  _logo() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Conduite",
            style: TextStyle(
              fontFamily: "Titillium",
              fontWeight: FontWeight.w700,
              color: Colors.green,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }

  _signIn(context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).popAndPushNamed('register');
            },
            child: Text(
              "Have an account?",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  _form() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: RegisterForm(),
    );
  }
}
