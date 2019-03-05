/**
 * Created by toeii
 * Date: 2019-01-16
 */
///浏览记录
class BrowseRecordBean extends Object {

  int _id;
  String _pointId;
  String _title;
  String _content;
  String _url;
  String _image;

  BrowseRecordBean(this._id,this._pointId,this._title, this._content,this._url,this._image);


  BrowseRecordBean.map(dynamic obj) {
    this._id = obj['id'];
    this._pointId = obj['pointId'];
    this._title = obj['title'];
    this._content = obj['content'];
    this._url = obj['url'];
    this._image = obj['image'];
  }

  int get id => _id;
  String get pointId => _pointId;
  String get title => _title;
  String get content => _content;
  String get url => _url;
  String get image => _image;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['pointId'] = _pointId;
    map['title'] = _title;
    map['content'] = _content;
    map['url'] = _url;
    map['image'] = _image;
    return map;
  }

  BrowseRecordBean.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._pointId = map['pointId'];
    this._title = map['title'];
    this._content = map['content'];
    this._url = map['url'];
    this._image = map['image'];
  }

}