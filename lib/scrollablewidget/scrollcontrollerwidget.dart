import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  ScrollController _controller = ScrollController();
  bool showTopBtn = false;
  String _progress = '0%';
  double _linearProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
//      print(_controller.offset);
      if (_controller.offset < 1000 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showTopBtn == false) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动控制'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
//            print('$progress');
            setState(() {
              if (progress >= 1.0) {
                progress = 1.0;
              } else if (progress < 0) {
                progress = 0.0;
              }
              _progress = "${(progress * 100).toInt()}%";
              _linearProgress = progress;
            });
//            print('BottomEdge:${notification.metrics.extentAfter == 0}');
//            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '$index',
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: 100,
                itemExtent: 50,
                controller: _controller,
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Color.fromRGBO(0, 0, 255, 0.5),
              ),
              Positioned(
                height: 5,
                width: MediaQuery.of(context).size.width,
                left: 0,
                top: 0,
                child: LinearProgressIndicator(
                  value: _linearProgress,
                  backgroundColor: Colors.greenAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(microseconds: 200), curve: Curves.ease);
              }),
    );
  }
}
