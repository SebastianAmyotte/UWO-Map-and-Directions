import 'package:flutter/material.dart';
import 'package:gui_only/classes/app_style_properties.dart';

// Defile light theme
ThemeData _lightThemeData = ThemeData(
    colorScheme: const ColorScheme.light(
  primary: AppStyleProperties.uwoshYellow,
  secondary: Color(0x00ffffff),
  surface: Color(0xffcf6679),
  background: Color(0xff121212),
  error: Color(0xffcf6679),
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.light,
));

// Define dark theme
ThemeData _darkThemeData = ThemeData(
    colorScheme: const ColorScheme.dark(
  primary: Color.fromARGB(255, 221, 221, 221),
  secondary: AppStyleProperties.uwoshYellow,
  surface: Color.fromARGB(255, 27, 27, 27),
  background: Color(0x00ffffff),
  error: Colors.red,
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Color.fromARGB(255, 255, 255, 255),
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.dark,
));

// Class used to get the theme style to apply to the app
class ThemeStyle {
  // Gets the theme data for the app
  static ThemeData getThemeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? _darkThemeData : _lightThemeData;
  }
}
