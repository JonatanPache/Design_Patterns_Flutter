import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/content.dart';

class PreferencesService {
  static const String _keySavedPosts = 'savedContents';

  static Future<void> saveContent(ContentModel content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedContents = prefs.getStringList(_keySavedPosts);
    savedContents ??= [];
    savedContents.add(json.encode(content.toJson()));
    prefs.setStringList(_keySavedPosts, savedContents);
  }

  static Future<List<ContentModel>> getSavedContents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedContents = prefs.getStringList(_keySavedPosts);
    if (savedContents == null) {
      return [];
    }
    List<ContentModel> contents = savedContents.map((String jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return ContentModel.fromJson(jsonMap);
    }).toList();
    return contents;
  }

  static Future<void> removeSavedContent(ContentModel content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedContents = prefs.getStringList(_keySavedPosts);
    if (savedContents == null) {
      return;
    }
    savedContents.removeWhere((String jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return ContentModel.fromJson(jsonMap) == content;
    });
    prefs.setStringList(_keySavedPosts, savedContents);
  }
}
