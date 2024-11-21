import 'package:flutter/material.dart';

class DiagonalClip extends CustomClipper<Path> {
  final bool isLeftSide;
  final double clipSize;

  DiagonalClip({required this.isLeftSide, required this.clipSize});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (isLeftSide) {
      path.lineTo(0, 0);
      path.lineTo(0, size.height - clipSize);
      path.quadraticBezierTo(clipSize, size.height, clipSize, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.close();
    } else {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width - clipSize, size.height);
      path.quadraticBezierTo(size.width, size.height - clipSize, size.width, size.height - clipSize);
      path.lineTo(size.width, 0);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}