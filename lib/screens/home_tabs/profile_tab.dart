import 'package:flutter/material.dart';
import 'package:realworld/forms/profile_form.dart';

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
      child: ProfileForm(),
    );
  }
}
