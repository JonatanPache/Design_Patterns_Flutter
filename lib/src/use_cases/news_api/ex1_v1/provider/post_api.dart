import 'package:designs_pattern/src/use_cases/news_api/ex1_v1/model/post.dart';

abstract class PostAPI {
  Future<List<Post>> getPosts();
}