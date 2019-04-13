import 'package:flutter/material.dart';

class FavoriteArticles extends StatefulWidget {
  @override
  _FavoriteArticlesState createState() => _FavoriteArticlesState();
}

class _FavoriteArticlesState extends State<FavoriteArticles> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: PageStorageKey<String>("favorite_articles"),
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTapUp: (_) {},
                  child: Text("article"),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
