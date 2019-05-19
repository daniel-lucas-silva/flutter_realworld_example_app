import 'package:flutter/material.dart';
import 'package:realworld/views/root_bloc.dart';
import 'package:realworld/views/settings/settings_bloc.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final SettingsModelView _modelView = SettingsModelView();
  final SettingsBloc _bloc = SettingsBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _textField(
            hint: "URL of profile picture",
            initialValue: rootBloc.user.value.image ?? "",
            onSaved: (val) => _modelView.image = val,
          ),
          _textField(
            hint: "Username",
            initialValue: rootBloc.user.value.username,
            validator: (val) =>
                val.isEmpty ? 'Please type your username' : null,
            onSaved: (val) => _modelView.username = val,
          ),
          _textField(
            hint: "Short bio about you",
            initialValue: rootBloc.user.value.bio ?? "",
            maxLines: 7,
            onSaved: (val) => _modelView.bio = val,
          ),
          _textField(
            hint: "Email",
            initialValue: rootBloc.user.value.email,
            validator: (val) => val.isEmpty ? 'Please type your email' : null,
            onSaved: (val) => _modelView.email = val,
          ),
          _textField(
            hint: "New password",
          ),
          _submitButton(onPressed: _onSubmit),
        ],
      ),
    );
  }

  Widget _textField(
      {String hint,
      TextInputType keyboardType: TextInputType.text,
      Function(String) validator,
      Function onSaved,
      String initialValue,
      int maxLines: 1}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(hintText: hint),
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        initialValue: initialValue,
      ),
    );
  }

  Widget _submitButton({Function() onPressed}) {
    return Container(
      child: RaisedButton(
        child: Text("Update Settings", style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }

  void _onSubmit() async {
    final FormState form = _formKey.currentState;

    if (form.validate()){
      form.save();
      _bloc.save(_modelView.toMap()).then((_) async {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Settings updated!"),
          ),
        );
      }).catchError((err) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("${err.response.toString()}"),
          ),
        );
      });
    }
  }
}
