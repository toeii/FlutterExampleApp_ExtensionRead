import 'package:json_annotation/json_annotation.dart';

part 'CommunityItemBean.g.dart';

/**
 * Created by toeii
 * Date: 2019-01-16
 */
///社区列表
@JsonSerializable()
class CommunityItemBean extends Object {

  @JsonKey(name: 'itemList')
  List<ItemList> itemList;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'nextPageUrl')
  String nextPageUrl;

  @JsonKey(name: 'adExist')
  bool adExist;

  CommunityItemBean(this.itemList,this.count,this.total,this.nextPageUrl,this.adExist,);

  factory CommunityItemBean.fromJson(Map<String, dynamic> srcJson) => _$CommunityItemBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityItemBeanToJson(this);

}


@JsonSerializable()
class ItemList extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'id')
  int id;


  ItemList(this.type,this.data,this.id,);

  factory ItemList.fromJson(Map<String, dynamic> srcJson) => _$ItemListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemListToJson(this);

}


@JsonSerializable()
class Header extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'iconType')
  String iconType;

  @JsonKey(name: 'showHateVideo')
  bool showHateVideo;

  @JsonKey(name: 'followType')
  String followType;

  @JsonKey(name: 'tagId')
  int tagId;

  @JsonKey(name: 'issuerName')
  String issuerName;

  @JsonKey(name: 'topShow')
  bool topShow;

  Header(this.id,this.actionUrl,this.icon,this.iconType,this.showHateVideo,this.followType,this.tagId,this.issuerName,this.topShow,);

  factory Header.fromJson(Map<String, dynamic> srcJson) => _$HeaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

}


@JsonSerializable()
class Content extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'id')
  int id;

  Content(this.type,this.data,this.id,);

  factory Content.fromJson(Map<String, dynamic> srcJson) => _$ContentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'header')
  Header header;

  @JsonKey(name: 'content')
  Content content;

  @JsonKey(name: 'dataType')
  String dataType;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'library')
  String library;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'consumption')
  Consumption consumption;

  @JsonKey(name: 'owner')
  Owner owner;

  @JsonKey(name: 'playUrl')
  String playUrl;

  @JsonKey(name: 'cover')
  Cover cover;

  Data(this.header,this.content,this.dataType,this.id,this.title,this.description,
      this.library,this.tags,this.consumption,this.owner,this.playUrl,this.cover,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'bgPicture')
  String bgPicture;

  @JsonKey(name: 'headerImage')
  String headerImage;

  @JsonKey(name: 'tagRecType')
  String tagRecType;

  @JsonKey(name: 'tagStatus')
  String tagStatus;

  @JsonKey(name: 'ifShow')
  bool ifShow;

  Tags(this.id,this.name,this.actionUrl,this.desc,this.bgPicture,this.headerImage,this.tagRecType,
     this.tagStatus,this.ifShow,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}


@JsonSerializable()
class Consumption extends Object {

  @JsonKey(name: 'collectionCount')
  int collectionCount;

  @JsonKey(name: 'shareCount')
  int shareCount;

  @JsonKey(name: 'replyCount')
  int replyCount;

  @JsonKey(name: 'playCount')
  int playCount;

  Consumption(this.collectionCount,this.shareCount,this.replyCount,this.playCount,);

  factory Consumption.fromJson(Map<String, dynamic> srcJson) => _$ConsumptionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConsumptionToJson(this);

}


@JsonSerializable()
class Owner extends Object {

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'userType')
  String userType;

  @JsonKey(name: 'ifPgc')
  bool ifPgc;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'limitVideoOpen')
  bool limitVideoOpen;

  @JsonKey(name: 'library')
  String library;

  @JsonKey(name: 'expert')
  bool expert;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'uploadStatus')
  String uploadStatus;

  Owner(this.uid,this.nickname,this.avatar,this.userType,this.ifPgc,this.description,this.gender,this.actionUrl,this.followed,this.limitVideoOpen,this.library,this.expert,this.username,this.uploadStatus,);

  factory Owner.fromJson(Map<String, dynamic> srcJson) => _$OwnerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

}


@JsonSerializable()
class Cover extends Object {

  @JsonKey(name: 'feed')
  String feed;

  @JsonKey(name: 'detail')
  String detail;

  Cover(this.feed,this.detail,);

  factory Cover.fromJson(Map<String, dynamic> srcJson) => _$CoverFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoverToJson(this);

}


