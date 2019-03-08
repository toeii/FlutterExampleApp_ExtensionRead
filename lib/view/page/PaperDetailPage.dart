import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/model/HomeRecommendBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/database/DatabaseHelper.dart';
import 'package:flutter_extension_read/service/net/ERAppHttpClient.dart';
import 'package:flutter_extension_read/view/page/PersonalPage.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:flutter_extension_read/view/widget/NotEmptyText.dart';
import 'package:flutter_extension_read/view/widget/SimpleViewPlayer.dart';

/**
 * Created by toeii
 * Date: 2019-01-16
 */
///文章详情
class PaperDetailPage extends StatefulWidget {

  var id = "";
  var playUrl = "";
  var title = "";
  var type = "";
  var desc = "";
  var authorId = "";
  var authorIcon = "";
  var authorName = "";
  var authorDesc = "";

  @override
  _PaperDetailPageState createState() => _PaperDetailPageState();

  PaperDetailPage({Key key,
    @required this.id,
    @required this.playUrl,
    @required this.title,
    @required this.type,
    @required this.desc,
    @required this.authorId,
    @required this.authorIcon,
    @required this.authorName,
    @required this.authorDesc,
  }):super(key:key);

}

class _PaperDetailPageState extends State<PaperDetailPage>{

  int page = 0;
  var hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());
  List<ItemList> datas = [];

  DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = new DatabaseHelper();
    initData();
  }

  void initData() {
    String requestUrl = ERAppConfig.BASE_URL + "video/related?udid=55b862f0d6714f609bd6e45947f8789f0ff90f48&id="+widget.id.toString();
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

  Widget getHeaderBuilder(BuildContext context) {
    return new Container(
      color: Colors.black87,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Container(
                width: window.physicalSize.width,
                height:234,
                child: new SimpleViewPlayer(widget.playUrl,
                  isFullScreen: false,
                ),

              )
            ],
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child: new Text(
                widget.title,
                textAlign: TextAlign.left,
                softWrap: true,
                maxLines:1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child:  new Text(
                widget.type,
                style: new TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white70,
                  fontSize: 12,
                )
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(10,5,10,10),
            child:   new Text(
                widget.desc,
                style: new TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white70,
                  fontSize: 14,
                )
            ),
          ),
            new Container(
              color: Colors.white,
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin:const EdgeInsets.fromLTRB(10,10,10,10),
                    width: 46,
                    height: 46,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: new NetworkImage(widget.authorIcon),
                          fit: BoxFit.fill),
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                          widget.authorName,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          )
                      ),
                      new Text(
                          widget.authorDesc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            )

        ],),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
            centerTitle: true,
          ),
          body: new Container(
            color: Colors.white,
            child: RefreshIndicator(
              onRefresh: _refresh,
              child:  EasyListView(
                headerBuilder: getHeaderBuilder,
                itemBuilder: getItemBuilder,
                loadMore: false,
                itemCount: datas.length,
//                onLoadMore: _requestMoreData,
                footerBuilder: footerBuilder,
//                foregroundWidget: isLoadData?foregroundWidget:null,
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

  Widget getItemBuilder(BuildContext context,int index) {
    if(datas[index].type == "videoSmallCard"){
      return
        new GestureDetector(
          onTap: () {
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
            alignment: AlignmentDirectional.center,
            child:_getLvSmallItemView(context,index),
          ),
      );
    }else{
      return  new Container(
        height: 0,
      );
    }
  }

  Widget _getLvSmallItemView(BuildContext context,int index) {
    return
      new Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: new Column(children: <Widget>[
          new Row(
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
          new Divider(),
        ]),
      );

  }

}