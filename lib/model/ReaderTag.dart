class ReaderTag{

  int id;
  String name;
  String actionUrl;
  String desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  int communityIndex;

  List<String> childTagList;
  List<int> childTagIdList;

  ReaderTag({
    this.id,
    this.name,
    this.actionUrl,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.communityIndex,
    this.childTagList,
    this.childTagIdList,
  });

  ReaderTag.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.actionUrl = json['actionUrl'];
    this.desc = json['desc'];
    this.bgPicture = json['bgPicture'];
    this.headerImage = json['headerImage'];
    this.tagRecType = json['tagRecType'];
    this.communityIndex = json['communityIndex'];

    this.childTagList = new List<String>.from(json['childTagList']);
    this.childTagIdList = new List<int>.from(json['childTagIdList']);
  }


}
