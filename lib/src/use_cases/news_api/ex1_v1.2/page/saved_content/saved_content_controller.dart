import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/adapter/news_api_adapter.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/model/content.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/display_strategy.dart';
import 'package:flutter/cupertino.dart';
import '../../provider/post_api.dart';
import '../../utils/shared_pref.dart';

class SavedContentController{
  late BuildContext context;
  late Function refresh;
  late PostAPI _postAPI;
  late DisplayStrategy displayStrategy;

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

  void deleteContent(ContentModel contentModel) async {
    await PreferencesService.removeSavedContent(contentModel);
  }

  void saveContent(ContentModel contentModel) async {
    await PreferencesService.saveContent(contentModel.clone());
  }

  Future<List<ContentModel>> getSavedContent() async {
    return PreferencesService.getSavedContents();
  }

}