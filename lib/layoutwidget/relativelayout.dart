import 'package:flutter/material.dart';

class RelativeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('对齐与相对定位'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
//              height: 120,
//              width: 120,
              color: Colors.red[50],
              child: Align(
                widthFactor: 3,
                heightFactor: 3,
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                  colors: Colors.red,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.green[50],
              child: Align(
                alignment: Alignment(2, 0), //调试Alignment
                child: FlutterLogo(
                  size: 60,
                  colors: Colors.green,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.orange[50],
              child: Align(
                alignment: FractionalOffset(1.2, -0.2), //调试FractionalOffset
                child: FlutterLogo(
                  size: 60,
                  colors: Colors.orange,
                ),
              ),
            ),
          ],
        ));
  }
}
