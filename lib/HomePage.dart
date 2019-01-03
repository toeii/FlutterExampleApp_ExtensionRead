import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

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
        appBar: PreferredSize(
            child: AppBar(
                title:TabBar(
                  tabs: <Tab>[
                    Tab(text: "推荐", ),
                    Tab(text: "日报",),
                    Tab(text: "发现",),
                  ],
                  controller: _tabController,
                  isScrollable: true,
                ),
            ),
            preferredSize: Size.fromHeight(38),
        ),

      body: getTabBarView(<Widget>[
        Recommend(),
        Daily(),
        Find(),
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

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Center(
          child: ListView(
            children: <Widget>[
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
              _getLvItemView(),
            ],
          ),
      ),
    );
  }

  Widget _getLvItemView(){
    return  Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
              "编辑精选",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
          ),
          Text( "", style: new TextStyle(fontSize: 10,)),
          Container(
            width: 600,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                  image: NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                  fit: BoxFit.fill),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin:const EdgeInsets.fromLTRB(0,10,10,10),
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                      fit: BoxFit.fill),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                      "承认吧，人生来就是孤独的",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(
                      "人生学校 #科技",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      )
                  ),
                ],
              ),
            ],
          ),
          _getLvItemChildView(),
          _getLvItemChildView(),
          Divider(),
        ],
      ),
    );
  }

  Widget _getLvItemChildView(){
    return  Row(
      children: <Widget>[
        Container(
          margin:const EdgeInsets.fromLTRB(0,0,10,10),
          width: 170,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            image: DecorationImage(
                image: NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 110,
          width: 150,
          margin:const EdgeInsets.fromLTRB(0,0,0,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  "承认吧，人生来就是孤独的",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  maxLines:4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                  "人生学校 #科技",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                  )
              ),
            ],
          ),
        ),
      ],
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
