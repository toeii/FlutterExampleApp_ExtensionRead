import 'package:flutter/material.dart';
import 'package:flutter_extension_read/view/page/HomeDailyPage.dart';
import 'package:flutter_extension_read/view/page/HomeRecommendPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TabBarView getTabBarView(var tabs) {
    return  new TabBarView(
      children: tabs,
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new PreferredSize(
            child: new AppBar(
                title:new TabBar(
                  tabs: <Tab>[
                    new Tab(text: "推荐", ),
                    new Tab(text: "日报",),
                  ],
                  controller: _tabController,
                  isScrollable: true,
                ),
            ),
            preferredSize: Size.fromHeight(38),
        ),

      body: getTabBarView(<Widget>[
        new HomeRecommendPage(),
        new HomeDailyPage(),
      ]),


      drawer: new Container(
        width: 240,
        child: new Drawer(
          child: new ListView(
            padding: const EdgeInsets.only(),
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('Toeii'),
                accountEmail: new Text('https://github.com/toeii'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                ),
              ),
              new ListTile(leading: Icon(Icons.work),title: Text('个人主页'),),
              new ListTile(leading: Icon(Icons.visibility),title: Text('浏览记录'),),
              new ListTile(leading: Icon(Icons.build),title: Text('切换主题'),),
              new ListTile(leading: Icon(Icons.email),title: Text('关于作者'),),
              new ListTile(leading: Icon(Icons.swap_vertical_circle),title: Text('注销账号'),),
//              new AboutListTile(),
            ],
          ),
        ),
      ),

    );
  }

}







