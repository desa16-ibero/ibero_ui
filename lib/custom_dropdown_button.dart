import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class CustomDropdownButton extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String label;
  final List<String> options;
  final String? titleTFF;

  const CustomDropdownButton({
    super.key,
    required this.onChanged,
    required this.label,
    required this.options,
    this.titleTFF,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool isOpen = false;
  String title = '';
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    title = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.white,
      onOpened: () => _changeIcon(true),
      onCanceled: () => _changeIcon(false),
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Column(
              children: widget.options.map((String option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: selectedValue,
                    onChanged: (String? value) {
                      _selectOption(value!);
                    },
                  ),
                  onTap: () {
                    _selectOption(option);
                  },
                );
              }).toList(),
            ),
          ),
        ];
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.titleTFF != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                widget.titleTFF!,
                style:
                    TextsUI.label2.copyWith(color: UtilsUI.neutralColor[600]),
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(15.5, 12.5, 19.5, 12.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: UtilsUI.neutralColor[900]!,
              ),
              color: Colors.white,
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
                    onTap: selectedValue != null ? _clearSelection : null,
                    child: SvgPicture.asset(
                      selectedValue != null
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
        ],
      ),
    );
  }

  void _selectOption(String value) {
    setState(() {
      selectedValue = value;
      title = value;
      widget.onChanged(value);
      Navigator.pop(context);
    });
  }

  void _clearSelection() {
    setState(() {
      selectedValue = null;
      title = widget.label;
      widget.onChanged('');
    });
  }

  void _changeIcon(bool state) {
    setState(() {
      isOpen = state;
    });
  }
}
