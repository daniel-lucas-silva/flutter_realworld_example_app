import 'package:flutter/material.dart';
import 'package:realworld/components/cards.dart';

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
                  return Cards.article();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
