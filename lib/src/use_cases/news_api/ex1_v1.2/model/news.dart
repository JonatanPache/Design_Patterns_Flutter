import 'content.dart';

class NewsModel extends ContentModel {
  String author;
  String publicationDate;

  NewsModel({
    required String title,
    required String section,
    required String contentUrl,
    required String imageUrl,
    required String type,
    required this.author,
    required this.publicationDate,
  }) : super(
            title: title,
            section: section,
            direccionUrl: contentUrl,
            imageUrl: imageUrl,
            type: type);

  @override
  NewsModel clone() {
    return NewsModel(
        title: title,
        section: section,
        contentUrl: direccionUrl,
        imageUrl: imageUrl,
        author: author,
        publicationDate: publicationDate,
        type: type);
  }

  @override
  static NewsModel fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      section: json['section'],
      contentUrl: json['contentUrl'],
      imageUrl: json['imageUrl'],
      author: json['author'],
      publicationDate: json['publicationDate'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "section": section,
      "contentUrl": direccionUrl,
      "imageUrl": imageUrl,
      "author": author,
      "publicationDate": publicationDate,
      "type": type
    };
  }
}
