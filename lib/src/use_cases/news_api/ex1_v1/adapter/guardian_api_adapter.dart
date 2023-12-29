import 'package:designs_pattern/src/use_cases/news_api/ex1_v1/model/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1/provider/guardian_provider.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1/provider/post_api.dart';

import '../model/response_api.dart';

class GuardianAPIAdapter implements PostAPI {
  final GuardianProvider _guardianAPIAdapter = GuardianProvider();

  @override
  Future<List<Post>> getPosts() async {
    ResponseApi responseApi = await _guardianAPIAdapter.getPosts();
    return List<Post>.from(
      responseApi.results.map(
        (x) => Post(
          titulo: x['webTitle'],
          secccion: x['sectionName'],
          direccionUrl: x['webUrl'],
        ),
      ),
    );
  }
}
