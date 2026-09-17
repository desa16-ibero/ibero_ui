import 'package:flutter/material.dart';

class UtilsUI {
  static const Map<int, Color> primaryColor = {
    50: Color.fromRGBO(252, 230, 235, 1),
    100: Color.fromRGBO(255, 189, 199, 1),
    300: Color.fromRGBO(255, 126, 144, 1),
    500: Color.fromRGBO(255, 58, 86, 1),
    700: Color.fromRGBO(207, 6, 34, 1),
    900: Color.fromRGBO(138, 0, 19, 1),
  };

  static const Map<int, Color> secondaryColor = {
    10: Color.fromRGBO(253, 252, 250, 1),
    50: Color.fromRGBO(245, 243, 241, 1),
    100: Color.fromRGBO(225, 220, 215, 1),
    300: Color.fromRGBO(206, 199, 190, 1),
    500: Color.fromRGBO(143, 133, 119, 1),
    700: Color.fromRGBO(112, 100, 93, 1),
    900: Color.fromRGBO(62, 56, 48, 1),
  };

  static const Map<int, Color> neutralColor = {
    30: Color.fromRGBO(248, 248, 248, 1),
    50: Color.fromRGBO(243, 243, 243, 1),
    100: Color.fromRGBO(216, 216, 216, 1),
    200: Color.fromRGBO(188, 188, 188, 1),
    300: Color.fromRGBO(162, 162, 162, 1),
    400: Color.fromRGBO(136, 136, 136, 1),
    500: Color.fromRGBO(111, 111, 111, 1),
    600: Color.fromRGBO(87, 87, 87, 1),
    700: Color.fromRGBO(60, 59, 59, 1),
    800: Color.fromRGBO(42, 42, 42, 1),
    900: Color.fromRGBO(30, 30, 30, 1),
    975: Color.fromRGBO(30, 30, 30, 0.7),
  };

  static const Map<int, Color> successColor = {
    50: Color.fromRGBO(245, 252, 228, 1),
    100: Color.fromRGBO(239, 251, 209, 1),
    300: Color.fromRGBO(187, 231, 115, 1),
    500: Color.fromRGBO(107, 175, 29, 1),
    700: Color.fromRGBO(63, 125, 14, 1),
    900: Color.fromRGBO(32, 83, 5, 1),
  };

  static const Map<int, Color> warningColor = {
    50: Color.fromRGBO(255, 247, 235, 1),
    100: Color.fromRGBO(255, 246, 214, 1),
    300: Color.fromRGBO(255, 218, 133, 1),
    500: Color.fromRGBO(255, 179, 53, 1),
    700: Color.fromRGBO(183, 112, 26, 1),
    900: Color.fromRGBO(122, 62, 10, 1),
  };

  static const Map<int, Color> errorColor = {
    50: Color.fromRGBO(252, 227, 246, 1),
    100: Color.fromRGBO(249, 207, 239, 1),
    300: Color.fromRGBO(223, 109, 214, 1),
    500: Color.fromRGBO(138, 22, 149, 1),
    700: Color.fromRGBO(83, 11, 107, 1),
    900: Color.fromRGBO(63, 5, 105, 1),
  };

  static MaterialColor materialColor =
      MaterialColor(primaryColor[500]!.toARGB32(), primaryColor);
  static MaterialColor materialDarkColor =
      MaterialColor(secondaryColor[500]!.toARGB32(), secondaryColor);

  static ButtonStyle raisedWhiteButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: primaryColor[700],
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(48),
      ),
      side: BorderSide(color: primaryColor[700]!, width: 0.8),
    ),
  );

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: primaryColor[700],
    disabledForegroundColor: neutralColor[600],
    disabledBackgroundColor: neutralColor[100],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(48)),
    ),
  );

  static Color primaryGrayDark = Color.fromRGBO(30, 30, 30, 1);
  static const Color primaryRed = Color.fromRGBO(231, 52, 57, 1);

}
