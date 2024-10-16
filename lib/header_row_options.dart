import 'package:flutter/material.dart';

import 'utils/utils_ui.dart';

class HeaderRowOptions extends StatelessWidget {
  final Map<String, String> mapData;
  final String currentSelection;

  final Function(String selection) returnValue;

  const HeaderRowOptions(
      {super.key,
      required this.mapData,
      required this.currentSelection,
      required this.returnValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFF3F3F3),
        ),
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: mapData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                returnValue(mapData.entries.toList()[index].key);
              },
              child: Container(
                decoration:
                    mapData.entries.toList()[index].key == currentSelection
                        ? BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 2.5),
                            ],
                          )
                        : null,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    mapData.entries.toList()[index].value,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.7,
                      letterSpacing: -0.2,
                      color: mapData.entries.toList()[index].key ==
                              currentSelection
                          ? UtilsUI.redCustomColor
                          : const Color(0xFF3C3B3B),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
