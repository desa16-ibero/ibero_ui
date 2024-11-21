import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class HeaderListTile extends StatelessWidget {
  final String pathIco;
  final String title;
  final String subTitle;
  final Color? colorBackgroundIcon;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleSubtitle;

  const HeaderListTile(
      {super.key,
        required this.pathIco,
        required this.title,
        required this.subTitle,
        this.colorBackgroundIcon,
        this.textStyleTitle,
        this.textStyleSubtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Container(
            decoration: BoxDecoration(
              color: colorBackgroundIcon ?? Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            width: 36,
            height: 36,
            padding: const EdgeInsets.fromLTRB(6.9, 6.4, 6.5, 7.1),
            child: SvgPicture.asset(
              pathIco,
              package: 'ibero_ui',
              colorFilter:
              ColorFilter.mode(UtilsUI.neutralColor[900]!, BlendMode.srcIn),
              height: 23,
              width: 23,
            ),
          ),
        ),
        Flexible(
          flex: 8,
          fit: FlexFit.tight,
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyleTitle ??
                      TextsUI.body1.copyWith(letterSpacing: 0),
                ),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyleSubtitle ?? TextsUI.body4,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            StringsSVG.infoCircle,
            height: 24,
            width: 24,
            alignment: Alignment.topRight,
            package: 'ibero_ui',
          ),
        ),
      ],
    );
  }
}
