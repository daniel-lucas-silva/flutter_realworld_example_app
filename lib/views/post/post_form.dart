import 'package:flutter/material.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _textField(hint: "Title"),
          _textField(hint: "Description"),
          _textField(hint: "Body"),
          _textField(hint: "Tags"),
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
        child: Text("Publish Article", style: TextStyle(color: Colors.white)),
        onPressed: () {},
      ),
    );
  }
}
