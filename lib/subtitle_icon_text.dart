import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

import 'buttons_ui.dart';
import 'custom_tooltip.dart';

class SubtitleIconText extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final Color? colorSubtitle;
  final String? infoTitle;
  final String? pathIcon;
  final String? textButton;
  final VoidCallback? onTap;
  final Widget? customTitle;

  const SubtitleIconText(
      {super.key,
      this.title,
      this.subtitle,
      this.colorSubtitle,
      this.infoTitle,
      this.pathIcon,
      this.textButton,
      this.onTap,
      this.customTitle});

  @override
  State<SubtitleIconText> createState() => _SubtitleIconTextState();
}

class _SubtitleIconTextState extends State<SubtitleIconText> {
  final GlobalKey _iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.infoTitle == null
            ? Text(
                widget.title!,
                style: TextsUI.label1,
              )
            : Row(
                mainAxisAlignment: widget.customTitle != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  widget.customTitle ??
                      Text(
                        widget.title!,
                        style: TextsUI.label1,
                      ),
                  SizedBox(width: 10),
                  GestureDetector(
                    key: _iconKey,
                    onTap: () {
                      CustomTooltip(
                        context: context,
                        message: widget.infoTitle!,
                        targetKey: _iconKey,
                      ).show();
                    },
                    child: SvgPicture.asset(
                      StringsSVG.infoCircle,
                      package: 'ibero_ui',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
        if (widget.subtitle != null) ...[
          SizedBox(height: 15),
          Text(
            widget.subtitle!,
            style: TextsUI.nUMBRESFocus.copyWith(
              color: widget.colorSubtitle,
            ),
          ),
        ],
        if (widget.textButton != null) ...[
          SizedBox(height: 5),
          CustomButton(
            buttonType: ButtonType.card,
            buttonSize: ButtonSize.xl,
            label: widget.textButton!,
            iconPath: widget.pathIcon!,
            onPressed: widget.onTap,
          ),
          Divider(
            color: UtilsUI.neutralColor[100],
            thickness: 1,
          ),
        ],
      ],
    );
  }
}
