import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/model/HomeDailyBean.dart';
import 'package:flutter_extension_read/model/HomeDailyContentBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
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
  int itemCount = 20;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  List<Data> datas = [];

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
          loadMoreWhenNoData: true,
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
    String requestUrl = ERAppConfig.BASE_URL_TT + "?category=news_hot";
    AppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        HomeDailyBean homeDailyBean = HomeDailyBean.fromJson(data);
        if (null != homeDailyBean) {
          if(page>1){
            setState(() {
              hasNextPage = homeDailyBean.data.length > 0;
              datas += homeDailyBean.data;
              isLoadData = false;
            });
          }else{
            setState(() {
              datas = homeDailyBean.data;
              isLoadData = false;
            });
          }
        }
      }
    });
  }

  Widget getLvItemView(BuildContext context,int index) {
    if(datas.length==0)return null;

    HomeDailyContentBean contentBean = HomeDailyContentBean.fromJson(json.decode(datas[index].content));
    if(null!=contentBean && null != contentBean.userInfo && null != contentBean.shareInfo && null != contentBean.shareInfo.weixinCoverImage){
      return new Container(
        alignment: AlignmentDirectional.center,
        margin:const EdgeInsets.fromLTRB(10,10,10,0),
        width: _sizeWH.width,
        child:new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin:const EdgeInsets.fromLTRB(0,0,10,10),
                  width: 56,
                  height: 56,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: new NetworkImage(null!=contentBean.userInfo?contentBean.userInfo.avatarUrl:ERAppConfig.DEF_IMAGE_URL),
                        fit: BoxFit.cover),
                  ),
                ),
                new Container(
                  width: _sizeWH.width/3.5,
                  height: 75,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new NotEmptyText(
                          null!=contentBean.userInfo?contentBean.userInfo.name:"用户",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      new NotEmptyText(
                          null!=contentBean.userInfo?contentBean.userInfo.description:"",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),

            new GestureDetector(
              onTap: () {

                _databaseHelper.saveNote(new BrowseRecordBean(contentBean.itemId,contentBean.itemId.toString(),contentBean.title,contentBean.contentDecoration,contentBean.displayUrl,null!=contentBean.shareInfo && null!=contentBean.shareInfo.weixinCoverImage?contentBean.shareInfo.weixinCoverImage.url:ERAppConfig.DEF_IMAGE_URL));

                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new WebLoadPage(title:contentBean.title,url:contentBean.displayUrl)),
                );
              },
              child: new Container(
                width: _sizeWH.width,
                height: 240,
                decoration: new BoxDecoration(
                  color: Color(0xFFF3F3F5),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(4.0),
                image: new DecorationImage(
                image: new NetworkImage(null!=contentBean.shareInfo && null!=contentBean.shareInfo.weixinCoverImage?contentBean.shareInfo.weixinCoverImage.url:ERAppConfig.DEF_IMAGE_URL),
                fit: BoxFit.cover),
                ),
              ),
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