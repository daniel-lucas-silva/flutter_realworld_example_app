import 'package:flutter/material.dart';

import 'profile_bloc.dart';

class MyArticles extends StatefulWidget {
  @override
  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {

  List<Article> _items = [];

  @override
  void initState() {
    profileBloc.myArticles.listen((List<Article> articles) {
      setState(() {
        _items.addAll(articles);
      });
    });
    profileBloc.fetchMyArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: PageStorageKey<String>("my_articles"),
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return GestureDetector(
                  onTapUp: (_) {},
                  child: Text("${_items[index].title}"),
                );
              },
              childCount: _items.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: StreamBuilder<Object>(
            stream: profileBloc.loading,
            initialData: false,
            builder: (context, snapshot) {
              return snapshot.data ?
                Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ) :
                Container();
            }
          ),
        )
      ],
    );
  }
}
