import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class BottomBarPayments extends StatelessWidget {
  const BottomBarPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: UtilsUI.neutralColor[100],
          thickness: 1,
        ),
        SizedBox(height: 10),
        Text(
          'Si tienes duda o sugerencia acerca de esta página te invitamos a revisar nuestras preguntas frecuentes.\n\n'
          'En caso de necesitar ayuda por favor comunícate a la Oficina de Cobranzas al 55 5950 4000, Opción 2 ó por correo electrónico a cobranzasuia@ibero.mx',
          style: TextsUI.body4,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
