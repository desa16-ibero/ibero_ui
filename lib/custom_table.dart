import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibero_ui/utils/strings_svg.dart';
import 'package:ibero_ui/utils/texts_ui.dart';
import 'package:ibero_ui/utils/utils_ui.dart';

class HorizontalTable extends StatefulWidget {
  final List<Widget> headers;
  final List<List<Widget>> rows;
  final Color headerBackgroundColor;
  final Color cellBackgroundColor;
  final Map<int, TableColumnWidth> columnWidths;
  final int? limit;

  const HorizontalTable({
    super.key,
    required this.headers,
    required this.rows,
    required this.headerBackgroundColor,
    this.cellBackgroundColor = Colors.white,
    required this.columnWidths,
    this.limit = 1,
  });

  @override
  State<HorizontalTable> createState() => _HorizontalTableState();
}

class _HorizontalTableState extends State<HorizontalTable> {
  late ScrollController _horizontalScrollController;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _horizontalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalRows = widget.rows.length;
    int limit = widget.limit ?? totalRows;
    int totalPages = (totalRows / limit).ceil();

    int start = (limit * (_currentPage - 1)).clamp(0, totalRows);
    int end = (start + limit).clamp(0, totalRows);
    List<List<Widget>> currentRows = widget.rows.sublist(start, end);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RawScrollbar(
          interactive: true,
          thumbColor: UtilsUI.neutralColor[100],
          thickness: 8,
          thumbVisibility: true,
          crossAxisMargin: -20,
          radius: const Radius.circular(48),
          controller: _horizontalScrollController,
          notificationPredicate: (ScrollNotification notification) {
            return notification.metrics.axis == Axis.horizontal;
          },
          child: SingleChildScrollView(
            controller: _horizontalScrollController,
            scrollDirection: Axis.horizontal,
            child: Table(
              columnWidths: widget.columnWidths,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  decoration:
                      BoxDecoration(color: widget.headerBackgroundColor),
                  children: widget.headers.map((header) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: header,
                    );
                  }).toList(),
                ),
                ...currentRows.map((row) {
                  return TableRow(
                    decoration: BoxDecoration(
                      color: widget.cellBackgroundColor,
                      border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: UtilsUI.neutralColor[100]!),
                      ),
                    ),
                    children: row.map((cellContent) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: cellContent,
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
        ),
        if (totalPages > 1) _buildPagination(totalPages),
      ],
    );
  }

  Widget _buildPagination(int totalPages) {
    List<Widget> paginationItems = [];

    if (_currentPage > 1) {
      paginationItems
          .add(_buildArrowButton(StringsSVG.chevronLeft, _currentPage - 1));
    }

    for (int i = 1; i <= totalPages; i++) {
      if (i == _currentPage ||
          i == 1 ||
          i == totalPages ||
          (i >= _currentPage - 1 && i <= _currentPage + 1)) {
        paginationItems.add(_buildPageNumber(i));
      } else if (i == _currentPage - 2 || i == _currentPage + 2) {
        paginationItems.add(
          Text(
            '...',
            style: TextsUI.sub2.copyWith(color: UtilsUI.neutralColor[500]),
          ),
        );
      }
    }

    if (_currentPage < totalPages) {
      paginationItems
          .add(_buildArrowButton(StringsSVG.chevronRight, _currentPage + 1));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paginationItems,
      ),
    );
  }

  Widget _buildPageNumber(int pageNumber) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentPage = pageNumber;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Text(
          '$pageNumber',
          style: TextsUI.sub2.copyWith(
            color: _currentPage == pageNumber
                ? UtilsUI.primaryColor[700]
                : UtilsUI.neutralColor[500],
            decoration:
                _currentPage == pageNumber ? TextDecoration.underline : null,
            decorationColor: UtilsUI.primaryColor[700],
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton(String pathIcon, int targetPage) {
    return IconButton(
      icon: SvgPicture.asset(
        pathIcon,
        width: 24,
        height: 24,
        package: 'ibero_ui',
        colorFilter:
            ColorFilter.mode(UtilsUI.neutralColor[900]!, BlendMode.srcIn),
      ),
      onPressed: () {
        setState(() {
          _currentPage = targetPage;
        });
      },
    );
  }
}
