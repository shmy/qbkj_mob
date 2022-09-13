import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qbkj_mob_method_channel.dart';

abstract class QbkjMobPlatform extends PlatformInterface {
  /// Constructs a QbkjMobPlatform.
  QbkjMobPlatform() : super(token: _token);

  static final Object _token = Object();

  static QbkjMobPlatform _instance = MethodChannelQbkjMob();

  /// The default instance of [QbkjMobPlatform] to use.
  ///
  /// Defaults to [MethodChannelQbkjMob].
  static QbkjMobPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QbkjMobPlatform] when
  /// they register themselves.
  static set instance(QbkjMobPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
