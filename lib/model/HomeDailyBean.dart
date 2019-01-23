import 'package:json_annotation/json_annotation.dart';

part 'HomeDailyBean.g.dart';


@JsonSerializable()
class HomeDailyBean extends Object {

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'total_number')
  int totalNumber;

  @JsonKey(name: 'has_more')
  bool hasMore;

  @JsonKey(name: 'login_status')
  int loginStatus;

  @JsonKey(name: 'show_et_status')
  int showEtStatus;

  @JsonKey(name: 'post_content_hint')
  String postContentHint;

  @JsonKey(name: 'has_more_to_refresh')
  bool hasMoreToRefresh;

  @JsonKey(name: 'action_to_last_stick')
  int actionToLastStick;

  @JsonKey(name: 'feed_flag')
  int feedFlag;

  @JsonKey(name: 'tips')
  Tips tips;

  @JsonKey(name: 'hide_topcell_count')
  int hideTopcellCount;

  HomeDailyBean(this.message,this.data,this.totalNumber,this.hasMore,this.loginStatus,this.showEtStatus,this.postContentHint,this.hasMoreToRefresh,this.actionToLastStick,this.feedFlag,this.tips,this.hideTopcellCount,);

  factory HomeDailyBean.fromJson(Map<String, dynamic> srcJson) => _$HomeDailyBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDailyBeanToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'code')
  String code;

  Data(this.content,this.code,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Tips extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'display_duration')
  int displayDuration;

  @JsonKey(name: 'display_info')
  String displayInfo;

  @JsonKey(name: 'display_template')
  String displayTemplate;

  @JsonKey(name: 'open_url')
  String openUrl;

  @JsonKey(name: 'web_url')
  String webUrl;

  @JsonKey(name: 'download_url')
  String downloadUrl;

  @JsonKey(name: 'app_name')
  String appName;

  @JsonKey(name: 'package_name')
  String packageName;

  Tips(this.type,this.displayDuration,this.displayInfo,this.displayTemplate,this.openUrl,this.webUrl,this.downloadUrl,this.appName,this.packageName,);

  factory Tips.fromJson(Map<String, dynamic> srcJson) => _$TipsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TipsToJson(this);

}


