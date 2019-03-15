import 'package:flutter/material.dart';
import 'package:realworld/blocs.dart' show authBloc;
import 'package:realworld/models.dart';

class RwDrawer extends StatefulWidget {
  @override
  _RwDrawerState createState() => _RwDrawerState();
}

class _RwDrawerState extends State<RwDrawer> with TickerProviderStateMixin {
  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.fastOutSlowIn));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          StreamBuilder(
            stream: authBloc.user,
            // initialData: User(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData)
                return UserAccountsDrawerHeader(
                  accountName: Text("${snapshot.data.username}"),
                  accountEmail: Text("${snapshot.data.email}"),
                  onDetailsPressed: () {
                    _showDrawerContents = !_showDrawerContents;
                    if (_showDrawerContents)
                      _controller.reverse();
                    else
                      _controller.forward();
                  },
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${snapshot.data.image.isNotEmpty ? snapshot.data.image : 'https://static.productionready.io/images/smiley-cyrus.jpg'}"),
                  ),
                );

              return DrawerHeader(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Sign In"),
                ),
              );
            },
          ),
          Stack(
            children: <Widget>[
              FadeTransition(
                opacity: _drawerContentsOpacity,
                child: _menu(),
              ),
              SlideTransition(
                position: _drawerDetailsPosition,
                child: FadeTransition(
                  opacity: ReverseAnimation(_drawerContentsOpacity),
                  child: _userOptions(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _menu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text('Tags'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.code),
          title: Text('Github'),
          onTap: () {},
        )
      ],
    );
  }

  _userOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.power_settings_new),
          title: const Text('Logout'),
          onTap: () {},
        ),
      ],
    );
  }
}
