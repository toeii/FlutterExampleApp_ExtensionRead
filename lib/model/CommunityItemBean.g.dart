// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommunityItemBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityItemBean _$CommunityItemBeanFromJson(Map<String, dynamic> json) {
  return CommunityItemBean(
      (json['itemList'] as List)
          ?.map((e) =>
              e == null ? null : ItemList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['count'] as int,
      json['total'] as int,
      json['nextPageUrl'] as String,
      json['adExist'] as bool);
}

Map<String, dynamic> _$CommunityItemBeanToJson(CommunityItemBean instance) =>
    <String, dynamic>{
      'itemList': instance.itemList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist
    };

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return ItemList(
      json['type'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['id'] as int);
}

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'id': instance.id
    };

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return Header(
      json['id'] as int,
      json['actionUrl'] as String,
      json['icon'] as String,
      json['iconType'] as String,
      json['showHateVideo'] as bool,
      json['followType'] as String,
      json['tagId'] as int,
      json['issuerName'] as String,
      json['topShow'] as bool);
}

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'id': instance.id,
      'actionUrl': instance.actionUrl,
      'icon': instance.icon,
      'iconType': instance.iconType,
      'showHateVideo': instance.showHateVideo,
      'followType': instance.followType,
      'tagId': instance.tagId,
      'issuerName': instance.issuerName,
      'topShow': instance.topShow
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
      json['type'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['id'] as int);
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'id': instance.id
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      json['dataType'] as String,
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['library'] as String,
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['consumption'] == null
          ? null
          : Consumption.fromJson(json['consumption'] as Map<String, dynamic>),
      json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      json['playUrl'] as String,
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'header': instance.header,
      'content': instance.content,
      'dataType': instance.dataType,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'library': instance.library,
      'tags': instance.tags,
      'consumption': instance.consumption,
      'owner': instance.owner,
      'playUrl': instance.playUrl,
      'cover': instance.cover
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
      json['id'] as int,
      json['name'] as String,
      json['actionUrl'] as String,
      json['desc'] as String,
      json['bgPicture'] as String,
      json['headerImage'] as String,
      json['tagRecType'] as String,
      json['tagStatus'] as String,
      json['ifShow'] as bool);
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionUrl': instance.actionUrl,
      'desc': instance.desc,
      'bgPicture': instance.bgPicture,
      'headerImage': instance.headerImage,
      'tagRecType': instance.tagRecType,
      'tagStatus': instance.tagStatus,
      'ifShow': instance.ifShow
    };

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return Consumption(json['collectionCount'] as int, json['shareCount'] as int,
      json['replyCount'] as int, json['playCount'] as int);
}

Map<String, dynamic> _$ConsumptionToJson(Consumption instance) =>
    <String, dynamic>{
      'collectionCount': instance.collectionCount,
      'shareCount': instance.shareCount,
      'replyCount': instance.replyCount,
      'playCount': instance.playCount
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
      json['uid'] as int,
      json['nickname'] as String,
      json['avatar'] as String,
      json['userType'] as String,
      json['ifPgc'] as bool,
      json['description'] as String,
      json['gender'] as String,
      json['actionUrl'] as String,
      json['followed'] as bool,
      json['limitVideoOpen'] as bool,
      json['library'] as String,
      json['expert'] as bool,
      json['username'] as String,
      json['uploadStatus'] as String);
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'userType': instance.userType,
      'ifPgc': instance.ifPgc,
      'description': instance.description,
      'gender': instance.gender,
      'actionUrl': instance.actionUrl,
      'followed': instance.followed,
      'limitVideoOpen': instance.limitVideoOpen,
      'library': instance.library,
      'expert': instance.expert,
      'username': instance.username,
      'uploadStatus': instance.uploadStatus
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(json['feed'] as String, json['detail'] as String);
}

Map<String, dynamic> _$CoverToJson(Cover instance) =>
    <String, dynamic>{'feed': instance.feed, 'detail': instance.detail};
