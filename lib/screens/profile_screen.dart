import 'package:flutter/material.dart';
import 'package:realworld/components.dart';
import 'package:realworld/screens/article_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> _tabs = ["My Articles", "Favorited Articles"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildAppBar(context, innerBoxIsScrolled),
            ];
          },
          body: _buildTabView(context),
        ),
      ),
    );
  }

  _buildAppBar(context, forceElevated) {
    return Theme(
      data: RwTheme.light(context),
      child: SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        child: SliverAppBar(
          pinned: true,
          title: Text(
            "Conduite",
            style:
                TextStyle(fontFamily: "Titillium", fontWeight: FontWeight.w700),
          ),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  RwDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Username"),
                      Text("since 1992")
                    ],
                  )
                ],
              ),
            ),
          ),
          expandedHeight: 190.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {},
              label: Text("Follow"),
              icon: Icon(Icons.add),
            )
          ],
          forceElevated: true,
          elevation: forceElevated ? 2.5 : 0.5,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[200])
                )
              ),
              child: TabBar(
                tabs: _tabs.map((String name) => Tab(text: name)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTabView(context) {
    return TabBarView(
      children: _tabs.map((String name) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
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
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
