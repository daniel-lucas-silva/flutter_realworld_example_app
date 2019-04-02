import 'package:flutter/material.dart';
import 'package:realworld/views/auth/auth_view.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with AutomaticKeepAliveClientMixin<ProfileView> {

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: AuthView(),
    );
  }
}