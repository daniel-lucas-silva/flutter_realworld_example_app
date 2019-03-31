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

class _HomeViewState extends State<HomeView> {

  HomeState _currentState = HomeState.GLOBAL;

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
    switch (_currentState) {
      case HomeState.GLOBAL:
        return GlobalFeedView();
      case HomeState.MY:
        return new MyFeedView();
      case HomeState.PROFILE:
        return ProfileView();
      default:
        throw new StateError('Unexpected action [$_currentState]');
    }
  }

  getBottom() {
    return HomeBottom(
      onChange: (index) {
        setState(() {
          _currentState = HomeState.values[index];
        });
      },
      isAuthenticated: false,
      index: _currentState.index,
    );
  }
}