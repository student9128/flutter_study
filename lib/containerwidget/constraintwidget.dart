import 'package:flutter/material.dart';

class ConstraintWidget extends StatelessWidget {
  Widget greenBox =
      DecoratedBox(decoration: BoxDecoration(color: Colors.green));
  Widget blueBox = Container(
    margin: EdgeInsets.only(top: 10),
    child: DecoratedBox(
      decoration: BoxDecoration(color: Colors.blue),
    ),
  );
  Widget redBox = Container(
    margin: EdgeInsets.only(top: 10),
    child: DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    ),
  );
  Widget orangeBox = Container(
    width: 150,
    height: 150,
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstraintWidget'),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50,
            ),
            child: greenBox,
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: greenBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 20,
              minWidth: 160,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 60,
              ),
              child: blueBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 20,
              minWidth: 160,
            ),
            child: UnconstrainedBox(
              //'去除'父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 50,
                  minHeight: 60,
                ),
                child: redBox,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 50,
              maxHeight: 50,
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9, //width:height
              child: greenBox,
            ),
          ),
          LimitedBox(
            maxHeight: 45.0,
            maxWidth: 45.0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.pink,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: 20),
            color: Colors.blue[50],
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1.2,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 50,
            ),
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red[100],
              ),
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: Transform(
              transform: Matrix4.skewY(0.3),
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.indigo,
                child: Text('Transform'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //将Transform.rotate换成RotatedBox
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text("Hello world"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 120.0),
            //容器外填充
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            //卡片大小
            decoration: BoxDecoration(
                //背景装饰
                gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),
            //卡片倾斜变换
            alignment: Alignment.center,
            //卡片内文字居中
            child: Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
        ],
      ),
    );
  }
}
