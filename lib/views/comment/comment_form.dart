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
  TextEditingController _commentController;

  @override
  void initState() {
    _focus = FocusNode();
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  _send() async {
    await widget._bloc.create().then((_) {
      _commentController.clear();
      FocusScope.of(context).detach();
      widget._bloc.load();
    });
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
            onTap: () {},
            child: Row(
              children: <Widget>[
                SizedBox(width: 5),
                StreamBuilder<User>(
                  stream: rootBloc.user,
                  initialData: User(),
                  builder: (context, AsyncSnapshot<User> snapshot) {

                    return CircleAvatar(
                      backgroundImage: NetworkImage("${snapshot.data.image}"),
                    );
                  }
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StreamBuilder<Object>(
                      stream: widget._bloc.comment,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: widget._bloc.changeComment,
                          controller: _commentController,
                          onTap: () {
                            if (!rootBloc.authenticated.value) {
                              FocusScope.of(context).detach();
                              LoginDialog(context);
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Write a comment...",
                            filled: false,
                            border: InputBorder.none,
                          ),
                        );
                      }),
                ),
                StreamBuilder<bool>(
                  stream: widget._bloc.sending,
                  initialData: false,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    return IconButton(
                      icon: snapshot.data
                          ? CircularProgressIndicator()
                          : Icon(Icons.send),
                      onPressed: _send,
                    );
                  },
                ),
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
