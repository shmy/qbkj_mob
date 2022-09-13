import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qbkj_mob/core/qbkj_callback.dart';

class QBKJView extends StatefulWidget {
  final String adCode;
  final String viewType;
  final double width;
  final double height;
  final QBKJCallback? callback;
  final WidgetBuilder? placeholder;

  const QBKJView({
    Key? key,
    required this.adCode,
    required this.viewType,
    required this.width,
    required this.height,
    this.callback,
    this.placeholder,
  }) : super(key: key);

  @override
  State<QBKJView> createState() => _QBKJViewState();
}

class _QBKJViewState extends State<QBKJView> {
  String get viewType => widget.viewType;
  MethodChannel? _methodChannel;
  bool isExposed = false;
  bool isDismissed = false;

  @override
  void dispose() {
    _methodChannel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isDismissed) {
      return const SizedBox();
    }
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          if (widget.placeholder != null && !isExposed)
            Positioned.fill(
              child: widget.placeholder!.call(context),
            ),
          Positioned.fill(
            key: const Key('QBKJView'),
            child: SafeArea(
              child: Builder(builder: (BuildContext context) {
                final Map<String, dynamic> creationParams = <String, dynamic>{
                  "id": widget.adCode,
                  "width": widget.width,
                  "height": widget.height,
                };
                if (Platform.isAndroid) {
                  return AndroidView(
                    viewType: viewType,
                    creationParams: creationParams,
                    layoutDirection: TextDirection.ltr,
                    creationParamsCodec: const StandardMessageCodec(),
                    onPlatformViewCreated: _registerChannel,
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  void _registerChannel(int id) {
    _methodChannel = MethodChannel("${viewType}_$id");
    _methodChannel?.setMethodCallHandler(_platformCallHandler);
  }

  Future<dynamic> _platformCallHandler(MethodCall call) async {
    print('111 $call');
    switch (call.method) {
      case "onShow":
        setState(() {
          isExposed = true;
        });
        widget.callback?.onShow?.call();
        break;
      case "onClick":
        widget.callback?.onClick?.call();
        break;
      case "onError":
        setState(() {
          isDismissed = true;
        });
        widget.callback?.onFail?.call();
        break;
      case "onDismiss":
        setState(() {
          isDismissed = true;
        });
        widget.callback?.onClose?.call();
        break;
    }
  }
}
