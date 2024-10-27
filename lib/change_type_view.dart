import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/utils_ui.dart';

class ChangeTypeView extends StatelessWidget {
  final Function(bool value) returnValue;
  final bool isGridView;
  final String? title;

  const ChangeTypeView(
      {super.key,
      required this.isGridView,
      required this.returnValue,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? 'Vista',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.4,
                letterSpacing: -0.2,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 21.5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: UtilsUI.neutralColor[100]!,
                ),
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => returnValue(true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isGridView
                            ? UtilsUI.primaryColor[700]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      width: 45,
                      height: 45,
                      padding: const EdgeInsets.all(11.7),
                      child: SvgPicture.asset(
                        StringsSVG.dashboard4,
                        package: 'ibero_ui',
                        colorFilter: ColorFilter.mode(
                          isGridView ? Colors.white : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => returnValue(false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isGridView
                            ? Colors.white
                            : UtilsUI.primaryColor[700],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      width: 45,
                      height: 45,
                      padding: const EdgeInsets.all(11.7),
                      child: SvgPicture.asset(
                        StringsSVG.textVignette,
                        package: 'ibero_ui',
                        width: 45,
                        height: 45,
                        colorFilter: ColorFilter.mode(
                          isGridView ? Colors.black : Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
