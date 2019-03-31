import 'package:flutter/material.dart';
import 'package:realworld/models/article.dart';
import 'package:realworld/utils/navigate.dart';
import 'package:realworld/views/author/author_view.dart';

import 'article_detail.dart';
import 'articles_card.dart';

class ArticlesView extends StatelessWidget {

  final List<Article> _items;

  ArticlesView(this._items);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ArticleCard(
                  onAuthorPressed: (){
                    push(context, AuthorView(_items[index].author));
                  },
                  onCardPressed: (){
                    push(context, ArticleDetail(_items[index]));
                  },
                  onFavoritePressed: (){
                    print("Favorite Pressed");
                  },
                  onFavoriteLoading: false,
                  article: _items[index],
                );
              },
              childCount: _items.length,
            ),
          )
      ],
    );
  }
}