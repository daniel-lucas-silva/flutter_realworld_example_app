import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:realworld/models/article.dart';
import 'package:realworld/utils/date.dart';
import 'package:realworld/utils/theme.dart';
import 'package:realworld/views/comment/comment_bloc.dart';
import 'package:realworld/views/comment/comment_form.dart';
import 'package:realworld/views/comment/comments_list.dart';

class ArticleDetail extends StatefulWidget {
  final Article article;

  ArticleDetail(this.article);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  CommentBloc _commentBloc;

  @override
  void initState() {
    _commentBloc = CommentBloc();
    _commentBloc.init();
    _commentBloc.load(widget.article.slug);
    super.initState();
  }

  @override
  void dispose() {
    _commentBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  getAppBar(),
                  getBody(),
                  getCommentsHeader(),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 80),
                    sliver: CommentList(_commentBloc),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommentForm(_commentBloc),
              )
            ],
          ),
        ),
      ],
    );
  }

  getAppBar() {
    final appBarTheme = Theme.of(context).appBarTheme;

    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.grey[900],
      title: Text(widget.article.title),
      expandedHeight: 120,
      pinned: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(widget.article.author.image),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            widget.article.author.username,
                            style: appBarTheme.textTheme.body1,
                          ),
                          onTap: () {},
                        ),
                        Text(
                          "${timeago(widget.article.createdAt)}",
                          style: appBarTheme.textTheme.body2,
                        ),
                      ],
                    ),
                  ),
                  OutlineButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Follow"),
                    textColor: Colors.white,
                    borderSide: BorderSide(color: Colors.white),
                    padding: EdgeInsets.all(0.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getBody() {
    return SliverPadding(
      padding: EdgeInsets.all(15.0),
      sliver: SliverToBoxAdapter(
        child: MarkdownBody(
          data: widget.article.body,
          styleSheet: markdownStyle,
        ),
      ),
    );
  }

  getCommentsHeader() {
    return SliverToBoxAdapter(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey[400],
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          Text("Comments"),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey[400],
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          )
        ],
      ),
    );
  }
}
