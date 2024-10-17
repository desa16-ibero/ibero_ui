import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'utils/utils_ui.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final bool canBack;
  final bool? isOpenDrawer;
  final VoidCallback? onBackPressed;

  const CustomAppBar2(
      {super.key,
      required this.canBack,
      this.isOpenDrawer,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: UtilsUI.iconGrayCustomColor),
        automaticallyImplyLeading: canBack,
        leading: canBack
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: UtilsUI.redDarkCustomColor,
                ),
                onPressed: onBackPressed,
              )
            : null,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 28, right: 28, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: UtilsUI.redCustomColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SvgPicture.asset(
                'assets/new_images/logo.svg',
                semanticsLabel: 'logo',
                width: 90,
                height: 34.6,
              ),
            ),
            const Spacer(),
            isOpenDrawer != null
                ? Row(
                    children: [
                      IconButton(
                          icon: const Icon(FontAwesomeIcons.xmark),
                          onPressed: () => Navigator.of(context).pop()),
                      const SizedBox(width: 20),
                    ],
                  )
                : const Row(
                    children: [
                      Icon(
                        Icons.search_sharp,
                      ),
                      SizedBox(width: 30),
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
