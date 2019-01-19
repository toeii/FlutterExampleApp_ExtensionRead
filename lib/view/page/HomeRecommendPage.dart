import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/Home.dart';
import 'package:flutter_extension_read/service/AppApi.dart';
import 'package:flutter_extension_read/view/page/PaperDetailPage.dart';
import 'package:flutter_extension_read/view/page/PersonalPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeRecommendPage extends StatefulWidget {

  @override
  _HomeRecommendPageState createState() => _HomeRecommendPageState();

}

class _HomeRecommendPageState extends State<HomeRecommendPage> {
  int itemCount = 20;
  bool hasNextPage = true;

  int page = 0;
  List<ItemListBean> datas = [];

  var headerBuilder = (context) => new Container(
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin:const EdgeInsets.all(10),
            child: new Text(
                "精彩推荐",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          new Container(
            height: 220,
            child: new Swiper(
              itemBuilder: (BuildContext contextHolder,int index){
                return _getBannerViewItem(contextHolder);
              },
              itemCount: 3,
              index: 0,
              viewportFraction: 0.9,
              scale: 0.9,
            ),
          ),

        ]
    ),
  );

  var itemBuilder = (context, index) => Container(
    alignment: AlignmentDirectional.center,
    child:_getLvItemView(context),
  );

  static Widget _getBannerViewItem(BuildContext context) {
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
                image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                fit: BoxFit.fill),
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
                      new MaterialPageRoute(builder: (context) => new PersonalPage()),
                    );
                  },
                ),
                margin:const EdgeInsets.fromLTRB(0,10,10,10),
                width: 46,
                height: 46,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                      fit: BoxFit.fill),
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Text(
                      "承认吧，人生学校人生学校",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  new Text(
                      "人生学校 #科技",
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return   new Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
//      headerSliverBuilder: headerSliverBuilder,
          headerBuilder: headerBuilder,
//          footerBuilder: footerBuilder,
          itemCount: 30,
          itemBuilder: itemBuilder,
//          dividerBuilder: dividerBuilder,
          loadMore: hasNextPage,
          onLoadMore: _requestMoreData,
//          foregroundWidget: foregroundWidget,
        ),
      ),
    );
  }

  // 下拉刷新
  Future<Null> _refresh() async {
    if(null != datas && datas.length>0){
      datas.clear();
    }
    page = 1;
    await AppApi().getHomeList(new DateTime.now().millisecondsSinceEpoch.toString(),'2',page.toString()).then((homeData) {
      if(null != homeData){
        setState(() {
          datas = homeData.itemList;
        });
      }
    });
    return ;
  }

  // 上拉加载
  _requestMoreData() {
    page ++;
    print('page = $page');
    AppApi().getHomeList(new DateTime.now().millisecondsSinceEpoch.toString(),'2',page.toString()).then((homeData) {
      hasNextPage = homeData.itemList.length>0;
      setState(() {
        datas += homeData.itemList;
      });
    });
  }

  static Widget _getLvItemView(BuildContext context){
    return  new Container(
      padding: const EdgeInsets.fromLTRB(10,5,10,5),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(
                "编辑精选",
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
        
          new Text( "", style: new TextStyle(fontSize: 10,)),
          new Container(
            width: window.physicalSize.width,
            height: 200,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(4.0),
              image: new DecorationImage(
                  image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                  fit: BoxFit.fill),
            ),
          ),
          new Row(
            children: <Widget>[
              new Container(
                margin:const EdgeInsets.fromLTRB(0,10,10,10),
                width: 46,
                height: 46,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                      fit: BoxFit.fill),
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Text(
                      "承认吧，人生学校人生学校",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  new Text(
                      "人生学校 #科技",
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      )
                  ),
                ],
              ),
            ],
          ),
          _getLvItemChildView(context),
          _getLvItemChildView(context),
          new Divider(),
        ],
      ),
    );
  }

  static Widget _getLvItemChildView(BuildContext context){
    return new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new PaperDetailPage()),
          );
         },
         child: new Row(
            children: <Widget>[
              new Container(
                margin:const EdgeInsets.fromLTRB(0,0,10,10),
                width: 170,
                height: 110,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(4.0),
                  image: new DecorationImage(
                      image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                      fit: BoxFit.fill),
                ),
              ),
              new Container(
                height: 110,
                width: 160,
                margin:const EdgeInsets.fromLTRB(0,0,0,10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                        "承认吧，人生学校人生学校",
                        textAlign: TextAlign.left,
                        softWrap: true,
                        maxLines:4,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    new Text(
                        "人生学校 #科技",
                        style: new TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
      );

  }


}