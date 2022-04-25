import 'package:flutter/material.dart';

class AppColors {
  static Color getShade(Color color,
      {bool isDarker = false, double value = 0.1}) {
    assert(value >= 0.0 && value <= 1);
    HSLColor hsl = HSLColor.fromColor(color);
    HSLColor hslDark = hsl.withLightness(
        (isDarker ? (hsl.lightness + value) : (hsl.lightness - value))
            .clamp(0.0, 1.0));
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

  static double getPositionY(GlobalKey key) {
    final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    return position.dy;
  }
}
