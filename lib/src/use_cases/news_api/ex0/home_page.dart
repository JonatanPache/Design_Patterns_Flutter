import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostAPI postAPI = PostAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: postAPI.getPosts().length,
                itemBuilder: (context, index) {
                  final posts = postAPI.getPosts()[index];
                  return ListTile(
                    title: Text(posts.title),
                    subtitle: Text(posts.bio),
                  );
                }),
          )
        ],
      ),
    );
  }
}
