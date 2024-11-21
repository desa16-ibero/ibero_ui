import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

enum AlertType { info, error, success, warning }

class CustomSnackBars extends StatelessWidget {
  final String message;
  final String iconPath;
  final AlertType type;
  final VoidCallback onClose;

  const CustomSnackBars(
      {super.key,
      required this.message,
      required this.type,
      required this.onClose,
      required this.iconPath});

  Color get backgroundColor {
    switch (type) {
      case AlertType.info:
        return UtilsUI.neutralColor[50]!;
      case AlertType.error:
        return UtilsUI.errorColor[50]!;
      case AlertType.success:
        return UtilsUI.successColor[50]!;
      case AlertType.warning:
        return UtilsUI.warningColor[50]!;
    }
  }

  Color get borderColor {
    switch (type) {
      case AlertType.info:
        return UtilsUI.neutralColor[300]!;
      case AlertType.error:
        return UtilsUI.errorColor[900]!;
      case AlertType.success:
        return UtilsUI.successColor[700]!;
      case AlertType.warning:
        return UtilsUI.warningColor[900]!;
    }
  }

  Color get iconColor {
    switch (type) {
      case AlertType.info:
        return UtilsUI.neutralColor[700]!;
      case AlertType.error:
        return UtilsUI.errorColor[500]!;
      case AlertType.success:
        return UtilsUI.successColor[700]!;
      case AlertType.warning:
        return UtilsUI.warningColor[500]!;
    }
  }

  Color get textColor {
    switch (type) {
      case AlertType.info:
        return UtilsUI.neutralColor[700]!;
      case AlertType.error:
        return UtilsUI.errorColor[900]!;
      case AlertType.success:
        return UtilsUI.successColor[700]!;
      case AlertType.warning:
        return UtilsUI.warningColor[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconPath,
                package: 'ibero_ui',
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            flex: 9,
            fit: FlexFit.tight,
            child: Text(
              message,
              style: TextsUI.body3.copyWith(color: textColor),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onClose,
                icon: SvgPicture.asset(
                  StringsSVG.cancel2,
                  package: 'ibero_ui',
                  colorFilter: ColorFilter.mode(
                    textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
