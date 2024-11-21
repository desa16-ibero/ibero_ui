import 'package:flutter/material.dart';

class CustomCardShadow extends StatelessWidget {
  final Widget content;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCardShadow(
      {super.key,
      required this.content,
      this.backgroundColor,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 16, right: 16),
      padding: padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: content,
    );
  }
}
