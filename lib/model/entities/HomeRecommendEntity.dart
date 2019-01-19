import 'package:flutter_extension_read/model/ReaderAuthor.dart';
import 'package:flutter_extension_read/model/ReaderDetail.dart';
import 'package:flutter_extension_read/model/ReaderTag.dart';

class HomeRecommendEntity{

  int id;
  String title;
  String dataType;
  List<ReaderDetail> bannerList;
  List<HomeRecommendDataBean> datas;

  HomeRecommendEntity({
    this.id,
    this.title,
    this.dataType,
    this.bannerList,
    this.datas,
  });


}

class HomeRecommendDataBean{
  String cover;
  ReaderAuthor readerAuthor;
  ReaderTag readerTag;

  HomeRecommendDataBean({
    this.cover,
    this.readerAuthor,
    this.readerTag,
  });

}