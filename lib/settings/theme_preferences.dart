import 'package:gui_only/classes/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Class used to save and retrieve selected theme data on the device
class ThemePreference {
  // Save the selected theme to the device, true for dark, false for light
  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.appTheme, value);
  }

  // Gets the theme saved on the device, true for dark, false for light
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.appTheme) ?? false;
  }
}
