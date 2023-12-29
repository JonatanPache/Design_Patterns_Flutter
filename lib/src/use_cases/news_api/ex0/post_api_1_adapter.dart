import 'dart:convert';
import 'package:designs_pattern/src/use_cases/news_api/ex0/i_post_api.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api_1.dart';

class PostAPI1Adapter implements IPostAPI {
  final api = PostAPI1();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getYouTubePosts()) as List;
    return data
        .map(
          (e) => Post(
            title: e['title'],
            bio: e['description'],
          ),
        )
        .toList();
  }
}
