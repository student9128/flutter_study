import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollViewWidget'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str
                  .split('')
                  .map((e) => Text(
                        e,
                        textScaleFactor: 2,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
