import 'package:flutter/material.dart';
import 'package:realworld/models/comment.dart';

import 'comment_card.dart';
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
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CommentCard(items[index]);
        },
        childCount: items.length,
      ),
    );
  }

  getLoading({double size: 20.0}) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }

  getEmpty() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0, bottom: 70.0),
        child: Center(
          child: Text("No Comments.", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
