import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/model/HomeRecommendBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
import 'package:flutter_extension_read/view/page/PaperDetailPage.dart';
import 'package:flutter_extension_read/view/page/PersonalPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///推荐
class HomeRecommendPage extends StatefulWidget {
  @override
  _HomeRecommendPageState createState() => _HomeRecommendPageState();
}

class _HomeRecommendPageState extends State<HomeRecommendPage> with AutomaticKeepAliveClientMixin{

  int page = 0;
  int itemCount = 20;
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

  Widget getHeaderBuilder(BuildContext context) {
    if(null != datas && datas.length>0){
      return new Offstage(
        offstage: datas[0].type!="squareCardCollection",
        child: new Container(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(10),
                  child: new Text("精彩推荐",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                new Container(
                  height: 220,
                  child: new Swiper(
                    itemBuilder: (BuildContext contextHolder, int index) {
                      return _getBannerViewItem(contextHolder,index);
                    },
                    loop: true,
                    autoplay: true,
                    index: 0,
                    itemCount: 5,
                    viewportFraction: 0.9,
                    scale: 0.9,
                  ),
                ),
              ]),
        ),
      );
    }
    return  new Container(
      height: 0,
    );

  }


  Widget _getBannerViewItem(BuildContext context,int index) {
    if(null != datas && datas.length>0){
      return new Column(
        children: <Widget>[
          new Container(
            child: new GestureDetector(
              onTap: () {

               _databaseHelper.saveNote(new BrowseRecordBean(
                   datas[0].data.itemList[index].data.content.data.id,
                   datas[0].data.itemList[index].data.content.data.id.toString(),
                   datas[0].data.itemList[index].data.content.data.title,
                   datas[0].data.itemList[index].data.content.data.description,
                   datas[0].data.itemList[index].data.content.data.webUrl.raw,
                   datas[0].data.itemList[index].data.content.data.cover.feed));

               Navigator.push(
                 context,
                 new MaterialPageRoute(builder: (context) => new PaperDetailPage(
                   id:datas[0].data.itemList[index].data.content.data.id.toString(),
                   playUrl:datas[0].data.itemList[index].data.content.data.playUrl,
                   title:datas[0].data.itemList[index].data.content.data.title,
                   type:datas[0].data.itemList[index].data.header.description,
                   desc:datas[0].data.itemList[index].data.content.data.description,
                   authorId:datas[0].data.itemList[index].data.content.data.author.id.toString(),
                   authorIcon:datas[0].data.itemList[index].data.content.data.author.icon,
                   authorName:datas[0].data.itemList[index].data.content.data.author.name,
                   authorDesc:datas[0].data.itemList[index].data.content.data.author.description,
                 )),
               );
              },
            ),
            height: 150,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(4.0),
              image: new DecorationImage(
                  image: new NetworkImage(
                  null!=datas[0].data.itemList[index].data.content.data.cover?
                  datas[0].data.itemList[index].data.content.data.cover.feed:
                  ERAppConfig.DEF_IMAGE_URL),
                  fit: BoxFit.cover),
            ),
          ),
          new Container(
            child: new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new PersonalPage(id:datas[0].data.itemList[index].data.content.data.author.id)),
                );
              },
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    width: 46,
                    height: 46,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(null!=datas[0].data.itemList[index].data.content.data.author?datas[0].data.itemList[index].data.content.data.author.icon:ERAppConfig.DEF_IMAGE_URL),
                          fit: BoxFit.fill),
                    ),
                  ),
                  new Container(
                    width: 300,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new NotEmptyText(null!=datas[0].data.itemList[index].data.content.data.author?datas[0].data.itemList[index].data.content.data.author.name:"广告标题${index}",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        new NotEmptyText(null!=datas[0].data.itemList[index].data.content.data.author?datas[0].data.itemList[index].data.content.data.author.description:"广告内容${index}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
    return  new Container(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: EasyListView(
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
    if (null != datas && datas.length > 0) {
      datas.clear();
    }
    page = 1;
    initData();
    return;
  }

  _requestMoreData() {
    page++;
    print('page = $page');
    initData();
  }

  void initData(){
    String requestUrl = ERAppConfig.BASE_URL_V5 + "index/tab/allRec?&isOldUser=true&udid=55b862f0d6714f609bd6e45947f8789f0ff90f48&page="+page.toString();
    ERAppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        HomeRecommendBean home = HomeRecommendBean.fromJson(data);
        if (null != home) {
          if(page>1){
            setState(() {
              hasNextPage = home.itemList.length > 0;
              datas += home.itemList;
              isLoadData = false;
            });
          }else{
            setState(() {
              datas = home.itemList;
              isLoadData = false;
            });
          }
        }
      }
    });
  }

  Widget getItemBuilder(BuildContext context,int index) {
    if(datas.length>0){
      if(datas[index].type == "banner"){
        return new Container(
          alignment: AlignmentDirectional.center,
          child:_getLvBannerItemView(context,index),
        );
      }else if(datas[index].type == "followCard"){
        return new Container(
          alignment: AlignmentDirectional.center,
          child:_getLvCardItemView(context,index),
        );
      }else if(datas[index].type == "videoSmallCard"){
        return new Container(
          alignment: AlignmentDirectional.center,
          child:_getLvSmallItemView(context,index),
        );
      }
    }
    return  new Container(
      height: 0,
    );
  }

  Widget _getLvCardItemView(BuildContext context,int index) {
    return new GestureDetector(
        onTap: () {
          if(null != datas[index].data.content.data.author){
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new PersonalPage(id:datas[index].data.content.data.author.id)),
            );
          }
        },
        child:new Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new NotEmptyText(
                      null!= datas[index].data.header.title? datas[index].data.header.title:"推荐广告位${index}",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    new Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                new NotEmptyText("",
                    style: new TextStyle(
                      fontSize: 10,
                    )),
                new Container(
                  width: window.physicalSize.width,
                  height: 200,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(4.0),
                    image: new DecorationImage(
                        image: new NetworkImage(null != datas[index].data.header.icon?datas[index].data.header.icon:ERAppConfig.DEF_IMAGE_URL),
                        fit: BoxFit.cover),
                  ),
                ),
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        width: 46,
                        height: 46,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: new NetworkImage(null!=datas[index].data.content.data.author?datas[index].data.content.data.author.icon:ERAppConfig.DEF_IMAGE_URL),
                              fit: BoxFit.fill),
                        ),
                      ),
                      new Container(
                        width: 300,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new NotEmptyText(null!=datas[index].data.content.data.author?datas[index].data.content.data.author.name:"广告标题${index}",
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            new NotEmptyText(null!=datas[index].data.content.data.author?datas[index].data.content.data.author.description:"广告内容${index}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
    );

  }

  Widget _getLvBannerItemView(BuildContext context,int index) {
    return new Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new NotEmptyText(
                null!= datas[index].data.title? datas[index].data.title:"推荐广告位${index}",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              new Icon(Icons.keyboard_arrow_right)
            ],
          ),
          new NotEmptyText("",
              style: new TextStyle(
                fontSize: 10,
              )),
          new Container(
            width: window.physicalSize.width,
            height: 200,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(4.0),
              image: new DecorationImage(
                  image: new NetworkImage(
                    null!=datas[index].data.image?datas[index].data.image:ERAppConfig.DEF_IMAGE_URL),
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }


  Widget _getLvSmallItemView(BuildContext context,int index) {
    return
      new Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: new Column(children: <Widget>[
          new GestureDetector(
            onTap: () {
              if(null != datas[index].data.content && null != datas[index].data.header){
                _databaseHelper.saveNote(new BrowseRecordBean(
                    datas[index].data.content.data.id,
                    datas[index].data.content.data.id.toString(),
                    datas[index].data.content.data.title,
                    datas[index].data.content.data.description,
                    datas[index].data.content.data.webUrl.raw,
                    datas[index].data.content.data.cover.feed));

                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new PaperDetailPage(
                    id:datas[index].data.content.data.id.toString(),
                    playUrl:datas[index].data.content.data.playUrl,
                    title:datas[index].data.content.data.title,
                    type:datas[index].data.header.description,
                    desc:datas[index].data.content.data.description,
                    authorId:datas[index].data.content.data.author.id.toString(),
                    authorIcon:datas[index].data.content.data.author.icon,
                    authorName:datas[index].data.content.data.author.name,
                    authorDesc:datas[index].data.content.data.author.description,
                  )),
                );
              }else{
                _databaseHelper.saveNote(new BrowseRecordBean(
                    datas[index].data.id,
                    datas[index].data.id.toString(),
                    datas[index].data.title,
                    datas[index].data.description,
                    datas[index].data.webUrl.raw,
                    datas[index].data.cover.feed));

                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new PaperDetailPage(
                    id:datas[index].data.id.toString(),
                    playUrl:datas[index].data.playUrl,
                    title:datas[index].data.title,
                    type:"#"+datas[index].data.category,
                    desc:datas[index].data.description,
                    authorId:datas[index].data.author.id.toString(),
                    authorIcon:datas[index].data.author.icon,
                    authorName:datas[index].data.author.name,
                    authorDesc:datas[index].data.author.description,
                  )),
                );
              }
            },
            child: new Row(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  width: 170,
                  height: 110,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(4.0),
                    image: new DecorationImage(
                        image: new NetworkImage(null!=datas[index].data.author.icon?datas[index].data.author.icon:ERAppConfig.DEF_IMAGE_URL),
                        fit: BoxFit.cover),
                  ),
                ),
                new Container(
                  height: 110,
                  width: 200,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new NotEmptyText(datas[index].data.title,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      new NotEmptyText(datas[index].data.description,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      );

  }


}
