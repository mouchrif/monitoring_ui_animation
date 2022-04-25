import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitoring_ui/constants.dart';

class CustomTheme {
  static ThemeData getlightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.tajawal().fontFamily,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: kBackgrounColor,
      );
  static ThemeData getDarkTheme(BuildContext context) => ThemeData();

  static Color getShade(Color color,
      {bool isDarker = false, double value = 0.1}) {
        assert(value>=0.0 && value<=1);
    HSLColor hsl = HSLColor.fromColor(color);
    HSLColor hslDark = hsl.withLightness(
        (isDarker ? (hsl.lightness + value) : (hsl.lightness - value)).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, isDarker: true),
      700: getShade(color, value: 0.15, isDarker: true),
      800: getShade(color, value: 0.2, isDarker: true),
      900: getShade(color, value: 0.25, isDarker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }
}
