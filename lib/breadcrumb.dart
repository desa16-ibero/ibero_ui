import 'package:flutter/material.dart';

import 'utils/texts_ui.dart';
import 'utils/utils_ui.dart';

class Breadcrumb extends StatelessWidget {
  final String value;

  const Breadcrumb({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Text(
        value,
        style: TextsUI.body4.copyWith(
          color: UtilsUI.neutralColor[300],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
