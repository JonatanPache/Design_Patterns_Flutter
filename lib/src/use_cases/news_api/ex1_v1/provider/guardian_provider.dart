import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

import '../model/response_api.dart';

class GuardianProvider{
  final String _url = 'content.guardianapis.com';
  final String _api = '/search';
  final String _key = dotenv.env['key_guardian'] ?? '';

  Future init() async{
    // this.context = context;
  }


  Future<ResponseApi> getPosts() async{
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
        return ResponseApi.fromMap(response);
      }
    }catch(e){
      print('Error: $e');
    }
    return ResponseApi.defaultRes();
  }

}