// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeDailyBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDailyBean _$HomeDailyBeanFromJson(Map<String, dynamic> json) {
  return HomeDailyBean(
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total_number'] as int,
      json['has_more'] as bool,
      json['login_status'] as int,
      json['show_et_status'] as int,
      json['post_content_hint'] as String,
      json['has_more_to_refresh'] as bool,
      json['action_to_last_stick'] as int,
      json['feed_flag'] as int,
      json['tips'] == null
          ? null
          : Tips.fromJson(json['tips'] as Map<String, dynamic>),
      json['hide_topcell_count'] as int);
}

Map<String, dynamic> _$HomeDailyBeanToJson(HomeDailyBean instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'total_number': instance.totalNumber,
      'has_more': instance.hasMore,
      'login_status': instance.loginStatus,
      'show_et_status': instance.showEtStatus,
      'post_content_hint': instance.postContentHint,
      'has_more_to_refresh': instance.hasMoreToRefresh,
      'action_to_last_stick': instance.actionToLastStick,
      'feed_flag': instance.feedFlag,
      'tips': instance.tips,
      'hide_topcell_count': instance.hideTopcellCount
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['content'] as String, json['code'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'content': instance.content, 'code': instance.code};

Tips _$TipsFromJson(Map<String, dynamic> json) {
  return Tips(
      json['type'] as String,
      json['display_duration'] as int,
      json['display_info'] as String,
      json['display_template'] as String,
      json['open_url'] as String,
      json['web_url'] as String,
      json['download_url'] as String,
      json['app_name'] as String,
      json['package_name'] as String);
}

Map<String, dynamic> _$TipsToJson(Tips instance) => <String, dynamic>{
      'type': instance.type,
      'display_duration': instance.displayDuration,
      'display_info': instance.displayInfo,
      'display_template': instance.displayTemplate,
      'open_url': instance.openUrl,
      'web_url': instance.webUrl,
      'download_url': instance.downloadUrl,
      'app_name': instance.appName,
      'package_name': instance.packageName
    };
