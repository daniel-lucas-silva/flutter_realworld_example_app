import 'package:flutter/material.dart';
import 'package:realworld/views/post/post_form.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Your Post"),
      ),
      body: Container(
        child: PostForm(),
      ),
    );
  }
}
