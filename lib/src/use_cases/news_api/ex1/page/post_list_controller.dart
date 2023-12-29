import 'package:designs_pattern/src/use_cases/news_api/ex1/model/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1/provider/post_api.dart';
import 'package:flutter/cupertino.dart';

class PostListController{
  late BuildContext context;
  late Function refresh;
  final PostAPI _postAPI = PostAPI();

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    this.refresh=refresh;
    refresh();
  }

  Future<List<Post>> getPosts() async {
    return await _postAPI.getPosts();
  }
}