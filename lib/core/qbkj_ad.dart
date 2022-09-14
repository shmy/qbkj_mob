import 'dart:async';

import 'package:flutter/services.dart';
import 'package:qbkj_mob/core/constant.dart';
import 'package:qbkj_mob/core/qbkj_callback.dart';
import 'package:qbkj_mob/core/stream_handler.dart';

class QBKJAd {
  QBKJAd._();

  static const MethodChannel _methodChannel =
      MethodChannel(Constant.methodChannel);

  static Future<bool> initAd(String appId) async {
    return await _methodChannel.invokeMethod('initAd', {"id": appId});
  }

  static Future<void> shortVideo(String adCode, String backText) async {
    await _methodChannel.invokeMethod('shortVideo', {"id": adCode, "backText": backText});
  }
  static Future<void> insertAd(String adCode, {QBKJCallback? callback}) async {
    late final StreamSubscription streamSubscription;
    streamSubscription = StreamHandler.listen(
        insertAdCallBack: QBKJCallback(
      onClick: callback?.onClick,
      onShow: callback?.onShow,
      onClose: () {
        callback?.onClose?.call();
        streamSubscription.cancel();
      },
      onFail: () {
        callback?.onFail?.call();
        streamSubscription.cancel();
      },
    ));
    await _methodChannel.invokeMethod('insertAd', {"id": adCode});
  }

  static Future<void> rewardAd(
    String adCode, {
    required String userId,
    QBKJCallback? callback,
  }) async {
    late final StreamSubscription streamSubscription;
    streamSubscription = StreamHandler.listen(
        rewardAdCallbck: QBKJCallback(
      onClick: callback?.onClick,
      onShow: callback?.onShow,
      onClose: () {
        callback?.onClose?.call();
        streamSubscription.cancel();
      },
      onFail: () {
        callback?.onFail?.call();
        streamSubscription.cancel();
      },
      onReward: callback?.onReward,
    ));
    await _methodChannel.invokeMethod('rewardAd', {
      "id": adCode,
      "userId": userId,
    });
  }
}
