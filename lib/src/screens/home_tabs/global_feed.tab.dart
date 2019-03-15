import 'package:flutter/material.dart';
import 'package:realworld/components.dart';
import 'package:realworld/models.dart';
import 'package:realworld/screens.dart';
import 'package:realworld/blocs.dart' show ArticlesBloc;

class GlobalFeedTab extends StatefulWidget {
  @override
  _GlobalFeedTabState createState() => _GlobalFeedTabState();
}

class _GlobalFeedTabState extends State<GlobalFeedTab>
    with AutomaticKeepAliveClientMixin<GlobalFeedTab> {
  final ArticlesBloc _bloc = ArticlesBloc("table");

  @override
  void initState() {
    _bloc.load();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            scrollInfo.metrics.axisDirection == AxisDirection.down) {
          print("FIM");
        }
      },
      child: RefreshIndicator(
        onRefresh: _bloc.load,
        child: StreamBuilder(
          stream: _bloc.items,
          initialData: <Article>[],
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasError) return _empty();
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return _loading();
              case ConnectionState.done:
              case ConnectionState.active:
                return _items(snapshot.data);
            }
            return null;
          },
        ),
      ),
    );
  }

  _items(data) {
    return CustomScrollView(
      physics: ScrollPhysics(),
      key: PageStorageKey<String>("global_feed"),
      slivers: <Widget>[
        SliverPadding(
          padding:
              EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 50.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Article article = data[index];

                return GestureDetector(
                  onTapUp: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleScreen(),
                      ),
                    );
                  },
                  child: RwCards.article(
                    title: article.title,
                    description: article.description,
                    author: article.author,
                    favorited: article.favorited,
                    favoritesCount: article.favoritesCount,
                    onOpenProfile: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: data.length,
            ),
          ),
        )
      ],
    );
  }

  _loading({double size: 20.0}) {
    return Center(
      child: Container(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
        ),
      ),
    );
  }

  _empty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("No Records.", textAlign: TextAlign.center),
        IconButton(
          onPressed: _bloc.load,
          icon: Icon(
            Icons.refresh,
            size: 30.0,
            color: Colors.black26,
          ),
        )
      ],
    );
  }
}
