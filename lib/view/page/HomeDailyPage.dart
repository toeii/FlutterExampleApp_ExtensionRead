import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomeDailyPage extends StatefulWidget {

  @override
  _HomeDailyPageState createState() => _HomeDailyPageState();

}

class _HomeDailyPageState extends State<HomeDailyPage> {

  Size _sizeWH = window.physicalSize;

  @override
  Widget build(BuildContext context) {
    return  new Container(
      child:  new Center(
        child: RefreshIndicator(
          onRefresh: _refresh,
            child: new ListView(
              children: <Widget>[
                _getLvItemView(),
              ],
            ),
          ),
      ),
    );
  }


  Future<Null> _refresh() async {
      Timer(Duration(milliseconds: 2000),() => setState(() {
  //            _dataList.clear();
        }),
      );
  //    await _loadFirstListData();
    return ;
  }

  Widget _getLvItemView(){
    return  new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Text(
              "今日精选",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )
          ),
          new Text( "", style: new TextStyle(fontSize: 10,)),
          _getLvItemChildView(),
          _getLvItemChildView(),
          _getLvItemChildView(),
          _getLvItemChildView(),
          _getLvItemChildView(),
          new Divider(),
        ],
      ),
    );
  }

  Widget _getLvItemChildView() {
    return new Column(
      children: <Widget>[
        new Container(
          width: _sizeWH.width,
          height: 200,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(4.0),
            image: new DecorationImage(
                image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                fit: BoxFit.fill),
          ),
        ),
        new Row(
          children: <Widget>[
            new Container(
              margin:const EdgeInsets.fromLTRB(0,10,10,10),
              width: 46,
              height: 46,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                    fit: BoxFit.fill),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(
                    "承认吧，人生学校人生学校",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                ),
                new Text(
                    "人生学校 #科技",
                    style: new TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                    )
                ),
              ],
            ),
          ],
        ),
      ],
    );


  }


}