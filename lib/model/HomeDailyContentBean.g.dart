// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeDailyContentBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDailyContentBean _$HomeDailyContentBeanFromJson(Map<String, dynamic> json) {
  return HomeDailyContentBean(
      json['abstract'] as String,
      json['action_extra'] as String,
      (json['action_list'] as List)
          ?.map((e) => e == null
              ? null
              : Action_list.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['aggr_type'] as int,
      json['allow_download'] as bool,
      json['article_sub_type'] as int,
      json['article_type'] as int,
      json['article_url'] as String,
      json['article_version'] as int,
      json['ban_comment'] as int,
      json['behot_time'] as int,
      json['bury_count'] as int,
      json['cell_flag'] as int,
      json['cell_layout_style'] as int,
      json['cell_type'] as int,
      json['comment_count'] as int,
      json['content_decoration'] as String,
      json['cursor'] as int,
      json['digg_count'] as int,
      json['display_url'] as String,
      (json['filter_words'] as List)
          ?.map((e) => e == null
              ? null
              : Filter_words.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['forward_info'] == null
          ? null
          : Forward_info.fromJson(json['forward_info'] as Map<String, dynamic>),
      json['group_id'] as int,
      json['has_m3u8_video'] as bool,
      json['has_mp4_video'] as int,
      json['has_video'] as bool,
      json['hot'] as int,
      json['ignore_web_transform'] as int,
      json['interaction_data'] as String,
      json['is_subject'] as bool,
      json['item_id'] as int,
      json['item_version'] as int,
      json['keywords'] as String,
      json['level'] as int,
      json['log_pb'] == null
          ? null
          : Log_pb.fromJson(json['log_pb'] as Map<String, dynamic>),
      json['media_info'] == null
          ? null
          : Media_info.fromJson(json['media_info'] as Map<String, dynamic>),
      json['media_name'] as String,
      json['need_client_impr_recycle'] as int,
      json['publish_time'] as int,
      json['read_count'] as int,
      json['repin_count'] as int,
      json['rid'] as String,
      json['share_count'] as int,
      json['share_info'] == null
          ? null
          : Share_info.fromJson(json['share_info'] as Map<String, dynamic>),
      json['share_url'] as String,
      json['show_dislike'] as bool,
      json['show_portrait'] as bool,
      json['show_portrait_article'] as bool,
      json['source'] as String,
      json['source_icon_style'] as int,
      json['source_open_url'] as String,
      json['tag'] as String,
      json['tag_id'] as int,
      json['tip'] as int,
      json['title'] as String,
      json['ugc_recommend'] == null
          ? null
          : Ugc_recommend.fromJson(
              json['ugc_recommend'] as Map<String, dynamic>),
      json['url'] as String,
      json['user_info'] == null
          ? null
          : User_info.fromJson(json['user_info'] as Map<String, dynamic>),
      json['user_repin'] as int,
      json['user_verified'] as int,
      json['verified_content'] as String,
      json['video_style'] as int);
}

Map<String, dynamic> _$HomeDailyContentBeanToJson(
        HomeDailyContentBean instance) =>
    <String, dynamic>{
      'abstract': instance.abstract,
      'action_extra': instance.actionExtra,
      'action_list': instance.actionList,
      'aggr_type': instance.aggrType,
      'allow_download': instance.allowDownload,
      'article_sub_type': instance.articleSubType,
      'article_type': instance.articleType,
      'article_url': instance.articleUrl,
      'article_version': instance.articleVersion,
      'ban_comment': instance.banComment,
      'behot_time': instance.behotTime,
      'bury_count': instance.buryCount,
      'cell_flag': instance.cellFlag,
      'cell_layout_style': instance.cellLayoutStyle,
      'cell_type': instance.cellType,
      'comment_count': instance.commentCount,
      'content_decoration': instance.contentDecoration,
      'cursor': instance.cursor,
      'digg_count': instance.diggCount,
      'display_url': instance.displayUrl,
      'filter_words': instance.filterWords,
      'forward_info': instance.forwardInfo,
      'group_id': instance.groupId,
      'has_m3u8_video': instance.hasM3u8Video,
      'has_mp4_video': instance.hasMp4Video,
      'has_video': instance.hasVideo,
      'hot': instance.hot,
      'ignore_web_transform': instance.ignoreWebTransform,
      'interaction_data': instance.interactionData,
      'is_subject': instance.isSubject,
      'item_id': instance.itemId,
      'item_version': instance.itemVersion,
      'keywords': instance.keywords,
      'level': instance.level,
      'log_pb': instance.logPb,
      'media_info': instance.mediaInfo,
      'media_name': instance.mediaName,
      'need_client_impr_recycle': instance.needClientImprRecycle,
      'publish_time': instance.publishTime,
      'read_count': instance.readCount,
      'repin_count': instance.repinCount,
      'rid': instance.rid,
      'share_count': instance.shareCount,
      'share_info': instance.shareInfo,
      'share_url': instance.shareUrl,
      'show_dislike': instance.showDislike,
      'show_portrait': instance.showPortrait,
      'show_portrait_article': instance.showPortraitArticle,
      'source': instance.source,
      'source_icon_style': instance.sourceIconStyle,
      'source_open_url': instance.sourceOpenUrl,
      'tag': instance.tag,
      'tag_id': instance.tagId,
      'tip': instance.tip,
      'title': instance.title,
      'ugc_recommend': instance.ugcRecommend,
      'url': instance.url,
      'user_info': instance.userInfo,
      'user_repin': instance.userRepin,
      'user_verified': instance.userVerified,
      'verified_content': instance.verifiedContent,
      'video_style': instance.videoStyle
    };

Action_list _$Action_listFromJson(Map<String, dynamic> json) {
  return Action_list(
      json['action'] as int,
      json['desc'] as String,
      json['extra'] == null
          ? null
          : Extra.fromJson(json['extra'] as Map<String, dynamic>));
}

Map<String, dynamic> _$Action_listToJson(Action_list instance) =>
    <String, dynamic>{
      'action': instance.action,
      'desc': instance.desc,
      'extra': instance.extra
    };

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return Extra();
}

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{};

Filter_words _$Filter_wordsFromJson(Map<String, dynamic> json) {
  return Filter_words(json['id'] as String, json['is_selected'] as bool,
      json['name'] as String);
}

Map<String, dynamic> _$Filter_wordsToJson(Filter_words instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_selected': instance.isSelected,
      'name': instance.name
    };

Forward_info _$Forward_infoFromJson(Map<String, dynamic> json) {
  return Forward_info(json['forward_count'] as int);
}

Map<String, dynamic> _$Forward_infoToJson(Forward_info instance) =>
    <String, dynamic>{'forward_count': instance.forwardCount};

Log_pb _$Log_pbFromJson(Map<String, dynamic> json) {
  return Log_pb(json['impr_id'] as String, json['is_following'] as String);
}

Map<String, dynamic> _$Log_pbToJson(Log_pb instance) => <String, dynamic>{
      'impr_id': instance.imprId,
      'is_following': instance.isFollowing
    };

Media_info _$Media_infoFromJson(Map<String, dynamic> json) {
  return Media_info(
      json['avatar_url'] as String,
      json['follow'] as bool,
      json['is_star_user'] as bool,
      json['media_id'] as int,
      json['name'] as String,
      json['recommend_reason'] as String,
      json['recommend_type'] as int,
      json['user_id'] as int,
      json['user_verified'] as bool,
      json['verified_content'] as String);
}

Map<String, dynamic> _$Media_infoToJson(Media_info instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'follow': instance.follow,
      'is_star_user': instance.isStarUser,
      'media_id': instance.mediaId,
      'name': instance.name,
      'recommend_reason': instance.recommendReason,
      'recommend_type': instance.recommendType,
      'user_id': instance.userId,
      'user_verified': instance.userVerified,
      'verified_content': instance.verifiedContent
    };

Share_info _$Share_infoFromJson(Map<String, dynamic> json) {
  return Share_info(
      json['on_suppress'] as int,
      json['share_type'] == null
          ? null
          : Share_type.fromJson(json['share_type'] as Map<String, dynamic>),
      json['share_url'] as String,
      json['title'] as String,
      json['token_type'] as int,
      json['weixin_cover_image'] == null
          ? null
          : Weixin_cover_image.fromJson(
              json['weixin_cover_image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$Share_infoToJson(Share_info instance) =>
    <String, dynamic>{
      'on_suppress': instance.onSuppress,
      'share_type': instance.shareType,
      'share_url': instance.shareUrl,
      'title': instance.title,
      'token_type': instance.tokenType,
      'weixin_cover_image': instance.weixinCoverImage
    };

Share_type _$Share_typeFromJson(Map<String, dynamic> json) {
  return Share_type(json['pyq'] as int, json['qq'] as int, json['qzone'] as int,
      json['wx'] as int);
}

Map<String, dynamic> _$Share_typeToJson(Share_type instance) =>
    <String, dynamic>{
      'pyq': instance.pyq,
      'qq': instance.qq,
      'qzone': instance.qzone,
      'wx': instance.wx
    };

Weixin_cover_image _$Weixin_cover_imageFromJson(Map<String, dynamic> json) {
  return Weixin_cover_image(
      json['height'] as int,
      json['uri'] as String,
      json['url'] as String,
      (json['url_list'] as List)
          ?.map((e) =>
              e == null ? null : Url_list.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['width'] as int);
}

Map<String, dynamic> _$Weixin_cover_imageToJson(Weixin_cover_image instance) =>
    <String, dynamic>{
      'height': instance.height,
      'uri': instance.uri,
      'url': instance.url,
      'url_list': instance.urlList,
      'width': instance.width
    };

Url_list _$Url_listFromJson(Map<String, dynamic> json) {
  return Url_list(json['url'] as String);
}

Map<String, dynamic> _$Url_listToJson(Url_list instance) =>
    <String, dynamic>{'url': instance.url};

Ugc_recommend _$Ugc_recommendFromJson(Map<String, dynamic> json) {
  return Ugc_recommend(json['activity'] as String, json['reason'] as String);
}

Map<String, dynamic> _$Ugc_recommendToJson(Ugc_recommend instance) =>
    <String, dynamic>{'activity': instance.activity, 'reason': instance.reason};

User_info _$User_infoFromJson(Map<String, dynamic> json) {
  return User_info(
      json['avatar_url'] as String,
      json['description'] as String,
      json['follow'] as bool,
      json['follower_count'] as int,
      json['live_info_type'] as int,
      json['name'] as String,
      json['schema'] as String,
      json['user_auth_info'] as String,
      json['user_id'] as int,
      json['user_verified'] as bool,
      json['verified_content'] as String);
}

Map<String, dynamic> _$User_infoToJson(User_info instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'follow': instance.follow,
      'follower_count': instance.followerCount,
      'live_info_type': instance.liveInfoType,
      'name': instance.name,
      'schema': instance.schema,
      'user_auth_info': instance.userAuthInfo,
      'user_id': instance.userId,
      'user_verified': instance.userVerified,
      'verified_content': instance.verifiedContent
    };
