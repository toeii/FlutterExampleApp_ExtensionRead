import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_extension_read/widget/EasyListView.dart';

class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();

}

class _UserPageState extends State<UserPage> {

  static Size _sizeWH = window.physicalSize;
  static var items = ["个人主页","浏览记录","切换主题","关于作者","注销账号"];

  var headerBuilder = (context) => new Container(
     height: 0,
  );

  var itemBuilder = (context, index) => Container(
    alignment: AlignmentDirectional.center,
    child: _getLvItemChildView(items[index]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        child: new AppBar(
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title:new Container(
                padding:const EdgeInsets.fromLTRB(0,50,0,0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: 220,
                      width: _sizeWH.width,
                      color: Colors.blue,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            width: 90,
                            height: 90,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: new Border.all(color: Color(0xFFCCCCCC), width: 1), // 边色与边宽度
                              boxShadow: [BoxShadow(color: Color(0xFF0F0F0F), offset: Offset(0, 0),    blurRadius: 20.0, spreadRadius: 2.0),],
                              image: new DecorationImage(
                                  image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          new Container(
                            margin:const EdgeInsets.fromLTRB(0,20,0,0),
                            child: new Text("Toeii",style: new TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )
          ),
        ),
        preferredSize: Size.fromHeight(270),
      ),

      body: new EasyListView(
//        headerBuilder: headerBuilder,
        itemCount: items.length,
        itemBuilder: itemBuilder,
      ),

    );
  }





  static Widget _getLvItemChildView(var text) {
    return new Container(
        height: 100,
          child: new Center(
            child: new Text(text,style: new TextStyle(fontSize: 16,color: Colors.grey),
          ),
        )
    );
  }

}
