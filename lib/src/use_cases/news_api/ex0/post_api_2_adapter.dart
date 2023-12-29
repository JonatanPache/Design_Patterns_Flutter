import 'dart:convert';
import 'package:designs_pattern/src/use_cases/news_api/ex0/i_post_api.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api_2.dart';

class PostAPI2Adapter implements IPostAPI {
  final api = PostAPI2();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getMediumPosts()) as List;
    return data
        .map(
          (e) => Post(
            title: e['header'],
            bio: e['bio'],
          ),
        )
        .toList();
  }
}
