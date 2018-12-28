import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TabBarView getTabBarView(var tabs) {
    return  TabBarView(
      children: tabs,
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:TabBar(
          tabs: <Tab>[
             Tab(text: "发现",),
             Tab(text: "推荐", ),
             Tab(text: "日报",),
          ],
          controller: _tabController,
          isScrollable: true,
        ),
      ),

      body: getTabBarView(<Widget>[
        Find(),
        Recommend(),
        Daily(),
      ]),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Toeii'),
              accountEmail: Text('https://github.com/toeii'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
              ),
            ),
            ListTile(),
            AboutListTile(),
          ],
        ),
      ),

    );
  }
  
}

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text("Find Tab")
          ],
        ),
      ),
    );
  }
}

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text("Recommend Tab")
          ],
        ),
      ),
    );
  }
}

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text("Daily Tab")
          ],
        ),
      ),
    );
  }
}
