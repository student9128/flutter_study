import 'package:flutter/material.dart';

class NavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavWidgetState();
  }
}

class _NavWidgetState extends State<NavWidget>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 0;

//  TabController _tabController;
//  List tabs = ['新闻', '历史', '图片'];
  List bodyList = [HomePage(), BusinessPage()];

//
//  @override
//  void initState() {
//    super.initState();
//    _tabController = TabController(length: tabs.length, vsync: this);
//    _tabController.addListener(() {
//      switch (_tabController.index) {
//        case 0:
//          break;
//        case 1:
//          break;
//        case 2:
//          break;
//      }
//    });
//  }

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Flutter'),
//        leading: Builder(
//          builder: (context) {
//            return IconButton(
//              icon: Icon(
//                Icons.menu,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                Scaffold.of(context).openDrawer();
//              },
//            );
//          },
//        ),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.share), onPressed: () {})
//        ],
//        bottom: TabBar(
//            controller: _tabController,
//            tabs: tabs
//                .map((e) => Tab(
//                      text: e,
//                    ))
//                .toList()),
//      ),
//      drawer: DrawerLayout(),
      body: bodyList[_selectIndex],
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text('School')),
//        ],
//        currentIndex: _selectIndex,
//        fixedColor: Colors.red,
//        onTap: _onItemTap,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  _onItemTap(0);
                }),
            SizedBox(), //中间位置空出
            IconButton(
                icon: Icon(Icons.business),
                onPressed: () {
                  _onItemTap(1);
                }),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.red,
              padding: EdgeInsets.only(top: 38, bottom: 20),
              height: 200.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset(
                        'images/2.0x/avatar.png',
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    'Kevin',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];
  Widget _tab;
  List<Widget> _widgetList=List();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print('index=${_tabController.index}');
    });
    _tab = TabBar(
      indicatorColor: Colors.blue,
      tabs: tabs
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
    );
    _widgetList.add(_tab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: TabBar(
          indicator:
              BoxDecoration(color: Colors.red[900], shape: BoxShape.circle),
          controller: _tabController,
          unselectedLabelColor: Color.fromRGBO(250, 235, 215, 0.8),
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: DrawerLayout(),
      body: TabBarView(
          controller: _tabController,
          children: tabs
              .map((e) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      textScaleFactor: 3,
                    ),
                  ))
              .toList()),
    );

//    return Scaffold(
//      appBar: AppBar(
//        leading: Builder(
//          builder: (context) {
//            return IconButton(
//              icon: Icon(
//                Icons.menu,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                Scaffold.of(context).openDrawer();
//              },
//            );
//          },
//        ),
//        title: TabBar(
//          controller: _tabController,
//          tabs: tabs.map((e) => Tab(text: e)).toList(),
//        ),
//      ),
//      drawer: DrawerLayout(),
//      body: TabBarView(
//          controller: _tabController,
//          children: tabs
//              .map((e) => Container(
//                    alignment: Alignment.center,
//                    child: Text(
//                      e,
//                      textScaleFactor: 3,
//                    ),
//                  ))
//              .toList()),
//    );
  }
}

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Business Tab'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Business',
          textScaleFactor: 3,
        ),
      ),
    );
  }
}
