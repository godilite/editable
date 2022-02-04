import 'package:flutter/material.dart';

/// Generates empty columns using the specified columnCount,
/// if no column count is provided, it uses the [columns.length] value
columnBlueprint(columnCount, columns) {
  var data = List.generate(
      columnCount, (index) => {'title': '', 'index': index, 'key': index});
  columns = [...data];
  return columns;
}

/// Generates empty rows from rowCount values provided
rowBlueprint(int rowCount, columns, rows) {
  List sampleRow = [];
  for (var i = 0; i < rowCount; i++) {
    var item = {};
    columns.forEach((element) {
      item[element['key']] = '';
    });
    sampleRow.add(item);
  }
  rows = [...sampleRow];
  return rows;
}

/// adds a row to existing row lists
addOneRow(columns, rows) {
  var item = {};
  columns.forEach((element) {
    item[element['key']] = '';
  });
  rows.add(item);
  return rows;
}

removeOneRow(columns, rows, rowToDelete) {
  rows.remove(rowToDelete);
  return rows;
}

///Create an empty column for saveIcon
Widget iconColumn(showSaveIcon, thPaddingTop, thPaddingBottom) {
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
