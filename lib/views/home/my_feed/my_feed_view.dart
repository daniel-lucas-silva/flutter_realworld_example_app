import 'package:flutter/material.dart';

class MyFeedView extends StatefulWidget {
  @override
  _MyFeedViewState createState() => _MyFeedViewState();
}

class _MyFeedViewState extends State<MyFeedView> with AutomaticKeepAliveClientMixin<MyFeedView> {

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("My Feed"),
      ),
    );
  }
}