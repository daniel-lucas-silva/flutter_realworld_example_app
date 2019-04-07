import 'package:flutter/material.dart';
import 'package:realworld/views/login_dialog.dart';
import 'package:realworld/views/root_bloc.dart';

import 'comment_bloc.dart';

class CommentForm extends StatefulWidget {
  final CommentBloc _bloc;

  CommentForm(this._bloc);

  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  FocusNode _focus;

  @override
  void initState() {
    _focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

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
                SizedBox(width: 5),
                CircleAvatar(),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onTap: () {
                      if(!rootBloc.authenticated.value){
                        FocusScope.of(context).detach();
                        LoginDialog(context);
                      }
                    },
                    keyboardType: TextInputType.text,
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}