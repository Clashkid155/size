//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <size/size_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) size_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SizePlugin");
  size_plugin_register_with_registrar(size_registrar);
}
