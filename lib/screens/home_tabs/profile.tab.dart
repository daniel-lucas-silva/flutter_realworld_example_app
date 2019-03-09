import 'package:flutter/material.dart';
import 'package:realworld/forms.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
}
