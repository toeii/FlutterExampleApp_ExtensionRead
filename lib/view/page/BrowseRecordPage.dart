import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///浏览记录
class BrowseRecordPage extends StatefulWidget {

  @override
  _BrowseRecordPageState createState() => _BrowseRecordPageState();

}

class _BrowseRecordPageState extends State<BrowseRecordPage> {

  int page = 0;
  int itemCount = 20;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  List<BrowseRecordBean> datas = [];

  @override
  bool get wantKeepAlive => true;

  DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = new DatabaseHelper();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('浏览记录'),
              centerTitle: true,
            ),
            body: new Container(
                color: Colors.white,
                child: RefreshIndicator(
                onRefresh: _refresh,
                  child: EasyListView(
                    itemCount: datas.length,
                    itemBuilder: getItemBuilder,
                    loadMore: hasNextPage,
                    onLoadMore: _requestMoreData,
                    footerBuilder: isLoadData?null:footerBuilder,
                    loadMoreWhenNoData: true,
                    foregroundWidget: isLoadData?foregroundWidget:null,
                  ),
                ),
            )),
        onWillPop:() {
          Navigator.pop(context);
        },
    );

  }

  Future<Null> _refresh() async {
    if (null != datas && datas.length > 0) {
      datas.clear();
    }
    page = 1;
    initData();
    return;
  }

  _requestMoreData() {
//    page++;
//    initData();
    setState(() {
      hasNextPage = false;
    });
  }

  var footerBuilder = (context) => Container(
    height: 30.0,
    alignment: AlignmentDirectional.center,
    child: Text(
      "没有更多了",
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
      ),
    ),
  );


  Future initData() async {
      List Notes;
      await _databaseHelper.getAllNotes().then((value) => {
          Notes = value,
      });

      List<BrowseRecordBean> browseRecordList = [];
      for (var childrenItem in Notes){
        browseRecordList.add(new BrowseRecordBean(
            BrowseRecordBean.fromMap(childrenItem).id,
            BrowseRecordBean.fromMap(childrenItem).pointId,
            BrowseRecordBean.fromMap(childrenItem).title,
            BrowseRecordBean.fromMap(childrenItem).content,
            BrowseRecordBean.fromMap(childrenItem).url,
            BrowseRecordBean.fromMap(childrenItem).image));
      }

      if (null != browseRecordList) {
        if(page>1){
          setState(() {
            hasNextPage = browseRecordList.length > 0;
            datas += browseRecordList;
            isLoadData = false;
          });
        }else{
          setState(() {
            datas = browseRecordList;
            isLoadData = false;
          });
        }
      }
  }


  Widget getItemBuilder(BuildContext context,int index) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new WebLoadPage(title:datas[index].title,url:datas[index].url)),
        );
      },
      child: new Container(
        alignment: AlignmentDirectional.center,
        child: new Container(
          height: 120,
          width: window.physicalSize.width,
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    width: 88,
                    height: 68,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(4.0),
                      image: new DecorationImage(
                          image: new NetworkImage(null!=datas[index].image?datas[index].image:ERAppConfig.DEF_IMAGE_URL),
                          fit: BoxFit.cover),
                    ),
                  ),

                  new Container(
                    height: 90,
                    width: window.physicalSize.width/3.8,
                    margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child:new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new NotEmptyText(null!=datas[index].title?datas[index].title:'未知标题',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                          maxLines:2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new NotEmptyText(null!=datas[index].content?datas[index].content:'...',
                          style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                          ),
                          maxLines:2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              new Divider(),
            ],
          ),
        ),
      ),
    );

  }


}
