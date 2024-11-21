import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class CustomStepper extends StatelessWidget {
  final int step;
  final List<String> lstPathIcons;

  const CustomStepper(
      {super.key, required this.step, required this.lstPathIcons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(step, (index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _step(index),
            if (step > 1 && index == 0)
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: SizedBox(
                  width: 65,
                  child: Divider(
                    color: UtilsUI.neutralColor[100],
                    thickness: 2,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _step(int index) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    bool showChevron;
    String pathIcon = lstPathIcons[index];
    if (step == 1) {
      backgroundColor = UtilsUI.neutralColor[50]!;
      borderColor = UtilsUI.neutralColor[700]!;
      textColor = UtilsUI.neutralColor[900]!;
      showChevron = true;
    } else if (index == 0) {
      backgroundColor = UtilsUI.successColor[50]!;
      borderColor = UtilsUI.successColor[700]!;
      textColor = UtilsUI.successColor[700]!;
      showChevron = false;
    } else {
      backgroundColor = UtilsUI.neutralColor[50]!;
      borderColor = UtilsUI.neutralColor[700]!;
      textColor = UtilsUI.neutralColor[900]!;
      showChevron = true;
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            pathIcon,
            width: 24,
            height: 24,
            package: 'ibero_ui',
            colorFilter: ColorFilter.mode(borderColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'PASO ${index + 1}',
          style: TextsUI.label2.copyWith(
            color: textColor,
          ),
        ),
        SizedBox(height: 15),
        if (showChevron)
          SvgPicture.asset(
            StringsSVG.chevronDown,
            package: 'ibero_ui',
          ),
      ],
    );
  }
}
