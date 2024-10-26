import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/utils_ui.dart';

class HeaderListTile extends StatelessWidget {
  final String pathIco;
  final String title;
  final String subTitle;
  final Color? colorBackgroundIcon;

  const HeaderListTile(
      {super.key,
      required this.pathIco,
      required this.title,
      required this.subTitle,
      this.colorBackgroundIcon});

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
            child: SvgPicture.asset(pathIco),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 1.3,
                    color: UtilsUI.neutralColor[900],
                  ),
                ),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.3,
                    color: UtilsUI.neutralColor[900],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/svg/info_circle_ico.svg',
            height: 24,
            width: 24,
            alignment: Alignment.topRight,
          ),
        ),
      ],
    );
  }
}
