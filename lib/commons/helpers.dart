import 'package:editable/commons/column.dart';
import 'package:flutter/material.dart';

/// Generates empty columns using the specified columnCount,
/// if no column count is provided, it uses the [columns.length] value
List<Map<String, dynamic>> columnBlueprint(
    int columnCount, List<Map<String, dynamic>> columns) {
  final data = List.generate(
      columnCount, (index) => {'title': '', 'index': index, 'key': index});
  columns = [...data];
  return columns;
}

/// Generates empty rows from rowCount values provided
List<Map<String, dynamic>> rowBlueprint(int rowCount,
    List<Map<String, dynamic>> columns, List<Map<String, dynamic>> rows) {
  final sampleRow = <Map<String, dynamic>>[];
  for (var i = 0; i < rowCount; i++) {
    final item = <String, dynamic>{};
    for (final element in columns) {
      item[element['key'] as String] = '';
    }
    sampleRow.add(item);
  }
  rows = [...sampleRow];
  return rows;
}

/// adds a row to existing row lists
List<Map<String, dynamic>> addOneRow(
    List<EditableColumn> columns, List<Map<String, dynamic>> rows) {
  final item = <String, dynamic>{};
  for (final element in columns) {
    item[element.key] = '';
  }
  rows.add(item);
  return rows;
}

List<Map<String, dynamic>> removeOneRow(
    List<Map<String, dynamic>> rows, Map<String, dynamic> rowToDelete) {
  rows.remove(rowToDelete);
  return rows;
}

///Create an empty column for saveIcon
Widget iconColumn(
    bool showSaveIcon, double thPaddingTop, double thPaddingBottom) {
  return Visibility(
    visible: showSaveIcon,
    child: Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.only(
          top: thPaddingTop,
          bottom: thPaddingBottom,
        ),
      ),
    ),
  );
}
