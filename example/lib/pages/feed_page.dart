import 'package:flutter/material.dart';
import 'package:qbkj_mob/view/qbkj_banner_view.dart';
import 'package:qbkj_mob/view/qbkj_feed_view.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: QBKJFeedView(
              placeholder: (BuildContext context) {
                return Container(
                    color: Colors.red, child: const Center(child: FlutterLogo()));
              },
              height: 200,
              width: MediaQuery.of(context).size.width,
              adCode: '1330513366195650582',
            ),
          ),
        ],
      ),
    );
  }
}
