import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons, Colors;

class HomeBottom extends StatefulWidget {

  final Function(int) onChange;
  final int index;
  final bool isAuthenticated;

  HomeBottom({ this.onChange, this.index: 0, this.isAuthenticated: true });
  
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {

  BottomNavigationBarItem _tabItem(String title, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text('$title'),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> tabs = [
      _tabItem('Global Feed', Icon(Icons.public)),
      _tabItem('Your Feed', Icon(Icons.person_add)),
      _tabItem('Profile', Icon(Icons.account_circle)),
    ];

    if(!widget.isAuthenticated) tabs.removeAt(1);

    return MediaQuery.of(context).viewInsets.bottom == 0
        ? Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoTabBar(
              onTap: widget.onChange,
              currentIndex: widget.index,
              backgroundColor: Colors.white30,
              iconSize: 24.0,
              items: tabs,
            ),
          )
        : Align();
  }
}