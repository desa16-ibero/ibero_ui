import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class HeaderGrayMenu extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? textButton;
  final VoidCallback? onTapButton;
  final Widget? button;

  const HeaderGrayMenu(
      {super.key,
      required this.title,
      required this.subtitle,
      this.textButton,
      this.onTapButton,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UtilsUI.neutralColor[700],
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextsUI.h5.copyWith(color: Colors.white, letterSpacing: 0),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextsUI.sub4.copyWith(color: Colors.white),
          ),
          if (button != null) ...[
            SizedBox(height: 10),
            Align(alignment: Alignment.center, child: button!)
          ]
        ],
      ),
    );
  }
}
