import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

import 'buttons_ui.dart';
import 'custom_card_shadow.dart';
import 'header_icon_title.dart';

class CarouselMenu extends StatefulWidget {
  final Map<String, dynamic> mapCarouselMenu;
  final Function(int) onItemSelected;

  const CarouselMenu(
      {super.key, required this.mapCarouselMenu, required this.onItemSelected});

  @override
  State<CarouselMenu> createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomCardShadow(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      backgroundColor: UtilsUI.neutralColor[700],
      content: Container(
        padding: const EdgeInsets.fromLTRB(19, 16, 19, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.mapCarouselMenu['title'],
              style: TextsUI.h5.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: RawScrollbar(
                controller: scrollController,
                interactive: true,
                thumbColor: UtilsUI.neutralColor[50],
                thickness: 10,
                thumbVisibility: true,
                radius: const Radius.circular(48),
                trackColor: UtilsUI.neutralColor[700],
                trackVisibility: true,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.mapCarouselMenu['options'].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      width: 270,
                      padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      margin: const EdgeInsets.only(right: 20, bottom: 13),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: HeaderIconTitle(
                              title: widget
                                  .mapCarouselMenu['options'][index].title,
                              path:
                                  widget.mapCarouselMenu['options'][index].path,
                              textStyleTitle: TextsUI.hc2,
                              circleSize: 40,
                              iconSize: 27,
                            ),
                          ),
                          widget.mapCarouselMenu['options'][index].twoLines
                              ? const SizedBox(height: 25)
                              : const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomButton(
                              buttonType: ButtonType.card,
                              buttonSize: ButtonSize.xl,
                              label: 'Ver más',
                              iconPath: StringsSVG.arrowSolidRight,
                              onPressed: () => widget.onItemSelected(index),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
