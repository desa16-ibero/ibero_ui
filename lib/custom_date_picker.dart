import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';
import 'package:intl/intl.dart';

import 'buttons_ui.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  void _showCustomDatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.zero),
          child: CustomCalendar(
            initialDate: selectedDate ?? widget.initialDate,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
              widget.onDateSelected(date);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCustomDatePicker,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: UtilsUI.neutralColor[900]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? 'Selecciona fecha'
                  : DateFormat('dd/MM/yyyy').format(selectedDate!),
              style: TextsUI.body2,
            ),
            SvgPicture.asset(
              StringsSVG.calendar,
              package: 'ibero_ui',
              height: 24,
              width: 24,
              colorFilter:
                  ColorFilter.mode(UtilsUI.neutralColor[900]!, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCalendar extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomCalendar({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime selectedDate;
  late DateTime visibleMonth;
  late PageController _pageController;
  final DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();

    // Inicializa la fecha seleccionada y el mes visible
    selectedDate = widget.initialDate;
    visibleMonth = DateTime(widget.initialDate.year, widget.initialDate.month);

    // Calcula la diferencia en meses entre firstDate e initialDate
    final initialPageIndex =
        (widget.initialDate.year - widget.firstDate.year) * 12 +
            widget.initialDate.month -
            widget.firstDate.month;

    // Inicializa el PageController con el índice calculado para el mes inicial
    _pageController = PageController(initialPage: initialPageIndex);
  }

  void _onDateSelected(DateTime date) {
    if (date.isAfter(widget.firstDate) && date.isBefore(widget.lastDate)) {
      setState(() {
        selectedDate = date;
      });
      widget.onDateSelected(date);
    }
  }

  // Genera una lista de opciones de mes y año para el DropdownButton
  List<DropdownMenuItem<DateTime>> _generateMonthYearItems() {
    List<DropdownMenuItem<DateTime>> items = [];
    for (int year = widget.firstDate.year;
        year <= widget.lastDate.year;
        year++) {
      for (int month = 1; month <= 12; month++) {
        final date = DateTime(year, month);
        if (date.isAfter(widget.firstDate) && date.isBefore(widget.lastDate)) {
          items.add(
            DropdownMenuItem(
              value: date,
              child: Text(DateFormat('MMMM yyyy', 'es').format(date)),
            ),
          );
        }
      }
    }
    return items;
  }

  // Cambia al mes anterior si está dentro de los límites
  void _goToPreviousMonth() {
    if (visibleMonth.isAfter(widget.firstDate)) {
      setState(() {
        visibleMonth = DateTime(
          visibleMonth.year,
          visibleMonth.month > 1 ? visibleMonth.month - 1 : 12,
        );
        _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  // Cambia al mes siguiente si está dentro de los límites
  void _goToNextMonth() {
    if (visibleMonth.isBefore(widget.lastDate)) {
      setState(() {
        visibleMonth = DateTime(
          visibleMonth.year,
          visibleMonth.month < 12 ? visibleMonth.month + 1 : 1,
        );
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  Widget _buildCalendar(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final firstDayWeekday = firstDayOfMonth.weekday;

    final List<String> weekdayLabels = ['D', 'L', 'M', 'X', 'J', 'V', 'S'];

    return Column(
      children: [
        Divider(
          color: UtilsUI.neutralColor[100],
          thickness: 1.5,
        ),
        // Dropdown y flechas para seleccionar mes y año
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<DateTime>(
                  value: visibleMonth.isAfter(widget.firstDate) &&
                          visibleMonth.isBefore(widget.lastDate)
                      ? visibleMonth
                      : null,
                  items: _generateMonthYearItems(),
                  icon: SvgPicture.asset(
                    StringsSVG.chevronDown,
                    package: 'ibero_ui',
                  ),
                  onChanged: (DateTime? newDate) {
                    if (newDate != null &&
                        newDate.isAfter(widget.firstDate) &&
                        newDate.isBefore(widget.lastDate)) {
                      setState(() {
                        visibleMonth = DateTime(newDate.year, newDate.month);
                        _pageController.jumpToPage(
                          (newDate.year - widget.firstDate.year) * 12 +
                              newDate.month -
                              1,
                        );
                      });
                    }
                  },
                  style: TextsUI.body2,
                  underline: Container(),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  StringsSVG.chevronLeft,
                  package: 'ibero_ui',
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      UtilsUI.neutralColor[900]!, BlendMode.srcIn),
                ),
                onPressed: _goToPreviousMonth,
              ),
              IconButton(
                icon: SvgPicture.asset(
                  StringsSVG.chevronRight,
                  package: 'ibero_ui',
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      UtilsUI.neutralColor[900]!, BlendMode.srcIn),
                ),
                onPressed: _goToNextMonth,
              ),
            ],
          ),
        ),
        // Row con las iniciales de los días de la semana
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekdayLabels
              .map((label) => Expanded(
                    child: Center(
                      child: Text(
                        label,
                        style: TextsUI.hc3,
                      ),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: daysInMonth + firstDayWeekday - 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            if (index < firstDayWeekday - 1) {
              return Container();
            }

            final day = index - firstDayWeekday + 2;
            final dateToShow = DateTime(date.year, date.month, day);
            final isSelected = dateToShow.year == selectedDate.year &&
                dateToShow.month == selectedDate.month &&
                dateToShow.day == selectedDate.day;

            final isToday = dateToShow.year == today.year &&
                dateToShow.month == today.month &&
                dateToShow.day == today.day;

            final isDisabled = dateToShow.isBefore(widget.firstDate) ||
                dateToShow.isAfter(widget.lastDate);

            return GestureDetector(
              onTap: isDisabled ? null : () => _onDateSelected(dateToShow),
              child: Container(
                margin: EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? UtilsUI.primaryColor[700]
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$day',
                      style: TextsUI.body2.copyWith(
                          color: isSelected
                              ? Colors.white
                              : isDisabled
                                  ? UtilsUI.neutralColor[300]
                                  : UtilsUI.neutralColor[900]),
                    ),
                    if (isToday) // Muestra un punto rojo debajo del día actual
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: UtilsUI.primaryColor[700],
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ELIGE UNA FECHA',
            style: TextsUI.label2.copyWith(
              color: UtilsUI.neutralColor[600],
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 25),
          Text(
            DateFormat('EEE, d \'de\' MMMM', 'es').format(selectedDate),
            style: TextsUI.h4,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 370,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  visibleMonth = DateTime(
                    widget.firstDate.year,
                    widget.firstDate.month + index,
                  );
                });
              },
              itemBuilder: (context, index) {
                final date = DateTime(
                  widget.firstDate.year,
                  widget.firstDate.month + index,
                );
                return _buildCalendar(date);
              },
            ),
          ),
          Divider(
            color: UtilsUI.neutralColor[100],
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar', style: TextsUI.inside2),
              ),
              SizedBox(width: 20),
              CustomButton(
                buttonType: ButtonType.primary,
                buttonSize: ButtonSize.xs,
                label: 'Aceptar',
                onPressed: () {
                  widget.onDateSelected(selectedDate);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
