import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class CustomCheckboxDropdown extends StatefulWidget {
  final ValueChanged<Map<String, bool>> onChanged;
  final String label;
  final Map<String, bool> mapOptionCB;

  const CustomCheckboxDropdown(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.mapOptionCB});

  @override
  State<CustomCheckboxDropdown> createState() => _CustomCheckboxDropdownState();
}

class _CustomCheckboxDropdownState extends State<CustomCheckboxDropdown> {
  bool isOpen = false;

  String title = '';

  Map<String, bool> mapOptionCB = {};

  @override
  void initState() {
    super.initState();
    title = widget.label;
    mapOptionCB = Map<String, bool>.from(widget.mapOptionCB);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.white,
      onOpened: () => changeIcon(true),
      onCanceled: () => changeIcon(false),
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: mapOptionCB.entries
                      .map(
                        (e) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(e.key),
                          value: mapOptionCB[e.key],
                          onChanged: (bool? value) {
                            setState(() {
                              setValue(e.key, value!);
                              String text =
                                  mapOptionCB.entries.any((e) => e.value)
                                      ? mapOptionCB.entries
                                          .toList()
                                          .where((e) => e.value)
                                          .map((e) => e.key)
                                          .join(', ')
                                      : widget.label;
                              changeText(text);
                              Navigator.pop(context);
                            });
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
          )
        ];
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(15.5, 12.5, 19.5, 12.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: UtilsUI.neutralColor[900]!,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextsUI.body2,
              ),
            ),
            RotatedBox(
              quarterTurns: isOpen ? 2 : 0,
              child: GestureDetector(
                onTap: title != widget.label ? () => clearSelection() : null,
                child: SvgPicture.asset(
                  title != widget.label
                      ? StringsSVG.cancel2
                      : StringsSVG.chevronUp,
                  width: 24,
                  height: 24,
                  package: 'ibero_ui',
                  colorFilter: ColorFilter.mode(
                    UtilsUI.neutralColor[700]!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setValue(String key, bool value) {
    setState(() {
      mapOptionCB[key] = value;
      widget.onChanged(mapOptionCB);
    });
  }

  clearSelection() {
    setState(() {
      mapOptionCB.updateAll((key, value) => value = false);
      title = widget.label;
      widget.onChanged(mapOptionCB);
    });
  }

  changeIcon(bool state) {
    setState(() {
      isOpen = state;
    });
  }

  changeText(String text) {
    setState(() {
      title = text;
    });
  }
}
