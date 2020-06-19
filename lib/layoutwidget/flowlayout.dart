import 'package:flutter/material.dart';

class FlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10.0,
            children: <Widget>[
              Chip(
                backgroundColor: Colors.orange,
                label: Text('Hello'),
                avatar: CircleAvatar(
                  child: Text(
                    'H',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              Chip(
                backgroundColor: Colors.red,
                label: Text('Hello World'),
                avatar: CircleAvatar(
                  child: Text(
                    'HE',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                backgroundColor: Colors.green,
                label: Text('Hello'),
                avatar: CircleAvatar(
                  child: Text(
                    'H',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              Chip(
                backgroundColor: Colors.orange,
                label: Text('Hello Flutter'),
                avatar: CircleAvatar(
                  child: Text(
                    'H',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.purple,
                ),
              ),
            ],
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.yellow,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.teal,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.purple,
              ),   Container(
                width: 80,
                height: 80,
                color: Colors.pink,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 500.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
