import 'package:flutter_extension_read/model/ReaderAuthor.dart';
import 'package:flutter_extension_read/model/ReaderTag.dart';

class ReaderDetail{


  String id;
  String title;
  String dataType;
  String description;
  String playUrl;
  String slogan;

  ReaderAuthor readerAuthors;
  List<ReaderTag> readerTags;


  ReaderDetail({
    this.id,
    this.title,
    this.dataType,
    this.description,
    this.playUrl,
    this.slogan,
  });

  ReaderDetail.fromJSON(Map<String, dynamic> json) {

    this.id = json['id'];
    this.title = json['title'];
    this.dataType = json['dataType'];
    this.description = json['description'];
    this.playUrl = json['playUrl'];
    this.slogan = json['slogan'];

    this.readerAuthors = ReaderAuthor.fromJSON(json['author']);

    List<ReaderTag> tags = [];
    (json['tags'] as List).forEach((item) {
      ReaderTag tag = ReaderTag.fromJSON(item);
      tags.add(tag);
    });
    this.readerTags = tags;

  }

}