import 'package:flutter/material.dart';
import 'package:realworld/components/cards.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              Theme(
                data: theme.copyWith(
                  primaryColor: Colors.black87,
                  brightness: Brightness.dark,
                  textTheme: TextTheme(
                    title: TextStyle(color: Colors.white),
                  ),
                ),
                child: SliverAppBar(
                  title: Text("This is a test"),
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
                              CircleAvatar(),
                              VerticalDivider(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Alejandro Sans"),
                                    Text("February 28, 2019"),
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
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(15.0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                    style: TextStyle(
                      color: Colors.black54,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Divider(height: 25.0),
                    Text("Comments"),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(),
                      VerticalDivider(),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Type a comment",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Cards.comment(),
                    );
                  },
                  childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
