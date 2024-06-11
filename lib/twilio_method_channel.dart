import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'twilio_platform_interface.dart';

/// An implementation of [TwilioPlatform] that uses method channels.
class MethodChannelTwilio extends TwilioPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('twilio');

  @override
  Future<String?> getPlatformVersion(String? twilioAuthToken,String? practitionerName) async {
    //println("SYSOT");
    print("getPlatformVersion: MC");
    print("twilioAuthToken: MC$twilioAuthToken");
    print("twilioAuthToken: MC$practitionerName");
    //Log.d("TAG", "message")

    //println("other message")
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion',[{"twilioAuthToken":twilioAuthToken},{"practitionerName":practitionerName}]);
    return version;
  }
}
