
import 'twilio_platform_interface.dart';

class Twilio {
  Future<String?> getPlatformVersion(String twilioAuthToken,String practitionerName) {
    //println("SYSOT");
    print("getPlatformVersion: T");
    //Log.d("TAG", "message")

    //println("other message")
    return TwilioPlatform.instance.getPlatformVersion(twilioAuthToken,practitionerName);
  }
}
