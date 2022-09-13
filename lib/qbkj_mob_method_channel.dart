import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qbkj_mob_platform_interface.dart';

/// An implementation of [QbkjMobPlatform] that uses method channels.
class MethodChannelQbkjMob extends QbkjMobPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qbkj_mob');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
