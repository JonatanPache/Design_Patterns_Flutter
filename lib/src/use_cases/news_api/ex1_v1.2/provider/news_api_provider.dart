import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class NewsAPIProvider{
  final String _url = 'newsapi.org';
  final String _api = '/v2/top-headlines';
  final String _key = dotenv.env['key_news_api'] ?? '';

  Future init() async{
    // this.context = context;
  }


  Future<List<dynamic>> getTopHeadlines() async{
    try{
      Uri url = Uri.https(_url, _api,{
        'country':'us',
        'pageSize':'3'
      });
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'X-Api-Key': _key
      };
      final res = await http.get(url,headers: headers);
      if(res.statusCode == 200){
        final data=json.decode(res.body);
        return data['articles'];
      }
    }catch(e){
      print('Error: $e');
    }
    return [];
  }

}