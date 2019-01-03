import 'package:flutter/material.dart';

import 'package:flutter_extension_read/HomePage.dart';
import 'package:flutter_extension_read/CommunityPage.dart';
import 'package:flutter_extension_read/UserPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '拓意 Exidea',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: true,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int _pageIndex = 0;
  HomePage _homePage;
  CommunityPage _communityPage;
  UserPage _userPage;

  @override
  void initState() {
    super.initState();
    _homePage =  HomePage();
    _communityPage =  CommunityPage();
    _userPage =  UserPage();
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
          height: 54,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon:Icon(Icons.home, size: 24.0),title:Text("首页",style : TextStyle(fontSize: 10,))
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.group, size: 24.0),title:Text("社区",style : TextStyle(fontSize: 10,))
              ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.person, size: 24.0),title:Text("我的",style : TextStyle(fontSize: 10,))
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _pageIndex,
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
        ),
      ),

    );


  }



}
