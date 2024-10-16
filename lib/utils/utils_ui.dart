import 'package:flutter/material.dart';

class UtilsUI {
  static Color whiteCustomColor = const Color(0xFFFDFCFA);
  static Color blackCustomColor = const Color(0xFF1E1E1E);
  static Color grayCustomColor = const Color(0xFF6F6F6F);
  static Color iconGrayCustomColor = const Color(0xFF1E1E1E);
  static Color redCustomColor = const Color(0xFFE00034);
  static Color redDarkCustomColor = const Color(0xFF9C0217);

  static ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
    foregroundColor: redDarkCustomColor,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(48),
      ),
      side: BorderSide(color: redDarkCustomColor, width: 0.8),
    ),
  );
}


extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameYM(DateTime other) {
    return year == other.year && month == other.month;
  }

  DateTime startOfWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }
}