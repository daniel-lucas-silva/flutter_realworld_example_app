import 'package:flutter/material.dart';

import 'comment_bloc.dart';

class CommentForm extends StatelessWidget {
  final CommentBloc _bloc;

  CommentForm(this._bloc);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter();
  }
}
