import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:video_player/video_player.dart';

class PaperDetailPage extends StatefulWidget {

  @override
  _PaperDetailPageState createState() => _PaperDetailPageState();

}

class _PaperDetailPageState extends State<PaperDetailPage>{

  static VideoPlayerController _controller;
  var _isPlaying = false;
  var _playUrl = "http://mov.bn.netease.com/open-movie/nos/flv/2015/12/31/SBB7M663L_hd.flv";
  var itemCount = 20;
  var hasNextPage = true;
//  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_playUrl)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {});
      });
  }

  var headerBuilder = (context) => new Container(
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
              child: Center(
                child: _controller.value.initialized ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(child: CircularProgressIndicator(),),
              ),
            ),
            new Offstage(
              offstage:  _controller.value.isPlaying,
              child: new FloatingActionButton(
                onPressed: _controller.value.isPlaying ? _controller.pause : _controller.play,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            )
          ],
        ),
        new Container(
          padding: const EdgeInsets.fromLTRB(10,5,10,0),
          child: new Text(
              "为什么不能再做朋友?",
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
              "类别,精选",
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
              "因为事发地点发生的发生的发生的古典风格的风格的风格发的风格的规范个地方发的给地方广泛的个",
              style: new TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white70,
                fontSize: 14,
              )
          ),
        ),
        new Row(
          children: <Widget>[
            new Container(
              margin:const EdgeInsets.fromLTRB(10,10,10,10),
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    )
                ),
                new Text(
                    "人生学校 #科技",
                    style: new TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                    )
                ),
              ],
            ),
          ],
        ),


      ],),
  );

  var itemBuilder = (context, index) => Container(
    alignment: AlignmentDirectional.center,
    child: _getContentItemView(),
    color: Colors.white,
  );

  onLoadMoreEvent() {
    Timer(
      Duration(milliseconds: 2000),
          () => setState(() {
        itemCount += 10;
        hasNextPage = itemCount <= 30;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black45,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
          headerBuilder: headerBuilder,
          itemCount: 30,
          itemBuilder: itemBuilder,
          loadMore: hasNextPage,
          onLoadMore: onLoadMoreEvent,
//          foregroundWidget: foregroundWidget,
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
    return  new Row(
      children: <Widget>[
        new Container(
          margin:const EdgeInsets.fromLTRB(10,10,10,10),
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
          margin:const EdgeInsets.fromLTRB(10,0,10,10),
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
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
              new Text(
                  "人生学校 #科技",
                  style: new TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                    fontSize: 14,
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

}