import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/display_strategy.dart';
import 'package:flutter/material.dart';
import '../model/content.dart';
import '../utils/bookmark.dart';

class ListViewStrategy implements DisplayStrategy {
  final void Function(ContentModel) savePostCallback;
  ListViewStrategy({ required this.savePostCallback});

  @override
  Widget buildItems(AsyncSnapshot<List<ContentModel>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              trailing: BookmarkIcon(
                onPressed: () {
                  savePostCallback(snapshot.data![index]);
                },
              ),
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                snapshot.data![index].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    snapshot.data![index].direccionUrl,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    snapshot.data![index].section,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      );
    }
  }
}