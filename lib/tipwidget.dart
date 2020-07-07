import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipWidget extends StatefulWidget {
  @override
  _TipWidgetState createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('TipWidget'),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("I am SnackBar"),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ));
                },
              ),
              RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'AlertDialog',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('弹窗标题'),
                            content: Text("弹窗内容"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop('cancel');
                                  },
                                  child: Text('取消')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop('ok');
                                  },
                                  child: Text('确定')),
                            ],
                          );
                        });
                  }),
              RaisedButton(
                  color: Colors.teal,
                  child: Text(
                    'SimpleDialog',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text('弹窗标题'),
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop('cancel');
                                  },
                                  child: Text('取消')),
                              Divider(
                                height: 1,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop('ok');
                                  },
                                  child: Text('确定')),
                            ],
                          );
                        });
                  }),
              RaisedButton(
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    'CupertinoAlertDialog',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('弹窗标题'),
                            content:Text('CupertinoAlertDialog'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop('cancel');
                                  },
                                  child: Text('取消')),

                              CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop('ok');
                                  },
                                  child: Text('确定')),
                            ],
                          );
                        });
                  }),
            ],
          ),
        ));
  }
}
