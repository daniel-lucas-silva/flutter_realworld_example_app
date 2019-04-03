import 'package:flutter/material.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/auth/register_view.dart';
import 'package:realworld/views/login_dialog.dart';

class ProfileView extends StatefulWidget {
  final GlobalKey<ScaffoldState> key;

  ProfileView({this.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin<ProfileView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Conduite",
                  style: TextStyle(
                      color: RwColors.green,
                      fontSize: 40,
                      fontFamily: "Titillium",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: () {
                LoginDialog(context);
              },
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            FlatButton(
              child: Text("Sign Up"),
              onPressed: () {
                push(context, RegisterView(context));
              },
            )
          ],
        ),
      ),
    );
  }

}
