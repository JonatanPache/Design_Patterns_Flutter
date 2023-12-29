import 'package:flutter/material.dart';
import '../model/content.dart';
import '../utils/bookmark.dart';
import 'display_strategy.dart';

class GridViewStrategy implements DisplayStrategy {
  final void Function(ContentModel) savePostCallback;
  GridViewStrategy({required this.savePostCallback});

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
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Stack(
              children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: snapshot.data![index].imageUrl.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            child: Image.network(
                              snapshot.data![index].imageUrl,
                              fit: BoxFit.contain,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/the-guardian.png',
                              width: 80,
                              height: 80,
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          snapshot.data![index].direccionUrl,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          snapshot.data![index].section,
                          style: const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: BookmarkIcon(
                    onPressed: () {
                      savePostCallback(snapshot.data![index]);
                    },
                  ),
                ),
              ]
            ),
          );
        },
      );
    }
  }
}
