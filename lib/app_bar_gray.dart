import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class AppBarGray extends StatelessWidget {
  const AppBarGray({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UtilsUI.neutralColor[700],
      width: double.infinity,
      child: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/new_images/ibero_black_background.png',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              height: 62,
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    StringsSVG.logo,
                    width: 90,
                    height: 35,
                    package: 'ibero_ui',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
