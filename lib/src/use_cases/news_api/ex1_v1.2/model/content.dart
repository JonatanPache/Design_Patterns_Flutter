import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/model/post.dart';

import 'news.dart';

abstract class ContentModel {
  String title;
  String section;
  String direccionUrl;
  String imageUrl;
  String type;


  ContentModel({
    required this.title,
    required this.section,
    required this.direccionUrl,
    required this.imageUrl,
    required this.type,
  });

  ContentModel clone();

  Map<String, dynamic> toJson();

  static ContentModel fromJson(Map<String, dynamic> json) {
    if(json['type'] == 'post') return Post.fromJson(json);
    return NewsModel.fromJson(json);
  }
}