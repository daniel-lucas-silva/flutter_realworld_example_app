import 'package:flutter/material.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/login_dialog.dart';
import 'package:realworld/views/post/post_view.dart';
import 'package:realworld/views/profile/profile_view.dart';
import 'package:realworld/views/root_bloc.dart';
// components
import 'home_drawer.dart';
import 'home_bottom.dart';
// tabs
import 'my_feed/my_feed_view.dart';
import 'global_feed/global_feed_view.dart';

enum HomeState { GLOBAL, MY, PROFILE }

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {

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
      if (logged)
        setState(() {
          isAuthenticated = true;
        });
    });

    if (!isAuthenticated) _tabs.removeAt(1);

    return Scaffold(
      floatingActionButton: StreamBuilder<bool>(
        stream: rootBloc.authenticated,
        initialData: false,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return snapshot.data
              ? FloatingActionButton(
                  onPressed: () {
                    push(context, PostView());
                  },
                  child: Icon(Icons.create),
                  backgroundColor: RwColors.green,
                  mini: true,
                )
              : Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Conduite"),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              if (rootBloc.authenticated.value) {
                push(context, ProfileView());
              } else {
                LoginDialog(context, callback: () {
                  push(context, ProfileView());
                });
              }
            },
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
    return StreamBuilder(
      stream: rootBloc.authenticated,
      initialData: false,
      builder: (context, snapshot) {
        return snapshot.data
            ? HomeBottom(
                onChange: (index) {
                  _tabController.jumpToPage(index);
                  setState(() {
                    _index = index;
                  });
                },
                index: _index,
              )
            : Container();
      },
    );
  }
}
