#include "include/twilio/twilio_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "twilio_plugin.h"

void TwilioPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  twilio::TwilioPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
