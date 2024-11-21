import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class HeaderIconTitle extends StatelessWidget {
  final String path;
  final String title;
  final String? subTitle;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleSubTitle;
  final double? circleSize;
  final double? iconSize;

  const HeaderIconTitle(
      {super.key,
        required this.path,
        required this.title,
        this.subTitle,
        this.textStyleTitle,
        this.textStyleSubTitle,
        this.circleSize,
        this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: UtilsUI.neutralColor[50],
            borderRadius: BorderRadius.circular(40),
          ),
          width: circleSize ?? 48,
          height: circleSize ?? 48,
          padding: const EdgeInsets.all(5),
          child: SvgPicture.asset(
            path,
            package: 'ibero_ui',
            width: iconSize ?? 36,
            height: iconSize ?? 36,
            colorFilter: ColorFilter.mode(
              UtilsUI.neutralColor[700]!,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 22),
        Column(
          children: [
            Text(
              title,
              style: textStyleTitle ?? TextsUI.hc1,
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: textStyleSubTitle ?? TextsUI.label1,
              ),
          ],
        ),
      ],
    );
  }
}
