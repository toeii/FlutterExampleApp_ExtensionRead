import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/AppConfig.dart';

import 'package:flutter_extension_read/view/page/CommunityPage.dart';
import 'package:flutter_extension_read/view/page/HomePage.dart';
import 'package:flutter_extension_read/view/page/UserPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '拓意 Exidea',
      theme: new ThemeData(
        primarySwatch: AppConfig.themeColor,
      ),
      debugShowCheckedModeBanner: true,
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage>  with TickerProviderStateMixin {

  int _pageIndex = 0;
  HomePage _homePage;
  CommunityPage _communityPage;
  UserPage _userPage;

  @override
  void initState() {
    super.initState();
    _homePage =  new HomePage();
    _communityPage =  new CommunityPage();
    _userPage =  new UserPage();
  }

  @override
  Widget build(BuildContext context) {

    var _bodyPages = [
      _homePage,
      _communityPage,
      _userPage,
    ];

    return Scaffold(
         body: _bodyPages[_pageIndex],
         bottomNavigationBar:
            Container(
              height: 55,
              child: _buildBottomNavigationBar(),
          ),
    );

  }


  BottomNavigationBar _buildBottomNavigationBar() {
    return new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
            icon:new Icon(Icons.home, size: 24.0),title:new Text("首页",style : new TextStyle(fontSize: 10,))
        ),
        new BottomNavigationBarItem(
            icon:new Icon(Icons.group, size: 24.0),title:new Text("社区",style : new TextStyle(fontSize: 10,))
        ),
        new BottomNavigationBarItem(
            icon:new Icon(Icons.person, size: 24.0),title:new Text("我的",style : new TextStyle(fontSize: 10,))
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _pageIndex,
      onTap: (index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }

}

