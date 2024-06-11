import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'twilio_method_channel.dart';

abstract class TwilioPlatform extends PlatformInterface {
  /// Constructs a TwilioPlatform.
  TwilioPlatform() : super(token: _token);

  static final Object _token = Object();

  static TwilioPlatform _instance = MethodChannelTwilio();

  /// The default instance of [TwilioPlatform] to use.
  ///
  /// Defaults to [MethodChannelTwilio].
  static TwilioPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TwilioPlatform] when
  /// they register themselves.
  static set instance(TwilioPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion(String? twilioAuthToken,String? practitionerName) {
    //println("SYSOT");
    print("getPlatformVersion: PI");
    print("getPlatformVersion: PI$twilioAuthToken");
    print("getPlatformVersion: PI$practitionerName");
    //Log.d("TAG", "message")

    //println("other message")
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
