import 'package:flutter/material.dart';
import 'package:realworld/views/article/articles_view.dart';

import 'profile_bloc.dart';

class FavoriteArticles extends StatefulWidget {
  @override
  _FavoriteArticlesState createState() => _FavoriteArticlesState();
}

class _FavoriteArticlesState extends State<FavoriteArticles> with AutomaticKeepAliveClientMixin<FavoriteArticles> {

  @override
  void initState() {
    profileBloc.fetchFavoriteArticles();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: profileBloc.favoriteArticles,
      initialData: <Article> [],
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        return ArticlesView(
          snapshot.data,
          pageKey: "favorite_articles",
          overlapInjector: SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
        );
      },
    );
  }
}
