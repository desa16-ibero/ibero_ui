import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

import 'custom_card_shadow.dart';
import 'diagonal_clip.dart';
import 'header_icon_title.dart';

class CustomCarousel extends StatefulWidget {
  final List<CarouselItem> items;
  final Duration transitionDuration;
  final Duration autoScrollInterval;

  const CustomCarousel({
    super.key,
    required this.items,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.autoScrollInterval = const Duration(seconds: 3),
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class CarouselItem {
  final String imagePath;
  final String textImage;
  final String body;

  CarouselItem(
      {required this.imagePath, required this.textImage, required this.body});
}

class _CustomCarouselState extends State<CustomCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(widget.autoScrollInterval, (timer) {
      if (_currentIndex < widget.items.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _animateToPage(_currentIndex);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    _startAutoScroll();
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.items.length, (index) {
        bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: isActive
                ? UtilsUI.neutralColor[500]
                : UtilsUI.neutralColor[100],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: widget.transitionDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final CarouselItem item = widget.items[index];
              return CustomCardShadow(
                padding: EdgeInsets.zero,
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HeaderIconTitle(
                        title: 'Servicios con el monedero',
                        path: StringsSVG.wallet2,
                        circleSize: 39,
                        iconSize: 26,textStyleTitle: TextsUI.hc2.copyWith(letterSpacing: -0.81),
                      ),
                    ),
                    ClipPath(
                      clipper: DiagonalClip(isLeftSide: false, clipSize: 23),
                      child: Stack(
                        children: [
                          Image.asset(
                            item.imagePath,
                            fit: BoxFit.fitWidth,
                            height: 94,
                            width: double.infinity,
                          ),
                          Container(
                            color: const Color(0x66000000),
                            height: 94,
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 42, right: 23),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  item.textImage,
                                  style: TextsUI.body4.copyWith(
                                      fontSize: 13.02,
                                      letterSpacing: 0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: TextsUI.body4.copyWith(
                              fontSize: 11.39,
                              letterSpacing: -0.16,
                              color: UtilsUI.neutralColor[700],
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.body,
                              style: TextsUI.body4.copyWith(
                                fontSize: 11.39,
                                letterSpacing: -0.16,
                                color: UtilsUI.neutralColor[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildDots(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
