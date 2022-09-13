import 'package:flutter/material.dart';
import 'package:qbkj_mob/view/qbkj_banner_view.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: QBKJBannerView(
              placeholder: (BuildContext context) {
                return Container(
                    color: Colors.red, child: const Center(child: FlutterLogo()));
              },
              height: 100,
              width: MediaQuery.of(context).size.width,
              adCode: '1330513198897446943',
            ),
          ),
          Container(
            color: Colors.black,
            child: QBKJBannerView(
              placeholder: (BuildContext context) {
                return Container(
                    color: Colors.red, child: const Center(child: FlutterLogo()));
              },
              height: 100,
              width: MediaQuery.of(context).size.width,
              adCode: '1330513198897446943',
            ),
          ),
        ],
      ),
    );
  }
}
