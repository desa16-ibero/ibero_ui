import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/utils_ui.dart';

class HeaderIconTitle extends StatelessWidget {
  final String path;
  final String title;

  const HeaderIconTitle({super.key, required this.path, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(40),
            ),
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(11.7),
            child: SvgPicture.asset(
              path,
              semanticsLabel: 'ico',
            ),
          ),
          const SizedBox(width: 22),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              height: 1.3,
              color: UtilsUI.iconGrayCustomColor,
            ),
          ),
        ],
      ),
    );
  }
}
