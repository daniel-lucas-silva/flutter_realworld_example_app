import 'package:flutter/material.dart';
import 'package:realworld/models/user.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/auth/register_view.dart';
import 'package:realworld/views/login_dialog.dart';
import 'package:realworld/views/root_bloc.dart';
import 'package:realworld/views/settings/settings_view.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              primary: true,
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                getHeader(),
                getButtons(),
                AboutListTile(
                  child: Text("About"),
                  icon: Icon(Icons.info_outline),
                  applicationName: "Conduite",
                  applicationIcon: Icon(Icons.input),
                  aboutBoxChildren: <Widget>[
                    Text(
                        "https://github.com/daniel-lucas-silva/flutter_realworld_example_app")
                  ],
                  applicationVersion: "1.0.1",
                )
              ],
            ),
          ),
          ListTile(
            title: Text("Daniel Lucas Silva"),
            subtitle: Text("https://github.com/daniel-lucas-silva\nContribute !!!"),
            dense: true,
          )
        ],
      ),
    );
  }

  getButtons() {
    return StreamBuilder(
      stream: rootBloc.authenticated,
      initialData: false,
      builder: (context, snapshot) {
        return !snapshot.data
            ? Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Sign In"),
                    leading: Icon(Icons.person),
                    onTap: () {
                      LoginDialog(context);
                    },
                  ),
                  ListTile(
                    title: Text("Sign Up"),
                    leading: Icon(Icons.person_add),
                    onTap: () {
                      push(context, RegisterView(context));
                    },
                  ),
                ],
              )
            : ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  push(context, SettingsView());
                },
              );
      },
    );
  }

  getHeader() {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      child: StreamBuilder(
        stream: rootBloc.user,
        builder: (context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserAccountsDrawerHeader(
                  accountEmail: Text("${snapshot.data.email}"),
                  accountName: Text("${snapshot.data.username}"),
                  otherAccountsPictures: <Widget>[
                    // using for button
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      tooltip: "Logout",
                      onPressed: () {
                        rootBloc.logout().then((_) {
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ],
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${snapshot.data.image.isNotEmpty ? snapshot.data.image : 'https://static.productionready.io/images/smiley-cyrus.jpg'}"),
                    backgroundColor: Colors.grey[800],
                  ),
                  decoration: BoxDecoration(color: RwColors.green[600]),
                )
              : Container();
        },
      ),
    );
  }
}
