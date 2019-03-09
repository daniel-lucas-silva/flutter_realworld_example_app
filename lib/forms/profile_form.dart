import 'package:flutter/material.dart';
import 'package:realworld/blocs/auth_bloc.dart';
import 'package:realworld/components.dart';
import 'package:realworld/utils.dart';

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _ProfileModelView _modelView = _ProfileModelView();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _usernameFocus = FocusNode();
  FocusNode _bioFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  bool _formWasEdited = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bioFocus.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onWillPop: () async {
        final FormState form = _formKey.currentState;
        if (form == null || !_formWasEdited || form.validate()) return true;
        return await rwExit(context, "title", "bio");
      },
      key: _formKey,
      onChanged: () {
        _formWasEdited = true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _urlField(),
          RwDivider(),
          _usernameField(),
          RwDivider(),
          _bioField(),
          RwDivider(),
          _emailField(),
          RwDivider(),
          _passwordField(),
          _submitButton(),
        ],
      ),
    );
  }

  _urlField() {
    return RwInput(
      hint: 'http://domain.com/avatar.png',
      label: 'Url of profile picture',
      keyboardType: TextInputType.url,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_usernameFocus);
      },
      onSaved: (val) => _modelView.url = val,
    );
  }

  _usernameField() {
    return RwInput(
      hint: 'Your username',
      label: 'Username',
      focusNode: _usernameFocus,
      onEditingComplete: () {
        _usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(_bioFocus);
      },
      validator: (val) {
        _formWasEdited = true;
        return val.isEmpty ? 'Please, type your username' : null;
      },
      onSaved: (val) => _modelView.username = val,
    );
  }

  _bioField() {
    return RwInput(
      hint: 'Short bio about you',
      label: 'Bio',
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      focusNode: _bioFocus,
      onSaved: (val) => _modelView.bio = val,
    );
  }

  _emailField() {
    return RwInput(
      hint: 'Your email',
      label: 'Email',
      focusNode: _emailFocus,
      onEditingComplete: () {
        _emailFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      validator: (val) {
        _formWasEdited = true;
        return val.isEmpty ? 'Please, type your email' : null;
      },
      onSaved: (val) => _modelView.email = val,
    );
  }

  _passwordField() {
    return RwInput(
      hint: 'Your password',
      label: 'Password',
      focusNode: _passwordFocus,
      onEditingComplete: () {
        _passwordFocus.unfocus();
        _onSubmit();
      },
      validator: (val) {
        _formWasEdited = true;
        return val.isEmpty ? 'Please, type your password' : null;
      },
      onSaved: (val) => _modelView.password = val,
    );
  }

  _submitButton() {
    return StreamBuilder(
      stream: authBloc.loading,
      initialData: false,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: RwButton(
            onPressed: _onSubmit,
            title: "Update Settings",
            loading: snapshot.data,
          ),
        );
      },
    );
  }

  _onSubmit() async {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Por favor, complete o formulario."),
        ),
      );
    } else {
      form.save();
      // authBloc.create(_modelView).then((_) async {
      //   authBloc.fetch().then((_) {
      //     Navigator.of(context).pop();
      //   });
      // });
    }
  }
}

class _ProfileModelView {
  String url;
  String username;
  String bio;
  String email;
  String password;

  toMap() {
    return {
      "url": this.url,
      "username": this.username,
      "bio": this.bio,
      "email": this.email,
      "password": this.password,
    };
  }
}
