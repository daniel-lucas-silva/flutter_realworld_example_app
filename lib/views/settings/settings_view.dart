import 'package:flutter/material.dart';
import 'package:realworld/views/settings/settings_form.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Your Settings"),
      ),
      body: Container(
        child: SettingsForm(),
      ),
    );
  }
}
