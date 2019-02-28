import 'package:flutter/material.dart';

class Cards {
  static Card article() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name"),
                        Text("date"),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: null,
                  color: Colors.red,
                  padding: const EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.favorite_border)],
                  ),
                ),
              ],
            ),
            Text("Title"),
            Text("Subitle"),
          ],
        ),
      ),
    );
  }
}
