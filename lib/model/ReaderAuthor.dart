class ReaderAuthor{

  int id;
  String icon;
  String name;
  String description;

  ReaderAuthor({
    this.id,
    this.icon,
    this.name,
    this.description,
  });

  ReaderAuthor.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.icon = json['icon'];
    this.name = json['name'];
    this.description = json['description'];
  }

}