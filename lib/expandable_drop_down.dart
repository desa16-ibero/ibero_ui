import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class ExpandableDropDown extends StatelessWidget {
  final bool isExpanded;
  final String? title;
  final String text;
  final Widget content;

  const ExpandableDropDown(
      {super.key,
      required this.isExpanded,
      this.title,
      required this.content,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              title!,
              style: TextsUI.label2.copyWith(color: UtilsUI.neutralColor[600]),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: UtilsUI.neutralColor[500]!, width: 1),
              color: Colors.white),
          child: Column(
            children: [
              ExpandableButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextsUI.body2
                          .copyWith(color: UtilsUI.neutralColor[500]),
                    ),
                    SvgPicture.asset(
                      isExpanded
                          ? StringsSVG.chevronUp
                          : StringsSVG.chevronDown,
                      package: 'ibero_ui',
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                          isExpanded
                              ? UtilsUI.primaryColor[700]!
                              : UtilsUI.neutralColor[500]!,
                          BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isExpanded) content
      ],
    );
  }
}
