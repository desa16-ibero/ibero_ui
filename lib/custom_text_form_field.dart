import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validation/form_validation.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final List<ValueValidator>? validators;
  final bool? obscureText;
  final bool? isLastTFF;
  final VoidCallback? changeObscureText;
  final VoidCallback? send;
  final String? customMessage;
  final String? titleTFF;
  final bool? enableBorders;
  final String? suffixIcon;
  final TextStyle? textStyleTitle;
  final bool? disableTextFormField;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    required this.textInputType,
    this.controller,
    this.validators,
    this.obscureText,
    this.changeObscureText,
    this.send,
    this.customMessage,
    this.isLastTFF,
    this.titleTFF,
    this.enableBorders,
    this.suffixIcon,
    this.textStyleTitle,
    this.disableTextFormField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleTFF != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              titleTFF!,
              style:
                  textStyleTitle ??
                  TextsUI.label2.copyWith(color: UtilsUI.neutralColor[600]),
            ),
          ),
        Container(
          color: disableTextFormField != null
              ? UtilsUI.neutralColor[50]
              : Colors.white,
          child: TextFormField(
            enabled: disableTextFormField,
            controller: controller,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            keyboardType: textInputType,
            style: TextsUI.body2.copyWith(
              color: disableTextFormField != null
                  ? UtilsUI.neutralColor[300]
                  : UtilsUI.neutralColor[900],
            ),
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: enableBorders != null
                  ? FloatingLabelBehavior.never
                  : null,
              labelText: label,
              hintText: hint,
              suffixIcon: changeObscureText != null
                  ? IconButton(
                      icon: SvgPicture.asset(
                        obscureText! ? StringsSVG.eyeLock : StringsSVG.eye,
                        package: 'ibero_ui',
                        colorFilter: ColorFilter.mode(
                          UtilsUI.neutralColor[900]!,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: changeObscureText,
                    )
                  : suffixIcon != null
                  ? UnconstrainedBox(
                      child: SvgPicture.asset(
                        suffixIcon!,
                        package: 'ibero_ui',
                        colorFilter: ColorFilter.mode(
                          UtilsUI.neutralColor[700]!,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : null,
              focusedBorder: enableBorders != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: UtilsUI.neutralColor[500]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.zero,
                    )
                  : null,
              enabledBorder: enableBorders != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: UtilsUI.neutralColor[500]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.zero,
                    )
                  : null,
              disabledBorder: enableBorders != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: UtilsUI.neutralColor[300]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.zero,
                    )
                  : null,
            ),
            validator: (value) => _validateText(value, context, customMessage),
            onFieldSubmitted: (_) => isLastTFF! ? send!() : null,
            textInputAction: isLastTFF!
                ? TextInputAction.send
                : TextInputAction.next,
          ),
        ),
      ],
    );
  }

  String? _validateText(
    String? value,
    BuildContext context,
    String? customMessage,
  ) {
    if (validators != null) {
      final validator = Validator(
        validators: validators as List<ValueValidator>,
      );

      final String? message = validator.validate(label: label, value: value);

      String? translateMessage = '';

      if (message != null) {
        if (customMessage != null) {
          translateMessage = customMessage;
          return translateMessage;
        }
        if (message.contains('is required')) {
          translateMessage = message.replaceAll('is required', 'es requerido');
        }
        if (message.contains('is invalid')) {
          translateMessage = message.replaceAll('is invalid', 'no es válido');
        }
        if (message.contains('must contain at least')) {
          translateMessage = message
              .replaceAll('must contain at least', 'debe contener al menos')
              .replaceAll('characters', 'caracteres');
        }
        if (message.contains('must contain at most')) {
          translateMessage = message
              .replaceAll('must contain at most', 'debe contener como máximo')
              .replaceAll('characters', 'caracteres');
        }
        if (message.contains('must be at most')) {
          translateMessage = message.replaceAll(
            'must be at most',
            'el máximo es de \$',
          );
        }
        if (message.contains('must be at least')) {
          translateMessage = message.replaceAll(
            'must be at least',
            'el mínimo es de \$',
          );
        }
      } else {
        translateMessage = message;
      }
      return translateMessage;
    }
    return null;
  }
}
