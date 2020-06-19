import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
//          leading: IconButton(
//              icon: Icon(Icons.arrow_back),
//              onPressed: () {
//                Navigator.pop(context);
//              }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Column",
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.only(bottom: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5'),
                  Text('6'),
                ],
              ),
            ),
            Text(
              'Row',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24.0,
              ),
            ),
            Container(
                color: Colors.orange,
                child: Row(
                  children: <Widget>[
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                    Text('5'),
                    Text('6'),
                  ],
                )),
          ],
        ));
  }
}
