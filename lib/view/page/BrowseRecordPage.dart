import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_extension_read/model/BrowseRecordBean.dart';
import 'package:flutter_extension_read/view/page/WebLoadPage.dart';
import 'package:flutter_extension_read/view/widget/EasyListView.dart';

class BrowseRecordPage extends StatefulWidget {

  @override
  _BrowseRecordPageState createState() => _BrowseRecordPageState();

}

class _BrowseRecordPageState extends State<BrowseRecordPage> {

  int page = 0;
  int itemCount = 20;
  bool hasNextPage = true;
  bool isLoadData = true;
  var foregroundWidget = Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());

  List<BrowseRecordBean> datas = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    initData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: EasyListView(
          itemCount: datas.length,
          itemBuilder: getLvItemView,
          loadMore: hasNextPage,
          onLoadMore: _requestMoreData,
          footerBuilder: isLoadData?null:footerBuilder,
          loadMoreWhenNoData: true,
          foregroundWidget: isLoadData?foregroundWidget:null,
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
    initData();
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


  void initData(){
    List<BrowseRecordBean> browseRecordList = [];
      if (null != browseRecordList) {
        if(page>1){
          setState(() {
            hasNextPage = browseRecordList.length > 0;
            datas += browseRecordList;
            isLoadData = false;
          });
        }else{
          setState(() {
            datas = browseRecordList;
            isLoadData = false;
          });
        }
      }
  }

  Widget getLvItemView(BuildContext context,int index) {
    if(datas.length==0)return null;
    return new ListTile(
      leading: new Image.network(datas[index].title),
      title: new Text(datas[index].description),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new WebLoadPage(title:datas[index].description,url:datas[index].route)),
        );
      },
    );
  }

}
