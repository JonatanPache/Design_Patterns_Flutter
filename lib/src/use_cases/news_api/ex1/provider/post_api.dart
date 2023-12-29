import 'dart:convert';
import 'package:designs_pattern/src/use_cases/news_api/ex1/model/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1/model/response_api.dart';
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostAPI{
  String _url = 'content.guardianapis.com';
  String _api = '/search';
  final String _key = dotenv.env['key_guardian'] ?? '';

  Future init() async{
    // this.context = context;
  }


  Future<List<Post>> getPosts() async{
    List<Post> list = [];
    try{
      Uri url = Uri.https(_url, _api);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'api-key': _key
      };
      final res = await http.get(url,headers: headers);
      if(res.statusCode == 200){
        final data=json.decode(res.body);
        Map<String, dynamic> response = data['response'];
        ResponseApi responseApi = ResponseApi.fromMap(response);
        return List<Post>.from(
            responseApi.results.map((x) =>
                Post(
                  titulo: x['webTitle'],
                  secccion: x['sectionName'],
                  direccionUrl: x['webUrl']
                )
            )
        );
      }
    }catch(e){
      print('Error: $e');
    }
    return list;
  }

}