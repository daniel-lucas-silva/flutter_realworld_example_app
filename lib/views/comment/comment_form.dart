import 'package:flutter/material.dart';

import 'comment_bloc.dart';

class CommentForm extends StatelessWidget {
  final CommentBloc _bloc;

  CommentForm(this._bloc);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {

              },
              child: Row(
                children: <Widget>[
                  Container(width: 5),
                  CircleAvatar(),
                  Container(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      filled: false,
                      border: InputBorder.none
                    ),
                  ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      
                    },
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
