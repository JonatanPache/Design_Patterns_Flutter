import 'package:designs_pattern/src/use_cases/news_api/ex1/model/post.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex1/page/post_list_controller.dart';
import 'package:designs_pattern/src/use_cases/news_api/ex0/post_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final PostAPI postAPI = PostAPI();
  final PostListController _controller = PostListController();

  List<String> listTipo = ["GuardianApi"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsApp'),
      ),
      body:  DefaultTabController(
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
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (_, index) {
                              return ListTile(
                                title: Text(snapshot.data![index].titulo),
                                subtitle: Text(snapshot.data![index].direccionUrl,),
                                trailing:Text(snapshot.data![index].secccion,) ,
                                  isThreeLine : true,
                              );
                              // return _cardProduct(snapshot.data![index]);
                            });
                      } else {
                        return Container();
                      }
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
