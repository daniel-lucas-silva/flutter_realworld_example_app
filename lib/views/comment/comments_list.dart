import 'package:flutter/material.dart';
import 'package:realworld/models/comment.dart';

import 'comment_bloc.dart';

class CommentList extends StatelessWidget {
  final CommentBloc _bloc;

  CommentList(this._bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.items,
      builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
        if (snapshot.hasError) return getEmpty();
        print(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return getLoading();
          case ConnectionState.done:
          case ConnectionState.active:
            return snapshot.data.length > 0
                ? getList(snapshot.data)
                : getEmpty();
        }
        return null;
      },
    );
  }

  getList(List<Comment> items) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Text("${items[index].body}");
      }, childCount: items.length),
    );
  }

  getLoading({double size: 20.0}) {
    return SliverToBoxAdapter(
      child: Text("Loading"),
    );
  }

  getEmpty() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("No Comments.", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
