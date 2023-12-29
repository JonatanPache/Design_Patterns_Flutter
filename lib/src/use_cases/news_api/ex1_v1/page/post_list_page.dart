import 'package:designs_pattern/src/use_cases/news_api/ex1_v1/page/post_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../model/post.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final PostListController _controller = PostListController();
  List<String> listTipo = ["GuardianApi"];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsApp-Object-Adapter-v1'),
      ),
      body: DefaultTabController(
        length: listTipo.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorColor: Colors.deepOrange,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[400],
                isScrollable: true,
                tabs: List<Widget>.generate(listTipo.length, (index) {
                  return Tab(
                    child: Text(listTipo[index] ?? ''),
                  );
                }),
              ),
            ),
          ),
          body: TabBarView(
            children: listTipo.map((String user) {
              return FutureBuilder(
                  future: _controller.getPosts(),
                  builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                    if (snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (_, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].titulo),
                              subtitle: Text(
                                snapshot.data![index].direccionUrl,
                              ),
                              trailing: Text(
                                snapshot.data![index].secccion,
                              ),
                              isThreeLine: true,
                            );
                            // return _cardProduct(snapshot.data![index]);
                          });
                    } else {
                      return Container();
                    }
                  });
            }).toList(),
          ),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
