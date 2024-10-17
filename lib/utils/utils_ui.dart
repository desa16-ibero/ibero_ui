import 'package:flutter/material.dart';

class UtilsUI {
  static Color whiteCustomColor = const Color(0xFFFDFCFA);
  static Color blackCustomColor = const Color(0xFF1E1E1E);
  static Color grayCustomColor = const Color(0xFF6F6F6F);
  static Color iconGrayCustomColor = const Color(0xFF1E1E1E);
  static Color redCustomColor = const Color(0xFFE00034);
  static Color redDarkCustomColor = const Color(0xFF9C0217);

  static Map<int, Color> color = {
    50: const Color.fromRGBO(224, 0, 52, .1),
    100: const Color.fromRGBO(224, 0, 52, .2),
    200: const Color.fromRGBO(224, 0, 52, .3),
    300: const Color.fromRGBO(224, 0, 52, .4),
    400: const Color.fromRGBO(224, 0, 52, .5),
    500: const Color.fromRGBO(224, 0, 52, .6),
    600: const Color.fromRGBO(224, 0, 52, .7),
    700: const Color.fromRGBO(224, 0, 52, .8),
    800: const Color.fromRGBO(224, 0, 52, .9),
    900: const Color.fromRGBO(224, 0, 52, 1),
  };

  static Map<int, Color> colorDark = {
    50: const Color.fromRGBO(156, 2, 23, .1),
    100: const Color.fromRGBO(156, 2, 23, .2),
    200: const Color.fromRGBO(156, 2, 23, .3),
    300: const Color.fromRGBO(156, 2, 23, .4),
    400: const Color.fromRGBO(156, 2, 23, .5),
    500: const Color.fromRGBO(156, 2, 23, .6),
    600: const Color.fromRGBO(156, 2, 23, .7),
    700: const Color.fromRGBO(156, 2, 23, .8),
    800: const Color.fromRGBO(156, 2, 23, .9),
    900: const Color.fromRGBO(156, 2, 23, 1),
  };

  static MaterialColor materialColor =
      MaterialColor(redCustomColor.value, color);
  static MaterialColor materialDarkColor =
      MaterialColor(redDarkCustomColor.value, colorDark);

  static ButtonStyle raisedWhiteButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: redDarkCustomColor,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(48),
      ),
      side: BorderSide(color: redDarkCustomColor, width: 0.8),
    ),
  );

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: redCustomColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(48)),
    ),
  );
}
