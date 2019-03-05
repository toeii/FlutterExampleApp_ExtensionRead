import 'package:json_annotation/json_annotation.dart';

part 'CommunityBean.g.dart';

/**
 * Created by toeii
 * Date: 2019-01-16
 */
///社区banner
@JsonSerializable()
class CommunityBean extends Object {

  @JsonKey(name: 'itemList')
  List<TagItemList> itemList;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'nextPageUrl')
  String nextPageUrl;

  @JsonKey(name: 'adExist')
  bool adExist;

  CommunityBean(this.itemList,this.count,this.total,this.nextPageUrl,this.adExist,);

  factory CommunityBean.fromJson(Map<String, dynamic> srcJson) => _$CommunityBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityBeanToJson(this);

}


@JsonSerializable()
class TagItemList extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'adIndex')
  int adIndex;

  TagItemList(this.type,this.data,this.id,this.adIndex,);

  factory TagItemList.fromJson(Map<String, dynamic> srcJson) => _$TagItemListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagItemListToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'dataType')
  String dataType;

  @JsonKey(name: 'header')
  Header header;

  @JsonKey(name: 'itemList')
  List<TagItemList> itemList;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'tagName')
  String tagName;

  @JsonKey(name: 'tagId')
  int tagId;

  @JsonKey(name: 'bgPicture')
  String bgPicture;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'seenCount')
  int seenCount;

  @JsonKey(name: 'ifTagIndex')
  bool ifTagIndex;

  Data(this.dataType,this.header,this.itemList,this.count,
      this.tagName,this.tagId,this.bgPicture,this.actionUrl,this.seenCount,
      this.ifTagIndex,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Header extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'font')
  String font;

  @JsonKey(name: 'textAlign')
  String textAlign;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'rightText')
  String rightText;

  @JsonKey(name: 'issuerName')
  String issuerName;

  @JsonKey(name: 'followType')
  String followType;

  @JsonKey(name: 'icon')
  String icon;

  Header(this.id,this.title,this.font,this.textAlign,this.actionUrl,this.rightText,this.issuerName,this.followType,this.icon,);

  factory Header.fromJson(Map<String, dynamic> srcJson) => _$HeaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

}




