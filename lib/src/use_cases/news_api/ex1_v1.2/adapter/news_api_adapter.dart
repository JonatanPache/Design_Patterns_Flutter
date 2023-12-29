import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/provider/news_api_provider.dart';
import '../model/post.dart';
import '../provider/post_api.dart';

class NewsAPIAdapter implements PostAPI {
  final _newsProvider = NewsAPIProvider();

  @override
  Future<List<Post>> getPosts() async {
    List<dynamic> list = await _newsProvider.getTopHeadlines();
    return List<Post>.from(
      list.map(
        (x) => Post(
            title: x['title'],
            section: x['source']['name'],
            direccionUrl: x['url'],
            imageUrl: x['urlToImage'] ?? '',
            content: x['content'],
            type: 'post'),
      ),
    );
  }
}
