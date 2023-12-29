import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/adapter/news_api_adapter.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/display_strategy.dart';
import 'package:flutter/cupertino.dart';
import '../../adapter/guardian_api_adapter.dart';
import '../../model/content.dart';
import '../../model/news.dart';
import '../../model/post.dart';
import '../../provider/post_api.dart';
import '../../utils/shared_pref.dart';

class ContentListController{
  late BuildContext context;
  late Function refresh;
  late PostAPI _postAPI;
  late DisplayStrategy displayStrategy;

  ContentListController(this.displayStrategy);

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    refresh();
  }

  void setDisplayStrategy(DisplayStrategy strategy) {
    displayStrategy = strategy;
  }

  Widget showItems(AsyncSnapshot<List<ContentModel>> content) {
    return displayStrategy.buildItems(content);
  }
  
  Future<List<ContentModel>> getContents() async {
    try {
      _postAPI = GuardianAPIAdapter();
      List<Post> postList = await _postAPI.getPosts();

      _postAPI = NewsAPIAdapter();
      List<Post> newsList = await _postAPI.getPosts();

      List<ContentModel> contentList = [];
      contentList.addAll(exampleNewsList);
      contentList.addAll(postList);
      contentList.addAll(newsList);
      return contentList;
    } catch (error) {
      print('Error fetching posts: $error');
      return [];
    }
  }

  static void saveContent(ContentModel content) async {
    await PreferencesService.saveContent(content.clone());
  }



}



final List<NewsModel> exampleNewsList = [
  NewsModel(
    title: 'Flutter 2.5 Released',
    section: 'Technology',
    contentUrl: 'https://example.com/flutter-2.5',
    imageUrl: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/eldeber.png?t=2023-11-29T04%3A02%3A55.351Z',
    author: 'John Doe',
    publicationDate: DateTime(2023, 11, 25).toString(),
    type: 'news',
  ),
  NewsModel(
    title: 'SpaceX Launches New Satellite',
    section: 'Science',
    contentUrl: 'https://example.com/spacex-satellite',
    imageUrl: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/eldeber.png?t=2023-11-29T04%3A02%3A55.351Z',
    author: 'Jane Smith',
    publicationDate: DateTime(2023, 11, 24).toString(),
    type: 'news',
  ),
  NewsModel(
    title: 'Healthy Eating Tips',
    section: 'Lifestyle',
    contentUrl: 'https://example.com/healthy-eating-tips',
    imageUrl: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/eldeber.png?t=2023-11-29T04%3A02%3A55.351Z',
    author: 'Alice Johnson',
    publicationDate: DateTime(2023, 11, 23).toString(),
    type: 'news',
  ),
  NewsModel(
    title: 'New Movie Releases',
    section: 'Entertainment',
    contentUrl: 'https://example.com/new-movie-releases',
    imageUrl: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/eldeber.png?t=2023-11-29T04%3A02%3A55.351Z',
    author: 'Bob Anderson',
    publicationDate: DateTime(2023, 11, 22).toString(),
    type: 'news',
  ),
  NewsModel(
    title: 'Traveling on a Budget',
    section: 'Travel',
    contentUrl: 'https://example.com/traveling-budget',
    imageUrl: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/eldeber.png?t=2023-11-29T04%3A02%3A55.351Z',
    author: 'Eva Rodriguez',
    publicationDate: DateTime(2023, 11, 21).toString(),
    type: 'news',
  ),
];





// _postAPI = GuardianAPIAdapter();
// List<Post> list = await _postAPI.getPosts();
// _postAPI = NewsAPIAdapter();
// return list + await _postAPI.getPosts() + exampleNewsList;