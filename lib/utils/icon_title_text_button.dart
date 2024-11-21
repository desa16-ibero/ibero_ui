import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/buttons_ui.dart';
import 'package:ibero_ui/custom_card_shadow.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';


class IconTitleTextButton extends StatelessWidget {
  final String title;
  final String pathIcon;
  final bool twoLines;
  final VoidCallback onTap;
  final String? textButton;

  const IconTitleTextButton(
      {super.key,
      required this.title,
      required this.pathIcon,
      required this.twoLines,
      required this.onTap,
      this.textButton});

  @override
  Widget build(BuildContext context) {
    return CustomCardShadow(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      margin: EdgeInsets.zero,
      content: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 9),
              Container(
                decoration: BoxDecoration(
                  color: UtilsUI.neutralColor[50],
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  package: 'ibero_ui',
                  pathIcon,
                  width: 27,
                  height: 27,
                  colorFilter: ColorFilter.mode(
                    UtilsUI.neutralColor[700]!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 11.7),
              Text(title, style: TextsUI.hc2),
            ],
          ),
          twoLines ? const SizedBox(height: 25) : const SizedBox(height: 40),
          Align(alignment: Alignment.centerRight,
            child: CustomButton(
              buttonType: ButtonType.card,
              buttonSize: ButtonSize.xl,
              label:  textButton ?? 'Ver más',
              iconPath: StringsSVG.arrowSolidRight,
              onPressed: onTap,

            ),
          ),
        ],
      ),
    );
  }
}
