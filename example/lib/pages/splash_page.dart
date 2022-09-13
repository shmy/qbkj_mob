import 'package:flutter/material.dart';
import 'package:qbkj_mob/core/qbkj_callback.dart';
import 'package:qbkj_mob/view/qbkj_splash_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QBKJSplashView(
      placeholder: (BuildContext context) {
        return Container(
            color: Colors.red, child: const Center(child: FlutterLogo()));
      },
      adCode: '1330512946933022784',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      callback: QBKJCallback(
        onFail: () {
          _onEnd(context);
        },
        onClick: () {
          _onEnd(context);
        },
        onClose: () {
          _onEnd(context);
        },
      ),
    );
  }

  void _onEnd(BuildContext context) {
    Navigator.of(context).pop();
  }
}
