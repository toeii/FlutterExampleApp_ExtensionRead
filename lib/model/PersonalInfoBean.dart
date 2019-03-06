import 'package:json_annotation/json_annotation.dart';

part 'PersonalInfoBean.g.dart';


@JsonSerializable()
class PersonalInfoBean extends Object {

  @JsonKey(name: 'tabInfo')
  TabInfo tabInfo;

  @JsonKey(name: 'pgcInfo')
  PgcInfo pgcInfo;

  PersonalInfoBean(this.tabInfo,this.pgcInfo,);

  factory PersonalInfoBean.fromJson(Map<String, dynamic> srcJson) => _$PersonalInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonalInfoBeanToJson(this);

}


@JsonSerializable()
class TabInfo extends Object {

  @JsonKey(name: 'tabList')
  List<TabList> tabList;

  @JsonKey(name: 'defaultIdx')
  int defaultIdx;

  TabInfo(this.tabList,this.defaultIdx,);

  factory TabInfo.fromJson(Map<String, dynamic> srcJson) => _$TabInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabInfoToJson(this);

}


@JsonSerializable()
class TabList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'apiUrl')
  String apiUrl;

  @JsonKey(name: 'tabType')
  int tabType;

  @JsonKey(name: 'nameType')
  int nameType;

  TabList(this.id,this.name,this.apiUrl,this.tabType,this.nameType,);

  factory TabList.fromJson(Map<String, dynamic> srcJson) => _$TabListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabListToJson(this);

}


@JsonSerializable()
class PgcInfo extends Object {

  @JsonKey(name: 'dataType')
  String dataType;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'area')
  String area;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'registDate')
  int registDate;

  @JsonKey(name: 'followCount')
  int followCount;

  @JsonKey(name: 'follow')
  Follow follow;

  @JsonKey(name: 'self')
  bool self;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'videoCount')
  int videoCount;

  @JsonKey(name: 'shareCount')
  int shareCount;

  @JsonKey(name: 'collectCount')
  int collectCount;

  @JsonKey(name: 'myFollowCount')
  int myFollowCount;

  @JsonKey(name: 'medalsNum')
  int medalsNum;

  @JsonKey(name: 'shield')
  Shield shield;

  @JsonKey(name: 'expert')
  bool expert;

  PgcInfo(this.dataType,this.id,this.icon,this.name,this.brief,this.description,this.actionUrl,this.area,this.gender,this.registDate,this.followCount,this.follow,this.self,this.cover,this.videoCount,this.shareCount,this.collectCount,this.myFollowCount,this.medalsNum,this.shield,this.expert,);

  factory PgcInfo.fromJson(Map<String, dynamic> srcJson) => _$PgcInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PgcInfoToJson(this);

}


@JsonSerializable()
class Follow extends Object {

  @JsonKey(name: 'itemType')
  String itemType;

  @JsonKey(name: 'itemId')
  int itemId;

  @JsonKey(name: 'followed')
  bool followed;

  Follow(this.itemType,this.itemId,this.followed,);

  factory Follow.fromJson(Map<String, dynamic> srcJson) => _$FollowFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FollowToJson(this);

}


@JsonSerializable()
class Shield extends Object {

  @JsonKey(name: 'itemType')
  String itemType;

  @JsonKey(name: 'itemId')
  int itemId;

  @JsonKey(name: 'shielded')
  bool shielded;

  Shield(this.itemType,this.itemId,this.shielded,);

  factory Shield.fromJson(Map<String, dynamic> srcJson) => _$ShieldFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShieldToJson(this);

}


