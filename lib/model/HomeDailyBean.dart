import 'package:json_annotation/json_annotation.dart';

part 'HomeDailyBean.g.dart';


@JsonSerializable()
class HomeDailyBean extends Object {


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

  HomeDailyBean(this.itemList,this.count,this.total,this.nextPageUrl,this.adExist,);

  factory HomeDailyBean.fromJson(Map<String, dynamic> srcJson) => _$HomeDailyBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDailyBeanToJson(this);

}


@JsonSerializable()
class ItemList extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'adIndex')
  int adIndex;

  ItemList(this.type,this.data,this.id,this.adIndex,);

  factory ItemList.fromJson(Map<String, dynamic> srcJson) => _$ItemListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemListToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'dataType')
  String dataType;

  @JsonKey(name: 'header')
  Header header;

  @JsonKey(name: 'content')
  Content content;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'itemList')
  List<ContentItemList> itemList;

  @JsonKey(name: 'count')
  int count;

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

  @JsonKey(name: 'resourceType')
  String resourceType;

  @JsonKey(name: 'slogan')
  String slogan;

  @JsonKey(name: 'provider')
  Provider provider;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'cover')
  Cover cover;

  @JsonKey(name: 'playUrl')
  String playUrl;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'webUrl')
  WebUrl webUrl;

  @JsonKey(name: 'releaseTime')
  int releaseTime;

  @JsonKey(name: 'playInfo')
  List<PlayInfo> playInfo;

  @JsonKey(name: 'ad')
  bool ad;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'ifLimitVideo')
  bool ifLimitVideo;

  @JsonKey(name: 'searchWeight')
  int searchWeight;

  @JsonKey(name: 'idx')
  int idx;

  @JsonKey(name: 'date')
  int date;

  @JsonKey(name: 'labelList')
  List<dynamic> labelList;

  @JsonKey(name: 'descriptionEditor')
  String descriptionEditor;

  @JsonKey(name: 'collected')
  bool collected;

  @JsonKey(name: 'played')
  bool played;

  @JsonKey(name: 'subtitles')
  List<dynamic> subtitles;

  Data(this.dataType,this.header,this.content,this.image,this.itemList,this.count,this.id,this.title,this.description,this.library,this.tags,this.consumption,this.resourceType,this.slogan,this.provider,this.category,this.author,this.cover,this.playUrl,this.duration,this.webUrl,this.releaseTime,this.playInfo,this.ad,this.type,this.ifLimitVideo,this.searchWeight,this.idx,this.date,this.labelList,this.descriptionEditor,this.collected,this.played,this.subtitles,);

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

  @JsonKey(name: 'subTitle')
  String subTitle;

  @JsonKey(name: 'subTitleFont')
  String subTitleFont;

  @JsonKey(name: 'textAlign')
  String textAlign;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'rightText')
  String rightText;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'description')
  String description;

  Header(this.id,this.title,this.font,this.subTitle,this.subTitleFont,this.textAlign,this.actionUrl,this.rightText,this.icon,this.image,this.description);

  factory Header.fromJson(Map<String, dynamic> srcJson) => _$HeaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

}


@JsonSerializable()
class ContentItemList extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  ContentData data;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'adIndex')
  int adIndex;

  ContentItemList(this.type,this.data,this.id,this.adIndex,);

  factory ContentItemList.fromJson(Map<String, dynamic> srcJson) => _$ContentItemListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentItemListToJson(this);

}


@JsonSerializable()
class ContentData extends Object {

  @JsonKey(name: 'dataType')
  String dataType;

  @JsonKey(name: 'header')
  ContentHeader header;

  @JsonKey(name: 'content')
  Content content;

  ContentData(this.dataType,this.header,this.content,);

  factory ContentData.fromJson(Map<String, dynamic> srcJson) => _$ContentDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentDataToJson(this);

}


@JsonSerializable()
class ContentHeader extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'textAlign')
  String textAlign;

  @JsonKey(name: 'actionUrl')
  String actionUrl;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'iconType')
  String iconType;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'time')
  int time;

  @JsonKey(name: 'showHateVideo')
  bool showHateVideo;

  ContentHeader(this.id,this.title,this.textAlign,this.actionUrl,this.icon,this.iconType,this.description,this.time,this.showHateVideo,);

  factory ContentHeader.fromJson(Map<String, dynamic> srcJson) => _$ContentHeaderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentHeaderToJson(this);

}


@JsonSerializable()
class Content extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  ContentChildData data;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'adIndex')
  int adIndex;

  Content(this.type,this.data,this.id,this.adIndex,);

  factory Content.fromJson(Map<String, dynamic> srcJson) => _$ContentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}


@JsonSerializable()
class ContentChildData extends Object {

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

  @JsonKey(name: 'resourceType')
  String resourceType;

  @JsonKey(name: 'slogan')
  String slogan;

  @JsonKey(name: 'provider')
  Provider provider;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'cover')
  Cover cover;

  @JsonKey(name: 'playUrl')
  String playUrl;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'webUrl')
  WebUrl webUrl;

  @JsonKey(name: 'releaseTime')
  int releaseTime;

  @JsonKey(name: 'playInfo')
  List<PlayInfo> playInfo;

  @JsonKey(name: 'ad')
  bool ad;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'ifLimitVideo')
  bool ifLimitVideo;

  @JsonKey(name: 'searchWeight')
  int searchWeight;

  @JsonKey(name: 'idx')
  int idx;

  @JsonKey(name: 'date')
  int date;

  @JsonKey(name: 'labelList')
  List<dynamic> labelList;

  @JsonKey(name: 'descriptionEditor')
  String descriptionEditor;

  @JsonKey(name: 'collected')
  bool collected;

  @JsonKey(name: 'played')
  bool played;

  @JsonKey(name: 'subtitles')
  List<dynamic> subtitles;

  ContentChildData(this.dataType,this.id,this.title,this.description,this.library,this.tags,this.consumption,this.resourceType,this.slogan,this.provider,this.category,this.author,this.cover,this.playUrl,this.duration,this.webUrl,this.releaseTime,this.playInfo,this.ad,this.type,this.ifLimitVideo,this.searchWeight,this.idx,this.date,this.labelList,this.descriptionEditor,this.collected,this.played,this.subtitles,);

  factory ContentChildData.fromJson(Map<String, dynamic> srcJson) => _$ContentChildDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentChildDataToJson(this);

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

  @JsonKey(name: 'communityIndex')
  int communityIndex;

  Tags(this.id,this.name,this.actionUrl,this.desc,this.bgPicture,this.headerImage,this.tagRecType,this.communityIndex,);

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

  Consumption(this.collectionCount,this.shareCount,this.replyCount,);

  factory Consumption.fromJson(Map<String, dynamic> srcJson) => _$ConsumptionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ConsumptionToJson(this);

}


@JsonSerializable()
class Provider extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alias')
  String alias;

  @JsonKey(name: 'icon')
  String icon;

  Provider(this.name,this.alias,this.icon,);

  factory Provider.fromJson(Map<String, dynamic> srcJson) => _$ProviderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProviderToJson(this);

}


@JsonSerializable()
class Author extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'latestReleaseTime')
  int latestReleaseTime;

  @JsonKey(name: 'videoNum')
  int videoNum;

  @JsonKey(name: 'follow')
  Follow follow;

  @JsonKey(name: 'shield')
  Shield shield;

  @JsonKey(name: 'approvedNotReadyVideoCount')
  int approvedNotReadyVideoCount;

  @JsonKey(name: 'ifPgc')
  bool ifPgc;

  @JsonKey(name: 'recSort')
  int recSort;

  @JsonKey(name: 'expert')
  bool expert;

  Author(this.id,this.icon,this.name,this.description,this.link,this.latestReleaseTime,this.videoNum,this.follow,this.shield,this.approvedNotReadyVideoCount,this.ifPgc,this.recSort,this.expert,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

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


@JsonSerializable()
class Cover extends Object {

  @JsonKey(name: 'feed')
  String feed;

  @JsonKey(name: 'detail')
  String detail;

  @JsonKey(name: 'blurred')
  String blurred;

  @JsonKey(name: 'homepage')
  String homepage;

  Cover(this.feed,this.detail,this.blurred,this.homepage,);

  factory Cover.fromJson(Map<String, dynamic> srcJson) => _$CoverFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoverToJson(this);

}


@JsonSerializable()
class WebUrl extends Object {

  @JsonKey(name: 'raw')
  String raw;

  @JsonKey(name: 'forWeibo')
  String forWeibo;

  WebUrl(this.raw,this.forWeibo,);

  factory WebUrl.fromJson(Map<String, dynamic> srcJson) => _$WebUrlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WebUrlToJson(this);

}


@JsonSerializable()
class PlayInfo extends Object {

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'urlList')
  List<UrlList> urlList;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  PlayInfo(this.height,this.width,this.urlList,this.name,this.type,this.url,);

  factory PlayInfo.fromJson(Map<String, dynamic> srcJson) => _$PlayInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayInfoToJson(this);

}


@JsonSerializable()
class UrlList extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'size')
  int size;

  UrlList(this.name,this.url,this.size,);

  factory UrlList.fromJson(Map<String, dynamic> srcJson) => _$UrlListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UrlListToJson(this);

}

