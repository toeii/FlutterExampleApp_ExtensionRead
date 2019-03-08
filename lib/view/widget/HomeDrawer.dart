import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/redux/ERAppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/view/page/BrowseRecordPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

/**
 * Created by toeii
 * Date: 2019-01-16
 */
///首页侧边栏
class HomeDrawer extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new StoreBuilder<ERAppState>(
        builder: (context, store) {
          return new Container(
            width: 240,
            child:new Drawer(
              child: new ListView(
                padding: const EdgeInsets.only(),
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text('拓意阅读 v1.0'),
                    accountEmail: new Text('本项目仅供学习与参考'),
                    currentAccountPicture: new CircleAvatar(
                      backgroundImage:new AssetImage("images/logo_extension_read.png"),
                    ),
                  ),
                  new ListTile(leading: Icon(Icons.work),title: Text('项目主页'),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new WebLoadPage(title:'拓意阅读',url:'https://github.com/toeii/FlutterExampleApp_ExtensionRead')),
                        );
                      }
                  ),
                  new ListTile(leading: Icon(Icons.visibility),title: Text('浏览记录'),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => new BrowseRecordPage(),)
                        );
                      }
                  ),
                  new ListTile(leading: Icon(Icons.build),title: Text('切换主题'),
                      onTap: () {
                        showThemeDialog(context, store);
                      }),
                  new ListTile(leading: Icon(Icons.email),title: Text('关于作者'),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new WebLoadPage(title:'关于作者',url:'https://github.com/toeii')),
                        );
                      }),
                  new ListTile(leading: Icon(Icons.swap_vertical_circle),title: Text('清除缓存'),
                      onTap: () {
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
                  ),
//              new AboutListTile(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}