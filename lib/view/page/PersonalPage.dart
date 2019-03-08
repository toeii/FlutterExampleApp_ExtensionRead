import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/PersonalBean.dart';
import 'package:flutter_extension_read/model/PersonalInfoBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
import 'package:flutter_extension_read/view/page/PaperDetailPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///个人资料
class PersonalPage extends StatefulWidget{

  var id;

  @override
  State<StatefulWidget> createState() {
    return _PersonalPageState();
  }

  PersonalPage({Key key,@required this.id}):super(key:key);

}

class _PersonalPageState extends State<PersonalPage>{

  PersonalInfoBean personalInfoData;

  List<ItemList> datas = [];
  int page = 0;
  int itemCount = 20;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = new DatabaseHelper();
    initData();
  }

  void initData(){
    String requestUser = ERAppConfig.BASE_URL_V5 + "userInfo/tab?id="+widget.id.toString()+"&userType=PGC";
    AppHttpClient.get(requestUser, (data) {
      if(null != data) {
        PersonalInfoBean personalInfoBean = PersonalInfoBean.fromJson(data);
        if(null != personalInfoBean.tabInfo){
          String requestPopular = ERAppConfig.BASE_URL+ "pgcs/videoList?id="+widget.id.toString()+"&strategy=mostPopular&udid=55b862f0d6714f609bd6e45947f8789f0ff90f48&start="+datas.length.toString()+"+&num=20".toString();
          AppHttpClient.get(requestPopular, (data1) {
            if(null != data1) {
              PersonalBean personalBean = PersonalBean.fromJson(data1);
              if (null != personalBean) {
                if(page>1){
                  setState(() {
                    hasNextPage = personalBean.itemList.length > 0;
                    datas += personalBean.itemList;
                    isLoadData = false;
                  });
                }else{
                  setState(() {
                    personalInfoData = personalInfoBean;
                    datas = personalBean.itemList;
                    isLoadData = false;
                  });
                }
              }
            }
          });
        }
      }
    });

  }


  Widget dividerBuilder(context, index) => Divider(color: Colors.grey);

  Widget getHeaderBuilder(BuildContext context) {
    if(null != personalInfoData && null != personalInfoData.pgcInfo){
      return  new Container(
        color: Theme.of(context).primaryColor,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Container(
                  width: 90,
                  height: 90,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(color: Color(0xFFCCCCCC), width: 1), // 边色与边宽度
                    boxShadow: [BoxShadow(color: Color(0xFF0F0F0F), offset: Offset(0, 0),    blurRadius: 20.0, spreadRadius: 2.0),],
                    image: new DecorationImage(
                        image: new NetworkImage(null!=personalInfoData.pgcInfo.icon?personalInfoData.pgcInfo.icon:ERAppConfig.DEF_IMAGE_URL),
                        fit: BoxFit.cover),
                  ),
                ),
                new Container(
                  width: window.physicalSize.width,
                  height:180,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: new Container(
                            child: new Icon(Icons.chevron_left, size: 36.0,color: Colors.white,),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              width: window.physicalSize.width,
              color: Colors.white,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.fromLTRB(10,5,10,0),
                    child: new Text(
                        null!=personalInfoData.pgcInfo.name?personalInfoData.pgcInfo.name:"用户10000",
                        textAlign: TextAlign.left,
                        softWrap: true,
                        maxLines:1,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(10,5,10,0),
                    child:  new Text(
                        null!=personalInfoData.pgcInfo.brief?personalInfoData.pgcInfo.brief:"",
                        style: new TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                          fontSize: 12,
                        )
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(10,5,10,10),
                    child:   new Text(
                        null!=personalInfoData.pgcInfo.description?personalInfoData.pgcInfo.description:"",
                        style: new TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black45,
                          fontSize: 14,
                        )
                    ),
                  ),
                  new Container(
                    height: 1,
                    margin:const EdgeInsets.fromLTRB(10,0,10,0),
                    color: new Color(0xFFCCCCCC),
                  ),
                ],),
            )
          ],),
      );
    }
    return  new Container(
      height: 0,
    );

  }

  var footerBuilder = (context) => Container(
    height: 30.0,
    alignment: AlignmentDirectional.center,
    width: window.physicalSize.width,
    color: Colors.white,
    child: Text(
      "没有更多了",
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
      ),
    ),
  );

  Widget getItemBuilder(BuildContext context,int index) {
    if(null != datas && datas.length>0 && null != datas[index].data.author){
      return
        new GestureDetector(
          onTap: () {
          _databaseHelper.saveNote(new BrowseRecordBean(datas[index].data.id,datas[index].data.id.toString(),datas[index].data.title,datas[index].data.description,datas[index].data.webUrl.raw,datas[index].data.cover.feed));

          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new PaperDetailPage(
              id:        datas[index].data.id.toString(),
              playUrl:   datas[index].data.playUrl,
              title:     datas[index].data.title,
              type:  "#"+datas[index].data.category,
              desc:      datas[index].data.description,
              authorId:  datas[index].data.author.id.toString(),
              authorIcon:datas[index].data.author.icon,
              authorName:datas[index].data.author.name,
              authorDesc:datas[index].data.author.description,
            )),
          );
        },
          child: new Container(
            color: Colors.white,
            alignment: AlignmentDirectional.center,
            child:_getContentItemView(index),
          ),
      );
    }else{
      return new Container(
        height: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Theme.of(context).primaryColor,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
          headerBuilder: getHeaderBuilder,
          itemCount: datas.length,
          itemBuilder: getItemBuilder,
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
    page++;
    initData();
  }

  Widget _getContentItemView(int index) {
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
                            image: new NetworkImage(null!=datas[index].data.author.icon?datas[index].data.author.icon:ERAppConfig.DEF_IMAGE_URL),
                            fit: BoxFit.fill),
                      ),
                    ),
                    new Container(
                      margin:const EdgeInsets.fromLTRB(10,0,0,0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Text(
                              null!=datas[index].data.author.name?datas[index].data.author.name:"",
                              style: new TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          new Text(
                              '发布：'+datas[index].data.title.toString(),
                              style: new TextStyle(
                                decoration: TextDecoration.none,
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
                    margin:const EdgeInsets.fromLTRB(0,5,0,0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Text(
                          datas[index].data.description.toString(),
                          style: new TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new Offstage(
                          offstage: null == datas[index].data.tags && datas[index].data.tags.length>2,
                          child:new Row(
                            children: <Widget>[
                              new Container(
                                margin:const EdgeInsets.fromLTRB(0,8,4,8),
                                padding:const EdgeInsets.fromLTRB(5,2,6,3),
                                color: Theme.of(context).primaryColor,
                                child: new Text(
                                  null != datas[index].data.tags && datas[index].data.tags.length>0 ?datas[index].data.tags[0].name:"",
                                  style: new TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              new Container(
                                margin:const EdgeInsets.fromLTRB(0,8,4,8),
                                padding:const EdgeInsets.fromLTRB(5,2,6,3),
                                color: Theme.of(context).primaryColor,
                                child: new Text(
                                  null != datas[index].data.tags && datas[index].data.tags.length>1?datas[index].data.tags[1].name:"",
                                  style: new TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              new Container(
                                margin:const EdgeInsets.fromLTRB(0,8,4,8),
                                padding:const EdgeInsets.fromLTRB(5,2,6,3),
                                color: Theme.of(context).primaryColor,
                                child: new Text(
                                  null != datas[index].data.tags && datas[index].data.tags.length>2?datas[index].data.tags[2].name:"",
                                  style: new TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        new Container(
                          height:240,
                          width: window.physicalSize.width,
                          child:Stack(
                              alignment: FractionalOffset.bottomRight +
                                  const FractionalOffset(-0.1, -0.1),
                              children: <Widget>[
                                new Container(
                                  width: window.physicalSize.width,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.circular(4.0),
                                    image: new DecorationImage(
                                        image: new NetworkImage(null!=datas[index].data.cover?datas[index].data.cover.feed:ERAppConfig.DEF_IMAGE_URL),
                                        fit: BoxFit.cover),
                                  ),
                                ),

                              ]),

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