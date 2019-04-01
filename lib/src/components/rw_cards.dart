import 'package:flutter/material.dart';
import 'package:realworld/components.dart';
import 'package:realworld/models.dart';

class RwCards {
  static Card article(
      {onOpenProfile,
      String title,
      String description,
      Author author,
      bool favorited,
      int favoritesCount}) {
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
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTapUp: onOpenProfile,
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage("${author?.image ?? ""}"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(author.username),
                        Text(
                          "ha 1 dia",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                RwButton.favorite(
                  count: favoritesCount,
                  favorited: favorited,
                  onPressed: () {},
                  loading: false,
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
                  title,
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  description,
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
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('images/smiley-cyrus.jpg'),
            ),
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
