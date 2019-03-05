import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/HomeRecommendBean.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';
import 'package:video_player/video_player.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///个人资料
class PersonalPage extends StatefulWidget{

  List<ItemList> personalData = [];
  var icon;
  var title;
  var description;

  VideoPlayerController controller;

  @override
  State<StatefulWidget> createState() {
    return _PersonalPageState();
  }

  PersonalPage({Key key,@required this.personalData,@required this.icon,@required this.title,@required this.description}):super(key:key);

}

class _PersonalPageState extends State<PersonalPage>{

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  Widget dividerBuilder(context, index) => Divider(color: Colors.grey);

  Widget getHeaderBuilder(BuildContext context) {
    return  new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Container(
                margin:const EdgeInsets.fromLTRB(10,10,10,10),
                width: 68,
                height: 68,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage(null!=widget.icon?widget.icon:ERAppConfig.DEF_IMAGE_URL),
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
                    widget.title,
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
                    '作品被喜欢10000次 / 作品被分享2000次',
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
                    widget.description,
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
    if(null != widget.personalData[index].data.author){
      widget.controller = VideoPlayerController.network(widget.personalData[index].data.playUrl);
      return new Container(
        alignment: AlignmentDirectional.center,
        color: Colors.white,
        child:_getContentItemView(widget.personalData[index]),
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
      child: RefreshIndicator(
        onRefresh: _refresh,
        child:  EasyListView(
          headerBuilder: getHeaderBuilder,
          itemCount: widget.personalData.length,
          itemBuilder: getItemBuilder,
          loadMore: false,
          footerBuilder: footerBuilder,
        ),
      ),
    );
  }

  Future<Null> _refresh() async {
    Timer(Duration(milliseconds: 2000),() =>
        setState(() {
          //TODO 缺少数据
        }),
    );
    return ;
  }

  Widget _getContentItemView(ItemList dataItem) {
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
                            image: new NetworkImage(null!=dataItem.data.author?dataItem.data.author.icon:ERAppConfig.DEF_IMAGE_URL),
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
                              null!=dataItem.data.author?dataItem.data.author.name:"",
                              style: new TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          new Text(
                              '发布：'+dataItem.data.slogan.toString(),
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
                          dataItem.data.description.toString(),
                          style: new TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new Offstage(
                          offstage: null == dataItem.data.tags,
                          child:new Row(
                            children: <Widget>[
                              new Container(
                                margin:const EdgeInsets.fromLTRB(0,8,4,8),
                                padding:const EdgeInsets.fromLTRB(5,2,6,3),
                                color: Colors.blue,
                                child: new Text(
                                  null != dataItem.data.tags && dataItem.data.tags.length>0 ?dataItem.data.tags[0].name:"",
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
                                color: Colors.blue,
                                child: new Text(
                                  null != dataItem.data.tags && dataItem.data.tags.length>1?dataItem.data.tags[1].name:"",
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
                                color: Colors.blue,
                                child: new Text(
                                  null != dataItem.data.tags && dataItem.data.tags.length>2?dataItem.data.tags[2].name:"",
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
                                        image: new NetworkImage(null!=dataItem.data.cover?dataItem.data.cover.feed:ERAppConfig.DEF_IMAGE_URL),
                                        fit: BoxFit.cover),
                                  ),
                                ),

                                //TODO 播放器待优化
                                /*_controller.value.initialized ? AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                )
                                    : Container(child: CircularProgressIndicator(),),

                                Offstage(
                                  offstage:  _controller.value.isPlaying,
                                  child: new FloatingActionButton(
                                    onPressed: _controller.value.isPlaying ? _controller.pause : _controller.play,
                                    child: Icon(
                                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    ),
                                  ),
                                )*/
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