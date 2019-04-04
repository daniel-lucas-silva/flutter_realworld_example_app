import 'package:flutter/material.dart';
import 'package:realworld/utils/theme.dart';

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
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
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
            subtitle: Text("https://github.com/daniel-lucas-silva"),
            dense: true,
          )
        ],
      ),
    );
  }

  getHeader() {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      child: UserAccountsDrawerHeader(
        accountEmail: Text("email@example.com"),
        accountName: Text("username"),
        otherAccountsPictures: <Widget>[
          // using for button
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            tooltip: "Logout",
            onPressed: () {},
          ),
        ],
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.grey[800],
        ),
        decoration: BoxDecoration(color: RwColors.green[600]),
      ),
    );
  }
}
