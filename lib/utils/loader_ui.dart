import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class NewtonsCradleLoader extends StatefulWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;

  const NewtonsCradleLoader({
    super.key,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  State<NewtonsCradleLoader> createState() => _NewtonsCradleLoaderState();
}

class _NewtonsCradleLoaderState extends State<NewtonsCradleLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstBallAnimation;
  late Animation<double> _lastBallAnimation;

  @override
  void initState() {
    super.initState();

    final double maxAngleDegrees = 110;
    final double maxAngle = math.pi * maxAngleDegrees / 180;

    _controller = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    _firstBallAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: maxAngle,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: maxAngle,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 25,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(0), weight: 50),
    ]).animate(_controller);

    _lastBallAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween<double>(0), weight: 50),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -maxAngle,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -maxAngle,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 25,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBall({Animation<double>? animation}) {
    return SizedBox(
      width: 16,
      child: AnimatedBuilder(
        animation: animation ?? _controller,
        builder: (context, child) {
          final double angle = animation != null ? animation.value : 0;
          final bool isMoving = angle != 0;
          final Color color = isMoving
              ? widget.foregroundColor ?? UtilsUI.primaryColor[700]!
              : widget.backgroundColor ?? Colors.white;
          return Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()..rotateZ(angle),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBall(animation: _firstBallAnimation),
        _buildBall(),
        _buildBall(),
        _buildBall(animation: _lastBallAnimation),
      ],
    );
  }
}

class LoaderUI {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    String? message,
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    if (_overlayEntry != null) return;

    final overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ModalBarrier(dismissible: false, color: UtilsUI.neutralColor[975]),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message ?? 'Espera un momento\npor favor',
                    style: TextsUI.h5.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: NewtonsCradleLoader(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  static void dismiss() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
