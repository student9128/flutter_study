import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            _words.insertAll(
                _words.length - 1,
                generateWordPairs()
                    .take(20)
                    .map((e) => e.asPascalCase)
                    .toList());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewWidget'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Title',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (_words[index] == loadingTag) {
                      if (_words.length - 1 < 100) {
                        _retrieveData();
                        return Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      }else {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          child: Text(
                            '没有更多了',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    return ListTile(
                      title: Text(_words[index]),
                    );
                  },
                  separatorBuilder: (context, index)=>Divider(height: 1,),
                  itemCount: _words.length))
        ],
      ),
    );
  }
}
