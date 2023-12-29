// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);
import 'content.dart';

class Post extends ContentModel {
  String content;

  Post({
    required String title,
    required String section,
    required String direccionUrl,
    required String imageUrl,
    required String type,
    required this.content,
  }) : super(
            title: title,
            section: section,
            direccionUrl: direccionUrl,
            imageUrl: imageUrl,
            type: type);

  @override
  Post clone() {
    return Post(
        title: title,
        section: section,
        direccionUrl: direccionUrl,
        imageUrl: imageUrl,
        content: content,
        type: type);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "section": section,
      "direccionUrl": direccionUrl,
      "imageUrl": imageUrl,
      "content": content,
      "type": type
    };
  }

  @override
  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      section: json['section'],
      direccionUrl: json['direccionUrl'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      type: json['type'],
    );
  }
}

