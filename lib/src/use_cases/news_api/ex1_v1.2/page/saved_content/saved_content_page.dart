import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/model/content.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/saved_content/saved_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/list_view_strategy.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/grid_view_strategy.dart';

class SavedContentPage extends StatefulWidget {
  const SavedContentPage({Key? key}) : super(key: key);

  @override
  _SavedContentPageState createState() => _SavedContentPageState();
}

class _SavedContentPageState extends State<SavedContentPage> {
  final SavedContentController controller = SavedContentController();

  @override
  void initState() {
    super.initState();
    controller.init(context, refresh);
    controller.setDisplayStrategy(
        ListViewStrategy(savePostCallback: controller.saveContent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias Guardadas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(controller.displayStrategy is ListViewStrategy
                ? Icons.grid_on
                : Icons.list),
            onPressed: () {
              setState(() {
                if (controller.displayStrategy is ListViewStrategy) {
                  controller.setDisplayStrategy(
                      GridViewStrategy(savePostCallback: controller.saveContent));
                } else {
                  controller.setDisplayStrategy(
                      ListViewStrategy(savePostCallback: controller.saveContent));
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ContentModel>>(
              future: controller.getSavedContent(), // Obtener noticias guardadas
              builder: (context, snapshot) {
                return controller.showItems(snapshot);
              },
            ),
          ),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
