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
        primarySwatch: AppConfig.THEME_COLOR,
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

class _MainPageState extends State<MainPage> {

  int _pageIndex = 0;
  List _bodyPages = [];

  @override
  void initState() {
    super.initState();
    _bodyPages
      ..add(new HomePage())
      ..add(new CommunityPage())
      ..add(new UserPage());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
         body:  Stack(
           children: <Widget>[
             new Offstage(
               offstage: _pageIndex!=0,
               child: _bodyPages[0],
             ),
             new Offstage(
               offstage: _pageIndex!=1,
               child: _bodyPages[1],
             ),
             new Offstage(
               offstage: _pageIndex!=2,
               child: _bodyPages[2],
             ),
           ],
         ),
//       body:_bodyPages[_pageIndex],  //TODO 解决BottomNavigationBar导致页面重新绘制的问题
         bottomNavigationBar:
            Container(
              height: 55,
              child: new BottomNavigationBar(
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
              ),
          ),
    );

  }


}

