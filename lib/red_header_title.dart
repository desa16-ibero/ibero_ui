import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/utils_ui.dart';

class RedHeaderTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? textButton;
  final VoidCallback? onPressed;

  const RedHeaderTitle(
      {super.key,
      required this.title,
      this.subtitle,
      this.textButton,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 19, 12),
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      color: UtilsUI.primaryColor[700],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle == null
              ? Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    height: 1.4,
                    color: Colors.white,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        height: 1.3,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 2.1,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 23),
          onPressed != null
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  height: 48,
                  child: ElevatedButton(
                    style: UtilsUI.raisedWhiteButtonStyle,
                    onPressed: onPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textButton!,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          StringsSVG.arrowDownEdgeDown,
                          width: 10,
                          height: 17.5,
                          package: 'ibero_ui',
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
