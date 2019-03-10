import 'package:flutter/material.dart';
import 'package:realworld/blocs/auth.bloc.dart';
import 'package:realworld/components.dart';
import 'package:realworld/forms.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.loggedIn,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return snapshot.data ? _form(context) : _links(context);
      },
    );
  }

  _form(context) {
    SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 60.0 : 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 20.0),
            child: Text("Profile", style: TextStyle(fontSize: 20.0)),
          ),
          ProfileForm()
        ],
      ),
    );
  }

  _links(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _logo(),
          RwButton(
            onPressed: () {
              Navigator.of(context).pushNamed("login");
            },
            title: "Sign In",
          ),
          RwDivider(),
          RwButton(
            onPressed: () {
              Navigator.of(context).pushNamed("register");
            },
            title: "Sign Up",
            background: Colors.white,
            color: Colors.green,
            border: Border.all(color: Colors.green),
          ),
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
}
