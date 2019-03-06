import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/CommunityBean.dart';
import 'package:flutter_extension_read/model/CommunityItemBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///社区
class CommunityPage extends StatefulWidget {

  @override
  _CommunityPageState createState() => _CommunityPageState();

}

class _CommunityPageState extends State<CommunityPage> with AutomaticKeepAliveClientMixin{

  static Size _sizeWH = window.physicalSize;

  int page = 0;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  @override
  bool get wantKeepAlive => true;

  List<TagItemList> headDatas = [];
  List<ItemList> contentDatas = [];

  int tagId = 0;
  String tagName = '';

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData(){
    headDatas.clear();

    String requestUrl = ERAppConfig.BASE_URL_V6 + "community/tab/rec?udid=55b862f0d6714f609bd6e45947f8789f0ff90f48&vc=461&deviceModel=PBAT00".toString();
    AppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        CommunityBean communityBean = CommunityBean.fromJson(data);
        if (null != communityBean) {
          for(var headData in communityBean.itemList){
            if(headData.type == 'squareCardCollection'){
              headDatas.addAll(headData.data.itemList);
            }
          }
          if(headDatas.length>0){
            initListData(headDatas[0].data.tagId,headDatas[0].data.tagName);
          }
        }
      }
    });

  }

  void initListData(int id,String name){
    String requestUrl = ERAppConfig.BASE_URL_V6 + "tag/dynamics?id="+id.toString()+"&start="+contentDatas.length.toString()+"+&num=20".toString();
    AppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        CommunityItemBean communityItemBean = CommunityItemBean.fromJson(data);
        if(null != communityItemBean){
          if(page>1){
            setState(() {
              tagId = id;
              tagName = name;
              contentDatas += communityItemBean.itemList;
              hasNextPage = communityItemBean.itemList.length > 0;
              isLoadData = false;
            });
          }else{
            setState(() {
              tagId = id;
              tagName = name;
              contentDatas = communityItemBean.itemList;
              hasNextPage = communityItemBean.itemList.length > 0;
              isLoadData = false;
            });
          }
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: new PreferredSize(
      child: new AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: new Container(
            height: 84,
            color: Colors.white,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: headDatas.length,
              itemBuilder: (context, index) {
                return _getHorizontalItemView(context,index);
              },
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(94),
    ),

    body: new Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
          headerBuilder: headerBuilder,
          itemCount: contentDatas.length,
          itemBuilder: itemBuilder,
          loadMore: hasNextPage,
          onLoadMore: _requestMoreData,
          foregroundWidget: isLoadData?foregroundWidget:null,
          footerBuilder: isLoadData?null:footerBuilder,
        ),
      ),
    )

  );


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


  Future<Null> _refresh() async {
    if (null != contentDatas && contentDatas.length > 0) {
      contentDatas.clear();
    }
    page = 1;
    initListData(tagId,tagName);
//    initData();
    return;
  }

  _requestMoreData() {
    page++;
    initData();
  }

  Widget dividerBuilder(context, index) => Divider(
    color: Colors.grey,
    height: 1.0,
  );

  Widget headerBuilder(BuildContext context) {
    return new Container(
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              margin:const EdgeInsets.all(10),
              child:  new NotEmptyText(tagName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ]
      ),
    );
  }


  Widget itemBuilder(BuildContext context,int index) {
    return
      new GestureDetector(
        onTap: () {

        },
        child: new Container(
          alignment: AlignmentDirectional.center,
          child:_getContentItemView(context,index),
        ),
      );
  }

  Widget _getHorizontalItemView(BuildContext context,int index) {
    return
      new GestureDetector(
        onTap: () {
          setState(() {
            contentDatas = [];
          });
          page = 1;
          tagId = headDatas[index].data.tagId;
          tagName = headDatas[index].data.tagName;
          isLoadData = true;
          initListData(tagId,tagName);
        },
        child: new Container(
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Container(
                width: 120,
                height: 60,
                margin:const EdgeInsets.fromLTRB(5,10,5,10),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(4.0),
                  image: new DecorationImage(
                      image: new NetworkImage(null!=headDatas[index].data.bgPicture?headDatas[index].data.bgPicture:ERAppConfig.DEF_IMAGE_URL),
                      fit: BoxFit.fill),
                ),
              ),
              new Container(
                width: 120,
                height: 60,
                margin:const EdgeInsets.fromLTRB(5,10,5,10),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(4.0),
                  color: new Color(0x7F000000),
                ),
              ),
              new NotEmptyText(null!=headDatas[index].data.tagName?headDatas[index].data.tagName:"Tag${index}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )
              ),
            ],
          ),
        ),
      );

  }

  Widget _getContentItemView(BuildContext context,int index) {
    return  new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Container(
          padding:const EdgeInsets.all(10),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    width: 46,
                    height: 46,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(null!=contentDatas[index].data.header.icon?contentDatas[index].data.header.icon:ERAppConfig.DEF_IMAGE_URL),
                          fit: BoxFit.fill),
                    ),
                  ),
                  new Container(
                    margin:const EdgeInsets.fromLTRB(10,0,0,0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new NotEmptyText(null!=contentDatas[index].data.header.issuerName?contentDatas[index].data.header.issuerName:"用户1000${index}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),

                        new Text(
                            "发布：",
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
              new Container(
                  margin:const EdgeInsets.fromLTRB(0,10,0,0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new NotEmptyText(null!=contentDatas[index].data.content.data.description?contentDatas[index].data.content.data.description:"",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )
                      ),
                      new Container(
                        width: _sizeWH.width,
                        height: null!=contentDatas[index].data.content.data.cover?200:0,
                        margin: const EdgeInsets.fromLTRB(0,10,0,20),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(4.0),
                          image: new DecorationImage(
                              image: new NetworkImage(null!=contentDatas[index].data.content.data.cover&&null!=contentDatas[index].data.content.data.cover.feed?contentDatas[index].data.content.data.cover.feed:ERAppConfig.DEF_IMAGE_URL),
                              fit: BoxFit.cover),
                        ),
                      ),
                      new Divider(),
                    ],
                  )
              )

            ],
          ),
        )

      ],
    );
  }

}
