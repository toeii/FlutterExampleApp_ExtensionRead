class HomeDailyEntity{

  int id;
  String title;
  String dataType;
  List<HomeDailyDataBean> datas;

  HomeDailyEntity({
    this.id,
    this.title,
    this.dataType,
    this.datas,
  });

}

class HomeDailyDataBean{
  String id;
  String cover;
  String content;
  String desc;
  String headIcon;
  String actionUrl;

  HomeDailyDataBean({
    this.id,
    this.cover,
    this.content,
    this.desc,
    this.headIcon,
    this.actionUrl,
  });

}