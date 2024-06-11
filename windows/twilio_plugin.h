#ifndef FLUTTER_PLUGIN_TWILIO_PLUGIN_H_
#define FLUTTER_PLUGIN_TWILIO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace twilio {

class TwilioPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  TwilioPlugin();

  virtual ~TwilioPlugin();

  // Disallow copy and assign.
  TwilioPlugin(const TwilioPlugin&) = delete;
  TwilioPlugin& operator=(const TwilioPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace twilio

#endif  // FLUTTER_PLUGIN_TWILIO_PLUGIN_H_
