import 'package:flutter_test/flutter_test.dart';
import 'package:twilio/twilio.dart';
import 'package:twilio/twilio_platform_interface.dart';
import 'package:twilio/twilio_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTwilioPlatform
    with MockPlatformInterfaceMixin
    implements TwilioPlatform {

  @override
  Future<String?> getPlatformVersion(String? twilioAuthToken,String? practitionerName) => Future.value('42');
}

void main() {
  final TwilioPlatform initialPlatform = TwilioPlatform.instance;

  test('$MethodChannelTwilio is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTwilio>());
  });

  test('getPlatformVersion', () async {
    Twilio twilioPlugin = Twilio();
    MockTwilioPlatform fakePlatform = MockTwilioPlatform();
    TwilioPlatform.instance = fakePlatform;

    expect(await twilioPlugin.getPlatformVersion("",""), '42');
  });
}
