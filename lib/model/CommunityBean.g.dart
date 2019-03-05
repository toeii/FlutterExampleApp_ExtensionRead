// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommunityBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityBean _$CommunityBeanFromJson(Map<String, dynamic> json) {
  return CommunityBean(
      (json['itemList'] as List)
          ?.map((e) => e == null
              ? null
              : TagItemList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['count'] as int,
      json['total'] as int,
      json['nextPageUrl'] as String,
      json['adExist'] as bool);
}

Map<String, dynamic> _$CommunityBeanToJson(CommunityBean instance) =>
    <String, dynamic>{
      'itemList': instance.itemList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist
    };

TagItemList _$TagItemListFromJson(Map<String, dynamic> json) {
  return TagItemList(
      json['type'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['id'] as int,
      json['adIndex'] as int);
}

Map<String, dynamic> _$TagItemListToJson(TagItemList instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'id': instance.id,
      'adIndex': instance.adIndex
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['dataType'] as String,
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      (json['itemList'] as List)
          ?.map((e) => e == null
              ? null
              : TagItemList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['count'] as int,
      json['tagName'] as String,
      json['tagId'] as int,
      json['bgPicture'] as String,
      json['actionUrl'] as String,
      json['seenCount'] as int,
      json['ifTagIndex'] as bool);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'header': instance.header,
      'itemList': instance.itemList,
      'count': instance.count,
      'tagName': instance.tagName,
      'tagId': instance.tagId,
      'bgPicture': instance.bgPicture,
      'actionUrl': instance.actionUrl,
      'seenCount': instance.seenCount,
      'ifTagIndex': instance.ifTagIndex
    };

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return Header(
      json['id'] as int,
      json['title'] as String,
      json['font'] as String,
      json['textAlign'] as String,
      json['actionUrl'] as String,
      json['rightText'] as String,
      json['issuerName'] as String,
      json['followType'] as String,
      json['icon'] as String);
}

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'font': instance.font,
      'textAlign': instance.textAlign,
      'actionUrl': instance.actionUrl,
      'rightText': instance.rightText,
      'issuerName': instance.issuerName,
      'followType': instance.followType,
      'icon': instance.icon
    };
