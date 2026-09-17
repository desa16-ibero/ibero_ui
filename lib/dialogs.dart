import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

void showDialogScheduled(BuildContext context, Map<String, String> mapData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: SvgPicture.asset(
                    package: 'ibero_ui',
                    StringsSVG.cancelCircle,
                    width: 48,
                    height: 48,
                    colorFilter: ColorFilter.mode(
                      UtilsUI.neutralColor[700]!,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: UtilsUI.neutralColor[50],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(
                              package: 'ibero_ui',
                              StringsSVG.fileData1,
                              width: 35,
                              height: 35,
                              colorFilter: ColorFilter.mode(
                                UtilsUI.neutralColor[700]!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            mapData['subject']!,
                            style: TextsUI.h6,
                          ),
                          SizedBox(height: 4),
                          Text(
                            mapData['subtitle']!,
                            style: TextsUI.body2,
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: SizedBox(
                              height: 150,
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 0.5,
                                            color: UtilsUI.neutralColor[100]!),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Clave', style: TextsUI.sub3),
                                        Text(mapData['clave']!,
                                            style: TextsUI.body2),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Créditos', style: TextsUI.sub3),
                                        Text(mapData['credits']!,
                                            style: TextsUI.body2),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: UtilsUI.neutralColor[100]!),
                                        right: BorderSide(
                                            width: 0.5,
                                            color: UtilsUI.neutralColor[100]!),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Horas', style: TextsUI.sub3),
                                        Text(mapData['hours']!,
                                            style: TextsUI.body2),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color: UtilsUI.neutralColor[100]!),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Modalidad', style: TextsUI.sub3),
                                        Text(mapData['mode']!,
                                            style: TextsUI.body2),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: UtilsUI.neutralColor[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 4,
                                child: Text('Docente:', style: TextsUI.body2),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 8,
                                child: Text(
                                  mapData['teaching']!,
                                  style: TextsUI.body2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 4,
                                child: Text('Grupo:', style: TextsUI.body2),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 8,
                                child: Text(
                                  mapData['group']!,
                                  style: TextsUI.body2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 4,
                                child: Text('Salón:', style: TextsUI.body2),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 8,
                                child: Text(
                                  mapData['classroom']!,
                                  style: TextsUI.body2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 4,
                                child: Text('Horario:', style: TextsUI.body2),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 8,
                                child: Text(
                                  mapData['scheduled']!,
                                  style: TextsUI.body2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void warningModal(
    {required BuildContext context,
      required String title,
      required String content}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(40, 16, 16, 50),
        child: Wrap(
          children: [
            _cancelButton(
              context: context,
              iconDialog: StringsSVG.warningCircle,
              backgroundColorIcon: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15, right: 24),
              child: Text(title, style: TextsUI.h4),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                content,
                style: TextsUI.body3,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void successModal({required BuildContext context, required String title}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(40, 16, 16, 50),
        child: Wrap(
          children: [
            _cancelButton(
              context: context,
              iconDialog: StringsSVG.checkCircle,
              backgroundColorIcon: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15, right: 24),
              child: Text(title, style: TextsUI.h4),
            ),
          ],
        ),
      );
    },
  );
}

void customModal<T>({
  required BuildContext context,
  required String title,
  String? body,
  Widget? widget,
  Widget Function(ValueNotifier<T> dataNotifier)? widgetBuilder,
  ValueNotifier<T>? dataNotifier,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return LayoutBuilder(builder: (context, constraints) {
        final maxHeight = MediaQuery.of(context).size.height * 0.8;
        return Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 16, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          package: 'ibero_ui',
                          StringsSVG.cancelCircle,
                          width: 50,
                          height: 50,
                          colorFilter: ColorFilter.mode(
                            UtilsUI.neutralColor[700]!,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, right: 24),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextsUI.sub1.copyWith(letterSpacing: -1.5),
                          ),
                          SizedBox(height: 20),
                          if (body != null)
                            Text(
                              body,
                              style: TextsUI.body2.copyWith(
                                color: UtilsUI.neutralColor[700],
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ?widget,
                          if (widgetBuilder != null && dataNotifier != null)
                            widgetBuilder(dataNotifier),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}

void customModalWithoutTitle<T>({
  required BuildContext context,
  Widget? widget,
  Widget Function(ValueNotifier<T> dataNotifier)? widgetBuilder,
  ValueNotifier<T>? dataNotifier,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.7,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      package: 'ibero_ui',
                      StringsSVG.cancelCircle,
                      width: 50,
                      height: 50,
                      colorFilter: ColorFilter.mode(
                        UtilsUI.neutralColor[700]!,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                if (widgetBuilder != null && dataNotifier != null)
                  widgetBuilder(dataNotifier),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _cancelButton(
    {required BuildContext context,
      required String iconDialog,
      Color? backgroundColorIcon,
      Color? colorIcon}) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: SvgPicture.asset(
            package: 'ibero_ui',
            StringsSVG.cancelCircle,
            width: 50,
            height: 50,
            colorFilter: ColorFilter.mode(
              UtilsUI.neutralColor[700]!,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: backgroundColorIcon ?? UtilsUI.neutralColor[50],
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.only(top: 40),
        child: SvgPicture.asset(
          package: 'ibero_ui',
          iconDialog,
          width: 64,
          height: 64,
          colorFilter: colorIcon != null
              ? ColorFilter.mode(
            UtilsUI.neutralColor[700]!,
            BlendMode.srcIn,
          )
              : null,
        ),
      ),
    ],
  );
}
