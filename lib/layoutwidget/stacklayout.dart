import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StackLayout'),
      ),
      body: ConstrainedBox(
      constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,//扩展撑满屏幕
          children: <Widget>[
            Container(
              child: Text('Hello',style: TextStyle(color: Colors.white),),
              color: Colors.blue,
            ),
            Positioned(child: Text('Hello'),
            left: 10,),
            Positioned(
              child: Text('OK'),
              top: 10,
            ),
          ],
        ),
      ),
    );
  }
}
