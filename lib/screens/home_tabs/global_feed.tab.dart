import 'package:flutter/material.dart';
import 'package:realworld/components.dart';
import 'package:realworld/screens.dart';

class GlobalFeedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            scrollInfo.metrics.axisDirection == AxisDirection.down) {
          print("FIM");
        }
      },
      child: CustomScrollView(
        physics: ScrollPhysics(),
        key: PageStorageKey<String>("global_feed"),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(5.0),
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
          )
        ],
      ),
    );
  }
}
