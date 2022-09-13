import 'package:flutter_test/flutter_test.dart';
import 'package:qbkj_mob/qbkj_mob.dart';
import 'package:qbkj_mob/qbkj_mob_platform_interface.dart';
import 'package:qbkj_mob/qbkj_mob_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQbkjMobPlatform
    with MockPlatformInterfaceMixin
    implements QbkjMobPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QbkjMobPlatform initialPlatform = QbkjMobPlatform.instance;

  test('$MethodChannelQbkjMob is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQbkjMob>());
  });

  test('getPlatformVersion', () async {
    QbkjMob qbkjMobPlugin = QbkjMob();
    MockQbkjMobPlatform fakePlatform = MockQbkjMobPlatform();
    QbkjMobPlatform.instance = fakePlatform;

    expect(await qbkjMobPlugin.getPlatformVersion(), '42');
  });
}
