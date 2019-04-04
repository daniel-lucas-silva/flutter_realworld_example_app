import 'package:flutter/material.dart';
import 'package:realworld/views/root_bloc.dart';
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
  bool isAuthenticated = false;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabController = PageController(keepPage: true);
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {

    _tabs = [
      GlobalFeedView(),
      MyFeedView(),
    ];

    rootBloc.authenticated.listen((logged) {
      if(logged) setState(() {
        isAuthenticated = true;
      });
    });

    if(!isAuthenticated) _tabs.removeAt(1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Conduite"),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
        ],
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
      index: _index,
    );
  }
}