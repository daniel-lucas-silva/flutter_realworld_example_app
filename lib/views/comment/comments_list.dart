import 'package:flutter/material.dart';

import 'comment_bloc.dart';

class CommentList extends StatelessWidget {

  final CommentBloc _bloc;

  CommentList(this._bloc);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Text("$index");
        }
      ),
    );
  }
}
