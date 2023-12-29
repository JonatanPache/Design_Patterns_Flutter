import '../model/post.dart';
import '../model/response_api.dart';
import '../provider/guardian_provider.dart';
import '../provider/post_api.dart';

class GuardianAPIAdapter implements PostAPI {
  final _guardianProvider = GuardianProvider();

  @override
  Future<List<Post>> getPosts() async {
    ResponseApi responseApi = await _guardianProvider.search();
    return List<Post>.from(
      responseApi.results.map(
        (x) => Post(
            title: x['webTitle'],
            section: x['sectionName'],
            direccionUrl: x['webUrl'],
            imageUrl: x['urlToImage'] ?? "",
            content: '',
            type: 'post'),
      ),
    );
  }
}
