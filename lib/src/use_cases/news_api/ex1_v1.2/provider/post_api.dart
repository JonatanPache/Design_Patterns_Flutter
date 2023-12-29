import '../model/post.dart';

abstract class PostAPI {
  Future<List<Post>> getPosts();
}