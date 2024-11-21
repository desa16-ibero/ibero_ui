import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/utils_ui.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: UtilsUI.neutralColor[300]!),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 28, right: 28, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: UtilsUI.primaryColor[700],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SvgPicture.asset(
                StringsSVG.logo,
                width: 90,
                height: 35,
                package: 'ibero_ui',
              ),
            ),
            const Spacer(),
            IconButton(
              icon: SvgPicture.asset(
                StringsSVG.menu,
                package: 'ibero_ui',
                colorFilter: ColorFilter.mode(
                    UtilsUI.neutralColor[900]!, BlendMode.srcIn),
              ),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
