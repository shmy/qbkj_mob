
import 'qbkj_mob_platform_interface.dart';

class QbkjMob {
  Future<String?> getPlatformVersion() {
    return QbkjMobPlatform.instance.getPlatformVersion();
  }
}
