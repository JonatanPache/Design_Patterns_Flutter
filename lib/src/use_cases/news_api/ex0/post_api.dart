import 'package:designs_pattern/src/use_cases/news_api/ex0/i_post_api.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api_1_adapter.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api_2_adapter.dart';

class PostAPI implements IPostAPI {
  final api1 = PostAPI1Adapter();
  final api2 = PostAPI2Adapter();
  @override
  List<Post> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }
}