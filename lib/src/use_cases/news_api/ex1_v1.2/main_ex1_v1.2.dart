import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/list_content/content_list_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsApp-Object-Adapter-Many',
      home: ContentListPage(),
    );
  }
}