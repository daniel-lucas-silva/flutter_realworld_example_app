import 'package:flutter/material.dart';
import 'package:realworld/utils/theme.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: SliverAppBar(
        backgroundColor: Color(0xFFf3f3f3),
        pinned: true,
        title: Text(
          "Conduite",
          style: TextStyle(color: RwColors.green),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Positioned(
                bottom: 60,
                left: 10,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Text("dannlks")
                  ],
                ),
              ),
              Positioned(
                bottom: 65,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.settings, size: 14, color: Colors.grey[600]),
                        SizedBox(width: 10),
                        Text("Edit Profile Settings", style: TextStyle(color: Colors.grey[600]),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        expandedHeight: 160.0,
        forceElevated: true,
        elevation: forceElevated ? 2.5 : 0.5,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(top: BorderSide(color: Colors.grey[200]))),
            child: TabBar(
              indicatorColor: RwColors.green,
              labelColor: RwColors.green[700],
              unselectedLabelColor: Colors.grey,
              tabs: _tabs.map((String name) => Tab(text: name)).toList(),
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
                            onTapUp: (_) {},
                            child: Text("article"),
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
