
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/AppConfig.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';

class PersonalPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _PersonalPageState();
  }

}

class _PersonalPageState extends State<PersonalPage>{
  var itemCount = 20;
  var hasNextPage = true;

  onLoadMoreEvent() {
    Timer(
      Duration(milliseconds: 2000),
          () => setState(() {
        itemCount += 10;
        hasNextPage = itemCount <= 30;
      }),
    );
  }

  Widget dividerBuilder(context, index) => Divider(color: Colors.grey);

  var headerBuilder = (context) => Container(
    color: Colors.white,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Container(
              width: window.physicalSize.width,
              height:140,
              color: AppConfig.themeColor,
            ),
            new Container(
              margin:const EdgeInsets.fromLTRB(10,10,10,10),
              width: 68,
              height: 68,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new NetworkImage( "https://avatars1.githubusercontent.com/u/11296934?s=460&v=4"),
                    fit: BoxFit.fill),
              ),
            ),
            new Container(
              width: window.physicalSize.width,
              height:140,
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
          padding: const EdgeInsets.fromLTRB(10,5,10,0),
          child: new Text(
              "索尼影视娱乐?",
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
              "作品被喜欢1111次/作品被喜欢1111次",
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
              "因为事发地点发生的发生的发生的古典风格的风格的风格发的风格的规范个地方发的给地方广泛的个",
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

  var itemBuilder = (context, index) => Container(
    alignment: AlignmentDirectional.center,
    color: Colors.white,
    child: _getContentItemView(),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: AppConfig.themeColor,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
          headerBuilder: headerBuilder,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          loadMore: hasNextPage,
          onLoadMore: onLoadMoreEvent,
          footerBuilder: footerBuilder,
        ),
      ),
    );
  }

  Future<Null> _refresh() async {
    Timer(Duration(milliseconds: 2000),() => setState(() {
      //            _dataList.clear();
    }),
    );
    //    await _loadFirstListData();
    return ;
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
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        new Text(
                            "人生学校 #科技",
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
                        "人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校人生学校",
                        style: new TextStyle(
                          decoration: TextDecoration.none,
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
                                decoration: TextDecoration.none,
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
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        width: window.physicalSize.width,
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