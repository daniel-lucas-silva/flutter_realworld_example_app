import 'package:flutter/material.dart';
import 'package:realworld/views/login_dialog.dart';

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
              LoginDialog(context);
            },
            child: Row(
              children: <Widget>[
                SizedBox(width: 5),
                CircleAvatar(),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "Write a comment...",
                        filled: false,
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
