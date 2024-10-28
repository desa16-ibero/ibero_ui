import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/utils_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0.5,
        shape: Border(
          bottom: BorderSide(color: UtilsUI.neutralColor[300]!, width: 0.5),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: UtilsUI.neutralColor[900]),
        automaticallyImplyLeading: false,
        title: Row(
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
                height: 34.6,
                package: 'ibero_ui',
              ),
            ),
            const Spacer(),
            !scaffoldKey.currentState!.isDrawerOpen
                ? IconButton(
                    icon: SvgPicture.asset(
                      StringsSVG.cancel1,
                      package: 'ibero_ui',
                    ),
                    onPressed: () => scaffoldKey.currentState!.openDrawer())
                : IconButton(
                    icon: SvgPicture.asset(
                      StringsSVG.menu,
                      package: 'ibero_ui',
                    ),
                    onPressed: () => scaffoldKey.currentState!.closeDrawer()),
          ],
        ),
        titleSpacing: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
