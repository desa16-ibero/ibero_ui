import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class CustomCardButton extends StatelessWidget {
  final String pathIcon;
  final String text;
  final VoidCallback onTap;

  const CustomCardButton(
      {super.key,
      required this.pathIcon,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                offset: Offset(0, 1),
                blurRadius: 1,
                spreadRadius: -0.5),
          ],
        ),
        width: 240,
        height: 158,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              pathIcon,
              width: 80,
              height: 80,
              package: 'ibero_ui',
              colorFilter:
                  ColorFilter.mode(UtilsUI.neutralColor[700]!, BlendMode.srcIn),
            ),
            Flexible(
              child: Text(
                text,
                style: TextsUI.sub3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
