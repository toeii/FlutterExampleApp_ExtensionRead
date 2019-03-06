import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/redux/ERAppState.dart';
import 'package:flutter_extension_read/view/page/BrowseRecordPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'dart:ui';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///我的
class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();

}

class _UserPageState extends State<UserPage> {

  static Size _sizeWH = window.physicalSize;
  static var items = ["项目主页","浏览记录","切换主题","关于作者","注销账号"];

  Widget itemBuilder(BuildContext context,int index) {
    return
      new GestureDetector(
        child: new Container(
          alignment: AlignmentDirectional.center,
          child:_getLvItemChildView(context,index),
        ),
      );
  }

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
                      height: 200,
                      width: _sizeWH.width,
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
        preferredSize: Size.fromHeight(250),
      ),

      body: new EasyListView(
//        headerBuilder: headerBuilder,
        itemCount: items.length,
        itemBuilder: itemBuilder,
      ),

    );
  }



  Widget _getLvItemChildView(BuildContext context,int index) {
    return
      new StoreBuilder<ERAppState>(
        builder: (context, store) {
        return new GestureDetector(
          onTap: () {
            if(items[index] == "项目主页"){
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new WebLoadPage(title:'拓意 Extension',url:'https://github.com/toeii/FlutterExampleApp_ExtensionRead')),
              );
            }else if(items[index] == "浏览记录"){
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new BrowseRecordPage(),)
              );
            }else if(items[index] == "切换主题"){
              showThemeDialog(context, store);
            }else if(items[index] == "关于作者"){
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new WebLoadPage(title:'关于作者',url:'https://github.com/toeii')),
              );
            }else if(items[index] == "注销账号"){
              new DatabaseHelper().cleanNote();

              Fluttertoast.showToast(
                  msg: "清除成功!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
          child:new Container(
              height: 100,
              child: new Center(
                child: new Text(items[index],style: new TextStyle(fontSize: 16,color: Colors.grey),
                ),
              )
          ),
        );
      }
    );

  }

  showThemeDialog(BuildContext context, Store store) {
    List<String> list = [
      "默认主题",
      "主题1",
      "主题2",
      "主题3",
      "主题4",
      "主题5",
      "主题6",
    ];
    ERAppConfig.showCommitOptionDialog(context, list, (index) {
      ERAppConfig.pushTheme(store, index);
    }, colorList: ERAppConfig.getThemeListColor());
  }

}
