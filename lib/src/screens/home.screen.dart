import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realworld/components.dart';
import 'package:realworld/blocs.dart' show authBloc;
import 'package:realworld/src/screens/home_tabs/home_tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _index;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
    _index = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RwAppBar(
        actions: <Widget>[RwLoading()],
      ),
      drawer: RwDrawer(),
      body: StreamBuilder(
        stream: authBloc.loggedIn,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return DefaultTabController(
            length: snapshot.data ? 3 : 2,
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: _pageController,
                  pageSnapping: true,
                  onPageChanged: _onPageChanged,
                  children: snapshot.data
                      ? [
                          GlobalFeedTab(),
                          YourFeedTab(),
                          ProfileTab(),
                        ]
                      : [
                          GlobalFeedTab(),
                          ProfileTab(),
                        ],
                ),
                _tabBar(snapshot.data)
              ],
            ),
          );
        },
      ),
    );
  }

  Align _tabBar(loggedIn) {
    BottomNavigationBarItem global = BottomNavigationBarItem(
      icon: Icon(Icons.public),
      title: Text('Global Feed'),
    );

    BottomNavigationBarItem my = BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      title: Text('Your Feed'),
    );

    BottomNavigationBarItem profile = BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Profile'),
    );

    return MediaQuery.of(context).viewInsets.bottom == 0
        ? Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoTabBar(
              onTap: _onTap,
              currentIndex: _index,
              backgroundColor: Colors.white54,
              inactiveColor: Colors.black54,
              activeColor: Colors.lightGreen[700],
              iconSize: 24.0,
              items: loggedIn ? [global, my, profile] : [global, profile],
            ),
          )
        : Align();
  }

  void _onTap(int tab) {
    _pageController.jumpToPage(tab);
  }

  void _onPageChanged(int tab) {
    setState(() {
      this._index = tab;
    });
  }
}
