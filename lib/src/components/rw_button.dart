import 'package:flutter/material.dart';

class RwButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color background;
  final Function onPressed;
  final Border border;
  final EdgeInsets padding;
  final bool loading;

  RwButton({
    @required this.title,
    @required this.onPressed,
    this.color,
    this.background,
    this.padding,
    this.border,
    this.loading: false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(3.0),
      child: Ink(
        decoration: BoxDecoration(
          color: background ?? Color(0xFF5cb85c),
          border: border,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: InkWell(
          onTap: !loading ? onPressed : null,
          child: Padding(
            padding: padding ?? EdgeInsets.all(15.0),
            child: Container(
              height: 20.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$title",
                      style: TextStyle(color: color ?? Colors.white),
                    ),
                  ),
                  loading
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static favorite({count, onPressed, loading, favorited}) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: InkWell(
        onTap: !loading ? onPressed : null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 7.0),
          child: Container(
            height: 20.0,
            child: Row(
              children: <Widget>[
                Container(
                  height: 20.0,
                  width: 20.0,
                  child: loading
                      ? Container(
                          padding: EdgeInsets.all(2.5),
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: 20.0,
                          color: Colors.green,
                        ),
                ),
                Container(width: 2),
                Text(
                  "$count",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
