import 'package:flutter/material.dart';

import 'comment_bloc.dart';

class CommentForm extends StatelessWidget {
  final CommentBloc _bloc;

  CommentForm(this._bloc);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Container(width: 5),
              CircleAvatar(),
              Container(width: 10),
              Expanded(
                child: Text("Type your comment...", style: TextStyle(color: Colors.grey[800])),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
