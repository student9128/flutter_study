import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("弹性布局Flex"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 200,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        )),
                    Spacer(flex: 1,),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.greenAccent,
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
