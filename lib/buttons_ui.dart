import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

enum ButtonType { primary, secondary, card, table, attach, back }

enum ButtonSize { xs, s, m, l, xl }

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final String label;
  final VoidCallback? onPressed;
  final String? iconPath;

  const CustomButton({
    super.key,
    required this.buttonType,
    required this.buttonSize,
    required this.label,
    this.onPressed,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final isElevatedButton =
        buttonType == ButtonType.primary || buttonType == ButtonType.secondary;
    return isElevatedButton ? _buildElevatedButton() : _buildTextButton();
  }

  Widget _buildElevatedButton() {
    final backgroundColor = buttonType == ButtonType.primary
        ? UtilsUI.primaryColor[700]
        : Colors.white;
    final borderSide = BorderSide(
      color: buttonType == ButtonType.primary
          ? Colors.transparent
          : UtilsUI.neutralColor[900]!,
      width: 1,
    );

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledForegroundColor: UtilsUI.neutralColor[600],
        disabledBackgroundColor: UtilsUI.neutralColor[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
          side: borderSide,
        ),
        minimumSize: _getButtonSizeDimensions(buttonSize),
        alignment: Alignment.center,
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: _getTextStyle(),
      ),
      iconAlignment: IconAlignment.end,
      icon: _buildIcon(),
    );
  }

  Widget _buildTextButton() {
    return TextButton.icon(
      onPressed: onPressed,
      iconAlignment: buttonType == ButtonType.back
          ? IconAlignment.start
          : IconAlignment.end,
      icon: _buildIcon(),
      label: Text(
        label,
        style: _getTextStyle(),
      ),
    );
  }

  Widget? _buildIcon() {
    final effectiveIconPath = iconPath ?? _defaultIconPath();
    if (effectiveIconPath == null) return null;

    final iconSize = _getIconSize();

    return SvgPicture.asset(
      effectiveIconPath,
      package: 'ibero_ui',
      height: iconSize,
      width: iconSize,
      colorFilter: ColorFilter.mode(
        _getTextStyle().color!,
        BlendMode.srcIn,
      ),
    );
  }

  String? _defaultIconPath() {
    switch (buttonType) {
      case ButtonType.card:
      case ButtonType.table:
        return StringsSVG.arrowRight;
      case ButtonType.back:
        return StringsSVG.arrowLeft;
      case ButtonType.attach:
        return StringsSVG.attach;
      default:
        return null;
    }
  }

  Size _getButtonSizeDimensions(ButtonSize size) {
    switch (size) {
      case ButtonSize.xs:
        return Size(80, 32);
      case ButtonSize.s:
        return Size(104, 48);
      case ButtonSize.m:
        return Size(168, 48);
      case ButtonSize.l:
        return Size(208, 48);
      case ButtonSize.xl:
        return Size(320, 48);
    }
  }

  double _getIconSize() {
    if (buttonType == ButtonType.back) return 24;
    switch (buttonSize) {
      case ButtonSize.xs:
        return 18;
      case ButtonSize.s:
        return 24;
      default:
        return 32;
    }
  }

  TextStyle _getTextStyle() {
    Color color;
    switch (buttonType) {
      case ButtonType.primary:
        color = Colors.white;
        break;
      case ButtonType.secondary:
      case ButtonType.back:
        color = UtilsUI.neutralColor[900]!;
        break;
      case ButtonType.card:
      case ButtonType.table:
      case ButtonType.attach:
        color = UtilsUI.primaryColor[700]!;
        break;
    }
    if (onPressed == null) {
      color = UtilsUI.neutralColor[600]!;
    }

    TextStyle textStyle;
    switch (buttonType) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.attach:
        textStyle = (buttonSize == ButtonSize.xs || buttonSize == ButtonSize.s)
            ? TextsUI.inside2
            : TextsUI.inside1;
        break;
      case ButtonType.card:
      case ButtonType.table:
        textStyle = TextsUI.textButton;
        break;
      case ButtonType.back:
        textStyle = TextsUI.label1.copyWith(fontWeight: FontWeight.w500);
        break;
    }
    return textStyle.copyWith(color: color);
  }
}
