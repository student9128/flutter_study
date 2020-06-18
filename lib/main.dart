import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/layoutwidget/flexlayout.dart';
import 'package:flutterstudy/layoutwidget/linearlayout.dart';
import 'package:flutterstudy/mytest/newroute.dart';
import 'package:flutterstudy/mytest/state_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MainContainer(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
              textColor: Colors.blue,
              child: Text('open new route'),
            ),
            FlatButton(
              child: Text("data"),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return StateManager();
                }));
              },
              textColor: Colors.green,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MainContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainContainerState();
  }
}

class _MainContainerState extends State<MainContainer> {
//  List<Color> colorList = [];

  @override
  void initState() {
    super.initState();
    print("initState");
  }

@override
  void didUpdateWidget(MainContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  var _colorList = [
    Colors.blue,
    Colors.blue[300],
    Colors.teal,
    Colors.teal[700],
    Colors.amber,
    Colors.cyan,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.brown,
    Colors.purple
  ];

  int getRandomColor() {
    var r = Random().nextInt(_colorList.length);
    print("r=$r");
    return r;
  }

  ///跳转路径
  ///routeName是路径名
  goPage(Widget routeName) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter学习'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            spacing: 10.0,
            runSpacing: 0,
            children: <Widget>[
              RaisedButton(
                color: _colorList[getRandomColor()],
                onPressed: () {
                  goPage(LinearLayout());
                },
                child: Text(
                  '线性布局',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: _colorList[getRandomColor()],
                onPressed: () {
                  goPage(FlexLayout());
                },
                child: Text(
                  '弹性布局',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: _colorList[getRandomColor()],
                onPressed: () {
                  getRandomColor();
                },
                child: Text(
                  '流式布局',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: _colorList[getRandomColor()],
                onPressed: () {
                  getRandomColor();
                },
                child: Text(
                  '层叠布局',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: _colorList[getRandomColor()],
                onPressed: () {
                  getRandomColor();
                },
                child: Text(
                  '对齐与相对定位',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
