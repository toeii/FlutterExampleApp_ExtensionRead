import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/Home.dart';
import 'package:flutter_extension_read/service/AppConfig.dart';
import 'package:flutter_extension_read/service/AppHttpClient.dart';
import 'package:flutter_extension_read/view/page/PaperDetailPage.dart';
import 'package:flutter_extension_read/view/page/PersonalPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeRecommendPage extends StatefulWidget {
  @override
  _HomeRecommendPageState createState() => _HomeRecommendPageState();
}

class _HomeRecommendPageState extends State<HomeRecommendPage> {
  int itemCount = 20;
  bool hasNextPage = true;

  int page = 0;
  List<ItemList> datas = [];


  @override
  void initState() {
    super.initState();

    initData();
  }

  Widget getHeaderBuilder(BuildContext context) {
    return  new Container(
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
                itemCount: 3,
                index: 0,
                viewportFraction: 0.9,
                scale: 0.9,
              ),
            ),
          ]),
    );
  }


  Widget getItemBuilder(BuildContext context,int index) {
    return new Container(
      alignment: AlignmentDirectional.center,
      child:_getLvItemView(context,index),
    );
  }


  Widget _getBannerViewItem(BuildContext context,int index) {
    return new Column(
      children: <Widget>[
        new Container(
          child: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new WebLoadPage()),
              );
            },
          ),
          height: 150,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(4.0),
            image: new DecorationImage(
                image: new NetworkImage(null!=datas[index].data.cover?datas[index].data.cover.feed:AppConfig.DefImageUrl),
                fit: BoxFit.cover),
          ),
        ),
        new Container(
          child: new Row(
            children: <Widget>[
              new Container(
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new PersonalPage()),
                    );
                  },
                ),
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                width: 46,
                height: 46,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage(null!=datas[index].data.author?datas[index].data.author.icon:AppConfig.DefImageUrl),
                      fit: BoxFit.fill),
                ),
              ),
              new Container(
                width: 300,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new NotEmptyText(null!=datas[index].data.author?datas[index].data.author.name:"广告标题${index}",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    new NotEmptyText(null!=datas[index].data.author?datas[index].data.author.description:"广告内容${index}",
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
      ],
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
        ),
      ),
    );
  }

  // 下拉刷新
  Future<Null> _refresh() async {
    if (null != datas && datas.length > 0) {
      datas.clear();
    }
    page = 1;
    initData();
    return;
  }

  // 上拉加载
  _requestMoreData() {
    page++;
    print('page = $page');
    initData();
  }

  void initData(){
    String requestUrl = AppConfig.BaseUrl + "tabs/selected?date="+new DateTime.now().millisecondsSinceEpoch.toString()+"&page="+page.toString();
    AppHttpClient.get(requestUrl, (data) {
      if(null != data) {
        Home home = Home.fromJson(data);
        if (null != home) {
          if(page>1){
            setState(() {
              hasNextPage = home.itemList.length > 0;
              datas += home.itemList;
            });
          }else{
            setState(() {
              datas = home.itemList;
            });
          }
        }
      }
    });
  }

  Widget _getLvItemView(BuildContext context,int index) {
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
                  image: new NetworkImage(null!=datas[index].data.cover?datas[index].data.cover.feed:AppConfig.DefImageUrl),
                  fit: BoxFit.fill),
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
                      image: new NetworkImage(null!=datas[index].data.author?datas[index].data.author.icon:AppConfig.DefImageUrl),
                      fit: BoxFit.fill),
                ),
              ),
              new Container(
                width: 300,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new NotEmptyText(null!=datas[index].data.author?datas[index].data.author.name:"广告标题${index}",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    new NotEmptyText(null!=datas[index].data.author?datas[index].data.author.description:"广告内容${index}",
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

          getLvItemChildView(datas[index].data.tags),

          new Divider(),
        ],
      ),
    );
  }

  Widget getLvItemChildView(List<Tags> tag) {
    return
        null!=tag && tag.length>0?
            new Column(children: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new PaperDetailPage()),
                  );
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
                            image: new NetworkImage(null!=tag[0].headerImage?tag[0].headerImage:AppConfig.DefImageUrl),
                            fit: BoxFit.fill),
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
                          new NotEmptyText(tag[0].name,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          new NotEmptyText(tag[0].desc,
                              style: new TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new PaperDetailPage()),
                  );
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
                            image: new NetworkImage(tag[1].headerImage),
                            fit: BoxFit.fill),
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
                          new NotEmptyText(tag[1].name,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          new NotEmptyText(tag[1].desc,
                              style: new TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],)
        :
        new Container(
          height: 0,
        );
  }
}
