// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonalInfoBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoBean _$PersonalInfoBeanFromJson(Map<String, dynamic> json) {
  return PersonalInfoBean(
      json['tabInfo'] == null
          ? null
          : TabInfo.fromJson(json['tabInfo'] as Map<String, dynamic>),
      json['pgcInfo'] == null
          ? null
          : PgcInfo.fromJson(json['pgcInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PersonalInfoBeanToJson(PersonalInfoBean instance) =>
    <String, dynamic>{'tabInfo': instance.tabInfo, 'pgcInfo': instance.pgcInfo};

TabInfo _$TabInfoFromJson(Map<String, dynamic> json) {
  return TabInfo(
      (json['tabList'] as List)
          ?.map((e) =>
              e == null ? null : TabList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['defaultIdx'] as int);
}

Map<String, dynamic> _$TabInfoToJson(TabInfo instance) => <String, dynamic>{
      'tabList': instance.tabList,
      'defaultIdx': instance.defaultIdx
    };

TabList _$TabListFromJson(Map<String, dynamic> json) {
  return TabList(
      json['id'] as int,
      json['name'] as String,
      json['apiUrl'] as String,
      json['tabType'] as int,
      json['nameType'] as int);
}

Map<String, dynamic> _$TabListToJson(TabList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'apiUrl': instance.apiUrl,
      'tabType': instance.tabType,
      'nameType': instance.nameType
    };

PgcInfo _$PgcInfoFromJson(Map<String, dynamic> json) {
  return PgcInfo(
      json['dataType'] as String,
      json['id'] as int,
      json['icon'] as String,
      json['name'] as String,
      json['brief'] as String,
      json['description'] as String,
      json['actionUrl'] as String,
      json['area'] as String,
      json['gender'] as String,
      json['registDate'] as int,
      json['followCount'] as int,
      json['follow'] == null
          ? null
          : Follow.fromJson(json['follow'] as Map<String, dynamic>),
      json['self'] as bool,
      json['cover'] as String,
      json['videoCount'] as int,
      json['shareCount'] as int,
      json['collectCount'] as int,
      json['myFollowCount'] as int,
      json['medalsNum'] as int,
      json['shield'] == null
          ? null
          : Shield.fromJson(json['shield'] as Map<String, dynamic>),
      json['expert'] as bool);
}

Map<String, dynamic> _$PgcInfoToJson(PgcInfo instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'brief': instance.brief,
      'description': instance.description,
      'actionUrl': instance.actionUrl,
      'area': instance.area,
      'gender': instance.gender,
      'registDate': instance.registDate,
      'followCount': instance.followCount,
      'follow': instance.follow,
      'self': instance.self,
      'cover': instance.cover,
      'videoCount': instance.videoCount,
      'shareCount': instance.shareCount,
      'collectCount': instance.collectCount,
      'myFollowCount': instance.myFollowCount,
      'medalsNum': instance.medalsNum,
      'shield': instance.shield,
      'expert': instance.expert
    };

Follow _$FollowFromJson(Map<String, dynamic> json) {
  return Follow(json['itemType'] as String, json['itemId'] as int,
      json['followed'] as bool);
}

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'followed': instance.followed
    };

Shield _$ShieldFromJson(Map<String, dynamic> json) {
  return Shield(json['itemType'] as String, json['itemId'] as int,
      json['shielded'] as bool);
}

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'shielded': instance.shielded
    };
