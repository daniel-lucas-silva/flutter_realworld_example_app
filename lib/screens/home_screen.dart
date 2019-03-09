import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realworld/components/home_drawer.dart';
import 'package:realworld/components.dart';
import 'package:realworld/screens/home_tabs/global_feed_tab.dart';
import 'package:realworld/screens/home_tabs/profile_tab.dart';
import 'package:realworld/screens/home_tabs/your_feed_tab.dart';

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
    _pageController = PageController();
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
      appBar: RwAppBar(),
      drawer: HomeDrawer(),
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              pageSnapping: true,
              onPageChanged: _onPageChanged,
              children: <Widget>[
                GlobalFeedTab(),
                YourFeedTab(),
                ProfileTab(),
              ],
            ),
            _tabBar()
          ],
        ),
      ),
    );
  }

  Align _tabBar() {
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
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.public),
                  title: Text('Global Feed'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_add),
                  title: Text('Your Feed'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
              ],
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
