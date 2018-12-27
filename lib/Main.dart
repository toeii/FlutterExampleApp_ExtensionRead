import 'package:flutter/material.dart';

import 'package:flutter_extension_read/HomePage.dart';
import 'package:flutter_extension_read/ClassifyPage.dart';
import 'package:flutter_extension_read/UserPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '拓意阅读',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(title: '拓意阅读'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    HomePage _homePage = new HomePage();
    ClassifyPage _classifyPage = new ClassifyPage();
    UserPage _userPage = new UserPage();

    var _bodyPages = [
      _homePage,
      _classifyPage,
      _userPage,
    ];

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: _bodyPages[_pageIndex],

      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(Icons.home, size: 26.0),title:Text("首页")
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.apps, size: 26.0),title:Text("分类")
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.person, size: 26.0),title:Text("我的")
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

    );


  }



}
