import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(0.0),
            sliver: SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
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
