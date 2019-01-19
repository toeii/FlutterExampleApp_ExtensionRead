import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/AppConfig.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CommunityPage extends StatefulWidget {

  @override
  _CommunityPageState createState() => _CommunityPageState();

}

class _CommunityPageState extends State<CommunityPage>{

  static Size _sizeWH = window.physicalSize;

  var itemCount = 20;
  var hasNextPage = true;
//  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  @override
  void initState() {
    super.initState();
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
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _getHorizontalItemView(),
                _getHorizontalItemView(),
                _getHorizontalItemView(),
                _getHorizontalItemView(),
                _getHorizontalItemView(),
              ],
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
//      headerSliverBuilder: headerSliverBuilder,
          headerBuilder: headerBuilder,
//          footerBuilder: footerBuilder,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
//          dividerBuilder: dividerBuilder,
          loadMore: hasNextPage,
          onLoadMore: onLoadMoreEvent,
//          foregroundWidget: foregroundWidget,
        ),
      ),
    )

  );

  Future<Null> _refresh() async {
    Timer(Duration(milliseconds: 2000),() => setState(() {
      //            _dataList.clear();
    }),
    );
    //    await _loadFirstListData();
    return ;
  }

  onLoadMoreEvent() {
    Timer(
      Duration(milliseconds: 2000),
          () => setState(() {
        itemCount += 10;
        hasNextPage = itemCount <= 30;
      }),
    );
  }

  Widget dividerBuilder(context, index) => Divider(
    color: Colors.grey,
    height: 1.0,
  );

  var headerSliverBuilder = (context, _) => [
    SliverAppBar(
      expandedHeight: 120.0,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          child: Text(
            "Sliver App Bar",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ),
  ];

  var headerBuilder = (context) => new Container(
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin:const EdgeInsets.all(10),
            child: new Text(
                "今日精选",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          new Container(
            height: 180,
            child: new Swiper(
              itemBuilder: (BuildContext contextHolder,int index){
                return _getBannerViewItem(contextHolder);
              },
              itemCount: 3,
              index: 0,
              viewportFraction: 0.88,
              scale: 0.9,
            ),
          ),
        ]
    ),
  );

  var itemBuilder = (context, index) => Container(
    alignment: AlignmentDirectional.center,
    child: _getContentItemView(),
  );


  static Widget _getHorizontalItemView() {
    return new Container(
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
                  image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
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
          new Text("电影金句",
              style:new TextStyle(
                fontSize: 16,
                color: Colors.white,
              )
          ),
        ],
      ),
    );
  }

  static Widget _getBannerViewItem(BuildContext context) {
    return  new Container(
       child: new GestureDetector(
         onTap: () {
           Navigator.push(
             context,
             new MaterialPageRoute(builder: (context) => new WebLoadPage()),
           );
         },
       ),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(4.0),
        image: new DecorationImage(
            image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
            fit: BoxFit.fill),
      ),
    );
  }

  static Widget _getContentItemView() {
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
                          image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
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
                        "人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校",
                        style: new TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      new Row(
                        children: <Widget>[
                          new Container(
                            margin:const EdgeInsets.fromLTRB(0,8,4,8),
                            padding:const EdgeInsets.fromLTRB(5,2,6,3),
                            color: AppConfig.themeColor,
                            child: new Text(
                              "人生学校1",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          new Container(
                            margin:const EdgeInsets.fromLTRB(0,8,4,8),
                            padding:const EdgeInsets.fromLTRB(5,2,6,3),
                            color: AppConfig.themeColor,
                            child: new Text(
                              "人生学校2",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        width: _sizeWH.width,
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(0,0,0,20),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(4.0),
                          image: new DecorationImage(
                              image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                              fit: BoxFit.fill),
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
