import 'package:flutter/material.dart';
// components
import 'home_drawer.dart';
import 'home_bottom.dart';
// tabs
import 'my_feed/my_feed_view.dart';
import 'profile/profile_view.dart';
import 'global_feed/global_feed_view.dart';

enum HomeState { GLOBAL, MY, PROFILE }

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  

  PageController _tabController;
  int _index;
  bool isAuthenticated = true;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      GlobalFeedView(),
      MyFeedView(),
      ProfileView(key: _scaffoldKey),
    ];
    _tabController = PageController(keepPage: true);
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conduite"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      drawer: HomeDrawer(),
      body: Stack(
        children: <Widget>[
          getBody(),
          getBottom(),
        ],
      ),
    );
  }

  getBody() {

    return PageView(
        children: _tabs,
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
      );
  }

  getBottom() {
    return HomeBottom(
      onChange: (index) {
        _tabController.jumpToPage(index);
        setState(() {
          _index = index;
        });
      },
      isAuthenticated: isAuthenticated,
      index: _index,
    );
  }
}