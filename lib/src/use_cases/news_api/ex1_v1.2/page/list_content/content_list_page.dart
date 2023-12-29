import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/model/content.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/list_content/content_list_controller.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1_v1.2/page/saved_content/saved_content_page.dart';
import 'package:flutter/material.dart';
import '../grid_view_strategy.dart';
import '../list_view_strategy.dart';

class ContentListPage extends StatefulWidget {
  const ContentListPage({super.key});

  @override
  State<ContentListPage> createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {
  final ContentListController controller = ContentListController(
      ListViewStrategy(savePostCallback: ContentListController.saveContent));

  // final ContentListController controller = ContentListController(ListViewStrategy(savePostCallback: controller.saveContent));

  @override
  void initState() {
    super.initState();
    controller.init(context, refresh);
    // controller.setDisplayStrategy(
    //     ListViewStrategy(savePostCallback: controller.saveContent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Deber'),
        actions: [
          IconButton(
            icon: Icon(controller.displayStrategy is ListViewStrategy
                ? Icons.grid_on
                : Icons.list),
            onPressed: () {
              setState(() {
                if (controller.displayStrategy is ListViewStrategy) {
                  controller.setDisplayStrategy(GridViewStrategy(
                      savePostCallback: ContentListController.saveContent));
                } else {
                  controller.setDisplayStrategy(ListViewStrategy(
                      savePostCallback: ContentListController.saveContent));
                }
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Noticias Guardadas'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SavedContentPage(), // Usa la nueva página de noticias guardadas
                  ),
                );
              },
            ),
            // Puedes agregar más opciones en el Drawer si es necesario
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ContentModel>>(
              future: controller.getContents(),
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
