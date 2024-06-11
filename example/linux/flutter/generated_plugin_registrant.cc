//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <twilio/twilio_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) twilio_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TwilioPlugin");
  twilio_plugin_register_with_registrar(twilio_registrar);
}
