import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:qbkj_mob/core/constant.dart';
import 'package:qbkj_mob/core/qbkj_callback.dart';
import 'package:qbkj_mob/core/stream_handler.dart';

class QBKJAd {
  QBKJAd._();

  static bool isAndroid = Platform.isAndroid;

  static const MethodChannel _methodChannel =
      MethodChannel(Constant.methodChannel);

  static Future<bool> initAd(String appId) async {
    if (isAndroid) {
      return await _methodChannel.invokeMethod('initAd', {"id": appId});
    }
    return true;
  }

  static void insertAd(String adCode, {QBKJCallback? callback}) {
    if (!isAndroid) {
      callback?.onClose?.call();
      return;
    }
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
    _methodChannel.invokeMethod('insertAd', {"id": adCode});
  }

  static void rewardAd(
    String adCode, {
    required String userId,
    QBKJCallback? callback,
  }) {
    if (!isAndroid) {
      callback?.onReward?.call();
      callback?.onClose?.call();
      return;
    }
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
    _methodChannel.invokeMethod('rewardAd', {
      "id": adCode,
      "userId": userId,
    });
  }
}
