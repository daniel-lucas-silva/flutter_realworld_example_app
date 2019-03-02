import 'package:flutter/material.dart';

class Cards {
  static Card article() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black12,
            ))),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 24.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Fulano de tal"),
                        Text(
                          "ha 1 dia",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  label: Text("0"),
                  padding: EdgeInsets.all(0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Title",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Subitle",
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static comment() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Daniel Lucas"),
                    Text("12/12/1222"),
                  ],
                ),
                Text(
                    "teste askjh asdkjh asdkjh asdkjha sdkjah sdkjah sdkjh akshd kajshd kjahs dkah ksdhjaksjh "),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
