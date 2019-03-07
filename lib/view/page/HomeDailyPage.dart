import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/model/HomeDailyBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
import 'package:flutter_extension_read/view/page/PaperDetailPage.dart';
import 'package:flutter_extension_read/view/page/PersonalPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///日报
class HomeDailyPage extends StatefulWidget {

  @override
  _HomeDailyPageState createState() => _HomeDailyPageState();

}

class _HomeDailyPageState extends State<HomeDailyPage> with AutomaticKeepAliveClientMixin{

  Size _sizeWH = window.physicalSize;

  int page = 0;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  List<ItemList> datas = [];

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
    return new Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: EasyListView(
          itemCount: datas.length,
          itemBuilder: getLvItemView,
          loadMore: hasNextPage,
          onLoadMore: _requestMoreData,
          footerBuilder: isLoadData?null:footerBuilder,
          foregroundWidget: isLoadData?foregroundWidget:null,
        ),
      ),
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


  void initData(){
    String requestUrl = ERAppConfig.BASE_URL_V5 + "/index/tab/feed?udid=55b862f0d6714f609bd6e45947f8789f0ff90f48&date="+new DateTime.now().millisecondsSinceEpoch.toString()+"&num="+page.toString();
    AppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        HomeDailyBean homeDailyBean = HomeDailyBean.fromJson(data);
        if (null != homeDailyBean) {
          if(page>1){
            setState(() {
              hasNextPage = homeDailyBean.itemList.length > 0;
              datas += homeDailyBean.itemList;
              isLoadData = false;
            });
          }else{
            setState(() {
              datas = homeDailyBean.itemList;
              isLoadData = false;
            });
          }
        }
      }
    });
  }

  Widget getLvItemView(BuildContext context,int index) {
    if(datas.length==0)return null;

    if(null != datas[index].data && datas[index].data.dataType == "FollowCard"){
      return new Container(
        alignment: AlignmentDirectional.center,
        margin:const EdgeInsets.fromLTRB(10,10,10,0),
        width: _sizeWH.width,
        child:new Column(
          children: <Widget>[

        new GestureDetector(
            onTap: () {
                if(null != datas[index].data.content.data.author){
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new PersonalPage(id:datas[index].data.content.data.author.id)),
                    );
                }
              },
            child:new Row(
                children: <Widget>[
                  new Container(
                    margin:const EdgeInsets.fromLTRB(0,0,10,10),
                    width: 56,
                    height: 56,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(null!=datas[index].data.content.data.author?datas[index].data.content.data.author.icon:ERAppConfig.DEF_IMAGE_URL),
                          fit: BoxFit.cover),
                    ),
                  ),
                  new Container(
                    width: _sizeWH.width/3.5,
                    height: 70,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          height: 5,
                        ),
                        new NotEmptyText(
                            null!=datas[index].data.content.data.author?datas[index].data.content.data.author.name:"用户10000",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        new NotEmptyText(
                           "发布："+(null!=datas[index].data.content.data.title?datas[index].data.content.data.title:""),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            )
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),

            new GestureDetector(
              onTap: () {

                _databaseHelper.saveNote(new BrowseRecordBean(datas[index].data.content.data.id,datas[index].data.content.data.id.toString(),datas[index].data.content.data.title,datas[index].data.content.data.description,datas[index].data.content.data.webUrl.raw,datas[index].data.content.data.cover.feed));

                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new PaperDetailPage(
                    id:datas[index].data.content.data.id.toString(),
                    playUrl:datas[index].data.content.data.playUrl,
                    title:datas[index].data.content.data.title,
                    type:"#"+datas[index].data.content.data.category,
                    desc:datas[index].data.content.data.description,
                    authorId:datas[index].data.content.data.id.toString(),
                    authorIcon:datas[index].data.content.data.author.icon,
                    authorName:datas[index].data.content.data.author.name,
                    authorDesc:datas[index].data.content.data.author.description,
                  )),
                );

              },
              child: new Column(children: <Widget>[
                  new NotEmptyText(
                    null != datas[index].data.content.data.description?datas[index].data.content.data.description:"",
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    )),
                  new Container(
                    width: _sizeWH.width,
                    height: 240,
                    margin:const EdgeInsets.fromLTRB(0,10,0,0),
                    decoration: new BoxDecoration(
                      color: Color(0xFFF3F3F5),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(4.0),
                      image: new DecorationImage(
                          image: new NetworkImage(null != datas[index].data.content.data.cover?datas[index].data.content.data.cover.feed:ERAppConfig.DEF_IMAGE_URL),
                          fit: BoxFit.cover),
                    ),
                  ),
                  ],
              )
            ),

            new Divider(),
          ],
        ),
      );
    }else{
      return new Container(
        height: 0,
      );
    }

  }



}