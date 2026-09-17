import 'package:flutter/material.dart';
import 'package:ibero_ui/utils/extensions.dart';
import 'package:ibero_ui/utils/utils_ui.dart';
import 'package:intl/intl.dart';

class RowDays extends StatelessWidget {
  final DateTime currentDay;

  final Function(int weekDay) returnValue;

  const RowDays({
    super.key,
    required this.currentDay,
    required this.returnValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: _makeHeaderWeek());
  }

  List<Widget> _makeHeaderWeek() {
    final List<Widget> lstContent = [];

    final DateTime firstDayOfWeek = currentDay.startOfWeek(currentDay);
    final List<DateTime> daysOfWeek = [];
    for (int i = 0; i < 6; i++) {
      daysOfWeek.add(firstDayOfWeek.add(Duration(days: i)));
    }

    for (DateTime dateTime in daysOfWeek) {
      if (dateTime.weekday == currentDay.weekday) {
        lstContent.add(
          headerFullDay(DateFormat.EEEE('es').format(dateTime).toUpperCase()),
        );
      } else {
        lstContent.add(
          headerDay(
            DateFormat.EEEEE('es').format(dateTime).toUpperCase(),
            daysOfWeek.last == dateTime ? true : false,
            dateTime.weekday,
          ),
        );
      }
    }

    return lstContent;
  }

  Widget headerFullDay(String day) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 5,
      child: Container(
        color: UtilsUI.primaryColor[700],
        padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            letterSpacing: -0.2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget headerDay(String day, bool isFirst, int weekDay) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: GestureDetector(
        onTap: () => returnValue(weekDay),
        child: Container(
          padding: const EdgeInsets.fromLTRB(19.2, 12.8, 19.2, 12.8),
          decoration: BoxDecoration(
            border: isFirst
                ? Border.all(color: UtilsUI.neutralColor[300]!)
                : Border(
                    bottom: BorderSide(color: UtilsUI.neutralColor[300]!),
                    left: BorderSide(color: UtilsUI.neutralColor[300]!),
                    top: BorderSide(color: UtilsUI.neutralColor[300]!),
                  ),
          ),
          child: Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.4,
              letterSpacing: -0.2,
              color: UtilsUI.neutralColor[700],
            ),
          ),
        ),
      ),
    );
  }
}
