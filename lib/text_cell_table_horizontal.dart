import 'package:flutter/material.dart';

import 'utils/utils_ui.dart';

class TextCellTableHorizontal extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool alignText;
  final bool isTheLast;

  const TextCellTableHorizontal(
      {super.key,
      required this.text,
      required this.isHeader,
      required this.alignText,
      required this.isTheLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: isHeader ? const Color(0xFFF3F3F3) : null,
      child: Text(
        text,
        textAlign: alignText ? TextAlign.center : null,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.6,
          letterSpacing: -0.2,
          color:
              isHeader ? const Color(0xFF575757) : UtilsUI.iconGrayCustomColor,
        ),
      ),
    );
  }
}
