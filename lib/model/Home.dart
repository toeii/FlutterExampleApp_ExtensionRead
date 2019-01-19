
class Home{

  int count;
  int total;
  String nextPageUrl;
  int date;
  List<ItemListBean> itemList;

  Home({
    this.count,
    this.total,
    this.nextPageUrl,
    this.date,
    this.itemList,
  });

  Home.fromJSON(Map<String, dynamic> json) {
    if(null != json && json.length>0){
      this.count = json['count'];
      this.total = json['total'];
      this.nextPageUrl = json['nextPageUrl'];
      this.date = json['data'];

      List<ItemListBean> beans = [];
      (json['itemList'] as List<dynamic>).forEach((item) {
        ItemListBean itemListBean = ItemListBean.fromJSON(item);
        beans.add(itemListBean);
      });
      this.itemList = beans;
    }
  }

}

class ItemListBean{
  int id;
  String type;
  List<ItemData> data;

  ItemListBean({
    this.id,
    this.type,
    this.data,
  });

  ItemListBean.fromJSON(Map<String, dynamic> json) {

    this.id = json['id'];
    this.type = json['type'];

    List<ItemData> beans = [];
    //TODO type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast
    //TODO 试试 json_serializable
    (json['data'] as List<dynamic>).forEach((item) {
      ItemData itemListBean = ItemData.fromJSON(item);
      beans.add(itemListBean);
    });
    this.data = beans;

  }

}

class ItemData{
  String dataType;
  ItemHeader header;
  List<ItemList> itemList;
  int count;


  ItemData({
    this.dataType,
    this.header,
    this.itemList,
    this.count,
  });

  ItemData.fromJSON(Map<String, dynamic> json) {

    this.dataType = json['dataType'];
    this.count = json['count'];

    this.header = ItemHeader.fromJSON(json['header']);

    List<ItemList> beans = [];
    (json['header'] as List<dynamic>).forEach((item) {
      ItemList itemListBean = ItemList.fromJSON(item);
      beans.add(itemListBean);
    });
    this.itemList = beans;

  }


}

class ItemHeader{
  int id;
  String title;
  String subTitle;

  ItemHeader({
    this.id,
    this.title,
    this.subTitle,
  });

  ItemHeader.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.subTitle = json['subTitle'];
  }

}

class ItemList{
  int id;
  String type;
  List<ItemListChildData> data;


  ItemList({
    this.id,
    this.type,
    this.data,
  });

  ItemList.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.type = json['type'];

    List<ItemListChildData> beans = [];
    (json['data'] as List<dynamic>).forEach((item) {
      ItemListChildData itemListBean = ItemListChildData.fromJSON(item);
      beans.add(itemListBean);
    });
    this.data = beans;

  }

}

class ItemListChildData{
  int id;
  String title;
  String dataType;
  String image;
  String actionUrl;

  ItemListChildData({
    this.id,
    this.title,
    this.dataType,
    this.image,
    this.actionUrl,
  });

  ItemListChildData.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.dataType = json['dataType'];
    this.image = json['image'];
    this.actionUrl = json['actionUrl'];
  }

}