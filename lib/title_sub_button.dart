import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';

import 'buttons_ui.dart';

class TitleSubButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String textButton;
  final VoidCallback onTap;

  const TitleSubButton(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.textButton,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextsUI.h5.copyWith(letterSpacing: 0),
          ),
          SizedBox(height: 15),
          Text(
            subtitle,
            style: TextsUI.sub4.copyWith(letterSpacing: 0),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              buttonType: ButtonType.primary,
              buttonSize: ButtonSize.xl,
              label: textButton,
              iconPath: StringsSVG.arrowSolidRight,
              onPressed: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
