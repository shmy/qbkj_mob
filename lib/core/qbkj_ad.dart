import 'package:flutter/services.dart';
import 'package:qbkj_mob/core/constant.dart';

class QBKJAd {
  QBKJAd._();

  static const MethodChannel _methodChannel =
      MethodChannel(Constant.methodChannel);

  static Future<bool> initAd(String appId) async {
    return await _methodChannel.invokeMethod('initAd', {"id": appId});
  }
}
