import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http_example/post.dart';
import 'package:http_example/post_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    var postDatas = postProvider.getPostList();
    // _fetchPosts();

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'text1'
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: postDatas.length,
          itemBuilder: (context, index) {
            final post = postDatas[index];
            return listTitle(post.title, post.body);
          },
        ),
      ),
    );
  }

  Widget listTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlatformText(
            title,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          PlatformText(
            subtitle,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
