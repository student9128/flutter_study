import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollView",style: TextStyle(color: Colors.white),),
              background: Image.asset(
                'images/2.0x/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.green[100 * (index % 9)],
                  child: Text('Grid item $index'),
                );
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4.0
              ),
            ),
          ),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[100*(index%9)],
              child: Text('List item $index'),
            );
          },childCount: 50), itemExtent: 50),
        ],
      ),
    );
  }
}
