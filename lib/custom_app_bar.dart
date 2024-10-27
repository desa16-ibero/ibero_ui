import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/utils_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isOpenDrawer;

  const CustomAppBar({super.key, this.isOpenDrawer});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: UtilsUI.neutralColor[900]),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 28, right: 28, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: UtilsUI.primaryColor[500],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SvgPicture.asset(
                'assets/svg/logo.svg',
                width: 90,
                height: 34.6,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/menu.svg',
                    ),
                    onPressed: () => Navigator.of(context).pop()),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
        titleSpacing: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
