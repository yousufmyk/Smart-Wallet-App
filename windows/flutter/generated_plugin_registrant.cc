//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <file_selector_windows/file_selector_windows.h>
#include <local_auth_windows/local_auth_plugin.h>
#include <modal_progress_hud_nsn/modal_progress_hud_nsn_plugin_c_api.h>
#include <nb_utils/nb_utils_plugin.h>
#include <smart_auth/smart_auth_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  LocalAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalAuthPlugin"));
  ModalProgressHudNsnPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ModalProgressHudNsnPluginCApi"));
  NbUtilsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("NbUtilsPlugin"));
  SmartAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SmartAuthPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
