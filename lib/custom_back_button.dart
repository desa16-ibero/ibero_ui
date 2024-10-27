import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/utils_ui.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onBack;

  const CustomBackButton({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: GestureDetector(
        onTap: onBack,
        child: Row(
          children: [
            SvgPicture.asset(
              StringsSVG.arrowLeft,
              colorFilter: ColorFilter.mode(
                UtilsUI.neutralColor[900]!,
                BlendMode.srcIn,
              ),
              package: 'ibero_ui',
            ),
            SizedBox(width: 16),
            Text(
              'REGRESAR',
              style: TextStyle(
                color: const Color.fromRGBO(30, 30, 30, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 3.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
