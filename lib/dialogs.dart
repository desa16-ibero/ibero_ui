import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'utils/strings_svg.dart';
import 'utils/texts_ui.dart';
import 'utils/utils_ui.dart';

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
