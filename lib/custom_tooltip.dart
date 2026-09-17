import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/texts_ui.dart';

class CustomTooltip {
  final OverlayEntry _overlayEntry;
  final BuildContext context;
  final String message;
  final GlobalKey targetKey;

  CustomTooltip({
    required this.context,
    required this.message,
    required this.targetKey,
  }) : _overlayEntry = _createOverlayEntry(context, message, targetKey);

  static OverlayEntry _createOverlayEntry(
    BuildContext context,
    String message,
    GlobalKey targetKey,
  ) {
    final RenderBox renderBox =
        targetKey.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            top: offset.dy - 90,
            left: offset.dx - 100 + renderBox.size.width / 2,
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tooltip Box
                  Container(
                    padding: EdgeInsets.all(8.0),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      message,
                      style: TextsUI.sub4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Arrow pointing down
                  ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      color: Colors.white,
                      height: 10,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    Overlay.of(context).insert(_overlayEntry);
    Future.delayed(Duration(seconds: 2), () {
      hide();
    });
  }

  void hide() {
    _overlayEntry.remove();
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
