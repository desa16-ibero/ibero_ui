import 'package:flutter/material.dart';

class TableHorizontal extends StatefulWidget {
  final List<TableRow> rowCell;
  final Map<int, TableColumnWidth> columnWidths;

  const TableHorizontal(
      {super.key, required this.rowCell, required this.columnWidths});

  @override
  State<TableHorizontal> createState() => _TableHorizontalState();
}

class _TableHorizontalState extends State<TableHorizontal> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: RawScrollbar(
        controller: scrollController,
        interactive: true,
        thumbColor: const Color(0xFFD8D8D8),
        thickness: 8,
        thumbVisibility: true,
        crossAxisMargin: -20,
        radius: const Radius.circular(48),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Table(
            children: widget.rowCell,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: widget.columnWidths,
          ),
        ),
      ),
    );
  }
}
