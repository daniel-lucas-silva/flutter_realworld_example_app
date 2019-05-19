import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _textField(hint: "URL of profile picture"),
          _textField(hint: "Username"),
          _textField(hint: "Short bio about you"),
          _textField(hint: "E-mail"),
          _textField(hint: "New password"),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _textField(
      {String hint,
      TextInputType keyboardType: TextInputType.text,
      Function(String) validator,
      Function onSaved}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(hintText: hint),
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      child: RaisedButton(
        child: Text("Update Settings", style: TextStyle(color: Colors.white)),
        onPressed: () {},
      ),
    );
  }
}
