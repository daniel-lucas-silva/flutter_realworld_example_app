import 'package:flutter/material.dart';
import 'package:realworld/blocs.dart' show appBloc;

class RwLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: appBloc.loading,
      initialData: false,
      builder: (context, snapshot) {
        return snapshot.data
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    height: 20.0,
                    width: 20.0, 
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}
