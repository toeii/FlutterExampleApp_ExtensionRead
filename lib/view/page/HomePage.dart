import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/view/page/BrowseRecordPage.dart';
import 'package:flutter_extension_read/view/page/HomeDailyPage.dart';
import 'package:flutter_extension_read/view/page/HomeRecommendPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/HomeDrawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///首页
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = new DatabaseHelper();
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


      drawer: new HomeDrawer(),

    );
  }


}







