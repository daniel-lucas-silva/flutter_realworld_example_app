import 'package:flutter/material.dart';
import 'package:realworld/blocs.dart' show authBloc;
import 'package:realworld/models.dart' show User;

class RwDrawer extends StatefulWidget {
  @override
  _RwDrawerState createState() => _RwDrawerState();
}

class _RwDrawerState extends State<RwDrawer> with TickerProviderStateMixin {
  static final Animatable<Offset> _drawerTween = Tween<Offset>(
    begin: Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.fastOutSlowIn));

  AnimationController _controller;
  Animation<double> _drawerOpacity;
  Animation<Offset> _drawerPosition;
  bool _showDrawer = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _drawerOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerPosition = _controller.drive(_drawerTween);
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
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              // User is logged in
              if (snapshot.hasData) return _accountHeader(snapshot.data);
              // Not logged
              return _guestHeader();
            },
          ),
          Stack(
            children: <Widget>[
              FadeTransition(
                opacity: _drawerOpacity,
                child: _menu(),
              ),
              SlideTransition(
                position: _drawerPosition,
                child: FadeTransition(
                  opacity: ReverseAnimation(_drawerOpacity),
                  child: _userOptions(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _accountHeader(User user) {
    return UserAccountsDrawerHeader(
      accountName: Text("${user.username}"),
      accountEmail: Text("${user.email}"),
      onDetailsPressed: () {
        _showDrawer = !_showDrawer;
        if (_showDrawer)
          _controller.reverse();
        else
          _controller.forward();
      },
      decoration: BoxDecoration(color: Colors.grey[800]),
      currentAccountPicture: CircleAvatar(
        backgroundImage: user.image.isNotEmpty ? 
        NetworkImage("${user.image}") :
        AssetImage("images/smiley-cyrus.jpg"),
      ),
    );
  }

  _guestHeader() {
    return DrawerHeader(
      child: RaisedButton(
        onPressed: () {},
        child: Text("Sign In"),
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
          leading: Icon(Icons.person_outline),
          title: Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text('Logout'),
          onTap: () {
            authBloc.logout().then((_) {
              _controller.reverse();
            });
          },
        ),
      ],
    );
  }
}
