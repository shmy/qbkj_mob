import 'package:flutter/material.dart';
import 'package:qbkj_mob/core/constant.dart';
import 'package:qbkj_mob/core/qbkj_callback.dart';
import 'package:qbkj_mob/view/qbkj_view.dart';

class QBKJBannerView extends QBKJView {
  final String adCode;
  final double width;
  final double height;
  final QBKJCallback? callback;
  final WidgetBuilder? placeholder;

  const QBKJBannerView({
    Key? key,
    required this.adCode,
    required this.width,
    required this.height,
    this.callback,
    this.placeholder,
  }) : super(
          key: key,
          adCode: adCode,
          viewType: Constant.bannerAdView,
          width: width,
          height: height,
          callback: callback,
          placeholder: placeholder,
        );
}
