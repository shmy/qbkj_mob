import 'dart:ui';

class QBKJCallback {
  final VoidCallback? onShow;
  final VoidCallback? onClick;
  final VoidCallback? onFail;
  final VoidCallback? onClose;

  QBKJCallback({
    this.onShow,
    this.onClick,
    this.onFail,
    this.onClose,
  });
}
