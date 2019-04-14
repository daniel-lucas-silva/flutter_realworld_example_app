import 'package:flutter/material.dart';
import 'package:realworld/views/article/articles_view.dart';

import 'profile_bloc.dart';

class MyArticles extends StatefulWidget {
  @override
  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> with AutomaticKeepAliveClientMixin<MyArticles> {

  @override
  void initState() {
    profileBloc.fetchMyArticles();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: profileBloc.myArticles,
      initialData: <Article> [],
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        return ArticlesView(
          snapshot.data,
          pageKey: "my_articles",
          overlapInjector: SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
        );
      },
    );
  }
}
