import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class NumberPicker extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int>? onChanged;

  const NumberPicker({
    super.key,
    this.initialValue = 1,
    this.minValue = 0,
    this.maxValue = 100,
    this.onChanged,
  });

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _increment() {
    setState(() {
      if (_currentValue < widget.maxValue) {
        _currentValue++;
        widget.onChanged?.call(_currentValue);
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > widget.minValue) {
        _currentValue--;
        widget.onChanged?.call(_currentValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        border: Border.all(color: UtilsUI.neutralColor[400]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _decrement,
            child: SvgPicture.asset(
              StringsSVG.minus1,
              package: 'ibero_ui',
              width: 15,
              height: 15,
              colorFilter:
                  ColorFilter.mode(UtilsUI.neutralColor[900]!, BlendMode.srcIn),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Text(
              '$_currentValue',
              style: TextsUI.numbRES,
            ),
          ),
          GestureDetector(
            onTap: _increment,
            child: SvgPicture.asset(
              StringsSVG.plus1,
              package: 'ibero_ui',
              width: 15,
              height: 15,
              colorFilter:
                  ColorFilter.mode(UtilsUI.neutralColor[900]!, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
