import 'package:flutter/material.dart';

import 'utils/utils_ui.dart';

class DashedLineVertical extends CustomPainter {
  final double? stroke;

  const DashedLineVertical({this.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    final double dashHeight = 8;
    final double dashSpace = 3;
    double startY = 0;

    final paint = Paint()
      ..color = UtilsUI.neutralColor[900]!
      ..strokeWidth = stroke ?? 3;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  TrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = UtilsUI.neutralColor[900]!
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
