// Copyright 2020 Godwin Asuquo. All rights reserved.
//
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

library editable;

import 'package:editable/commons/column.dart';
import 'package:flutter/material.dart';
import 'commons/helpers.dart';
import 'widgets/table_body.dart';
import 'widgets/table_header.dart';

class Editable extends StatefulWidget {
  /// Builds an editable table using predefined row and column counts
  /// Or using a row and header data set provided
  ///
  /// if no data is provided for [row] and [column],
  /// [rowCount] and [columnCount] properties must be set
  /// this will generate an empty table
  ///
  /// it is useful for rendering data from an API or to create a
  /// spreadsheet-like
  /// data table
  ///
  /// example:
  ///
  /// ```dart
  ///  Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Column(
  ///       children: <Widget>[
  ///           Expanded(
  ///           flex: 1,
  ///           child: EdiTable(
  ///               showCreateButton: true,
  ///               tdStyle: TextStyle(fontSize: 20),
  ///               showSaveIcon: false,
  ///               borderColor: Colors.lightBlue,
  ///               columnCount: 4,
  ///               rowCount: 8
  ///              ),
  ///           ).
  ///         ]
  ///       ),
  ///   );
  /// }
  /// ```
  const Editable({
    Key? key,
    required this.columns,
    required this.rows,
    this.columnRatio = 0.20,
    this.onSubmitted,
    this.onRowSaved,
    this.columnCount = 0,
    this.rowCount = 0,
    this.borderColor = Colors.grey,
    this.tdPaddingLeft = 8.0,
    this.tdPaddingTop = 8.0,
    this.tdPaddingRight = 8.0,
    this.tdPaddingBottom = 12.0,
    this.thPaddingLeft = 8.0,
    this.thPaddingTop = 0.0,
    this.thPaddingRight = 8.0,
    this.thPaddingBottom = 0.0,
    this.trHeight = 50.0,
    this.borderWidth = 0.5,
    this.thWeight = FontWeight.w600,
    this.thSize = 18,
    this.showSaveIcon = false,
    this.saveIcon = Icons.save,
    this.saveIconColor = Colors.black12,
    this.saveIconSize = 18,
    this.showRemoveIcon = false,
    this.removeIcon = Icons.delete,
    this.removeIconColor = Colors.black12,
    this.removeIconSize = 18,
    this.tdAlignment = TextAlign.start,
    this.tdStyle,
    this.tdEditableMaxLines = 1,
    this.thAlignment = TextAlign.start,
    this.thStyle,
    this.thVertAlignment = CrossAxisAlignment.center,
    this.showCreateButton = false,
    this.createButtonAlign = CrossAxisAlignment.start,
    this.createButtonIcon,
    this.createButtonColor,
    this.createButtonShape,
    this.createButtonLabel,
    this.stripeColor1 = Colors.white,
    this.stripeColor2 = Colors.black12,
    this.zebraStripe = false,
    this.focusedBorder,
    this.onCellValueChanged,
    this.scrollbarAlwaysVisible = false,
  }) : super(key: key);

  /// A data set to create headers
  ///
  /// Can be null if blank columns are needed, else:
  /// Must be array of objects
  /// with the following keys: [title], [widthFactor] and [key]
  ///
  /// example:
  /// ```dart
  /// List cols = [
  ///   {"title":'Name', 'widthFactor': 0.1, 'key':'name', 'editable': false},
  ///   {"title":'Date', 'widthFactor': 0.2, 'key':'date'},
  ///   {"title":'Month', 'widthFactor': 0.1, 'key':'month', 'editable': false},
  ///   {"title":'Status', 'widthFactor': 0.1, 'key':'status'},
  /// ];
  /// ```
  /// [title] is the column heading
  ///
  /// [widthFactor] a custom size ratio of each column width, if not
  /// provided, defaults to  [columnRatio = 0.20]
  /// ```dart
  /// 'widthFactor': 0.1 //gives 10% of screen size to the column
  /// 'widthFactor': 0.2 //gives 20% of screen size to the column
  /// ```
  ///
  /// [key] an identifier preferably a short string
  /// [editable] a boolean, if the column should be editable or not, [true]
  /// by default.
  final List<EditableColumn> columns;

  /// A data set to create rows
  ///
  /// Can be null if empty rows are needed. else,
  /// Must be array of objects
  /// with keys matching [key] provided in the column array
  ///
  /// example:
  /// ```dart
  ///List rows = [
  ///          {"name": 'James Joe', "date":'23/09/2020',"month":'June',"status":'completed'},
  ///          {"name": 'Daniel Paul', "date":'12/4/2020',"month":'March',"status":'new'},
  ///        ];
  /// ```
  /// each objects DO NOT have to be positioned in same order as its column

  final List<Map<String, dynamic>> rows;

  /// Integer value of number of rows to be generated:
  ///
  /// Optional if row data is provided
  final int rowCount;

  /// Integer value of number of columns to be generated:
  ///
  /// Optional if column data is provided
  final int columnCount;

  /// aspect ration of each column,
  /// sets the ratio of the screen width occupied by each column
  /// it is set in fraction between 0 to 1.0
  /// 0.8 indicates 80 percent width per column
  final double columnRatio;

  /// Color of table border
  final Color borderColor;

  /// width of table borders
  final double borderWidth;

  /// Table data cell padding left
  final double tdPaddingLeft;

  /// Table data cell padding top
  final double tdPaddingTop;

  /// Table data cell padding right
  final double tdPaddingRight;

  /// Table data cell padding bottom
  final double tdPaddingBottom;

  /// Aligns the table data
  final TextAlign tdAlignment;

  /// Style the table data
  final TextStyle? tdStyle;

  /// Max lines allowed in editable text, default: 1 (longer data will not wrap
  /// and be hidden), setting to 100 will allow wrapping and not increase row
  ///  size
  final int tdEditableMaxLines;

  /// Table header cell padding left
  final double thPaddingLeft;

  /// Table header cell padding top
  final double thPaddingTop;

  /// Table header cell padding right
  final double thPaddingRight;

  /// Table header cell padding bottom
  final double thPaddingBottom;

  /// Aligns the table header
  final TextAlign thAlignment;

  /// Style the table header - use for more control of header style, using this
  /// OVERRIDES the thWeight and thSize parameters and those will be ignored.
  final TextStyle? thStyle;

  /// Table headers fontweight (use thStyle for more control of header style)
  final FontWeight thWeight;

  /// Table header label vertical alignment
  final CrossAxisAlignment thVertAlignment;

  /// Table headers fontSize  (use thStyle for more control of header style)
  final double thSize;

  /// Table Row Height
  /// cannot be less than 40.0
  final double trHeight;

  /// Toggles the save button,
  /// if [true] displays an icon to save rows,
  /// adds an addition column to the right
  final bool showSaveIcon;

  /// Toggles the remove button,
  /// if [true] displays an icon to remove rows,
  /// adds an addition column to the right
  final bool showRemoveIcon;

  /// Icon for to save row data
  /// example:
  ///
  /// ```dart
  /// saveIcon : Icons.add
  /// ````
  final IconData saveIcon;

  // Icon for to delete row data
  /// example:
  ///
  /// ```dart
  /// removeIcon : Icons.delete
  /// ````
  final IconData removeIcon;

  /// Color for the save Icon
  final Color saveIconColor;

  /// Color for the remove Icon
  final Color removeIconColor;

  /// Size for the saveIcon
  final double saveIconSize;

  /// Size for the removeIcon
  final double removeIconSize;

  /// displays a button that adds a new row onPressed
  final bool showCreateButton;

  /// Aligns the button for adding new rows
  final CrossAxisAlignment createButtonAlign;

  /// Icon displayed in the create new row button
  final Icon? createButtonIcon;

  /// Color for the create new row button
  final Color? createButtonColor;

  /// border shape of the create new row button
  ///
  /// ```dart
  /// createButtonShape: RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.circular(8)
  /// )
  /// ```
  final BoxShape? createButtonShape;

  /// Label for the create new row button
  final Widget? createButtonLabel;

  /// The first row alternate color, if stripe is set to true
  final Color stripeColor1;

  /// The Second row alternate color, if stripe is set to true
  final Color stripeColor2;

  /// enable zebra-striping, set to false by default
  /// if enabled, you can style the colors [stripeColor1] and [stripeColor2]
  final bool zebraStripe;

  final InputBorder? focusedBorder;

  ///[onSubmitted] callback is triggered when the enter button is pressed on a
  ///table data cell
  /// it returns a value of the cell data
  final ValueChanged? onSubmitted;

  /// [onRowSaved] callback is triggered when a [saveButton] is pressed.
  /// returns only values if row is edited, otherwise returns a string
  /// ['no edit']
  final ValueChanged<dynamic>? onRowSaved;

  /// [onCellValueChanged] callback is triggered when cell value changes and
  /// returns values for changed cell that are still not saved;
  final ValueChanged<List<Map<String, dynamic>>>? onCellValueChanged;

  /// Whether the horizontal scrollbar is always visible.
  final bool scrollbarAlwaysVisible;

  @override
  EditableState createState() => EditableState();
}

class EditableState extends State<Editable> {
  int? columnCount;
  int? rowCount;

  ///Get all edited rows
  List<Map<String, dynamic>> get editedRows => _editedRows;

  ///Create a row after the last row
  List<Map<String, dynamic>> createRow() =>
      addOneRow(widget.columns, widget.rows);

  /// Temporarily holds all edited rows
  final List<Map<String, dynamic>> _editedRows = [];

  /// Controller for the scrollbar
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final scrWidth = MediaQuery.of(context).size.width;

    /// initial Setup of columns and row, sets count of column and row
    rowCount = widget.rows.isEmpty ? widget.rowCount : widget.rows.length;
    columnCount = widget.columns.isEmpty ? columnCount : widget.columns.length;
    final _columns = widget.columns;
    var _rows = widget.rows;

    final ckeys = <String>[];
    final cwidths = <double>[];
    final ceditable = <bool>[];
    final cNumOnly = <bool>[];
    for (final e in _columns) {
      ckeys.add(e.key);
      cwidths.add(e.widthFactor ?? widget.columnRatio);
      ceditable.add(e.editable ?? true);
      cNumOnly.add(e.useOnlyNumbers);
    }

    /// Builds save snd remove Icons widget

    Widget _removeSaveIcons(int index) {
      return Row(
        children: <Widget>[
          Visibility(
            visible: widget.showRemoveIcon,
            child: IconButton(
              // padding: EdgeInsets.only(right: widget.tdPaddingRight),
              hoverColor: Colors.transparent,
              icon: Icon(
                widget.removeIcon,
                color: widget.removeIconColor,
                size: widget.removeIconSize,
              ),
              onPressed: () {
                rowCount = rowCount! - 1;

                setState(() {
                  _rows = removeOneRow(_rows, _rows[index]);
                });
              },
            ),
          ),
          Visibility(
            visible: widget.showSaveIcon,
            child: IconButton(
              // padding: EdgeInsets.only(right: widget.tdPaddingRight),
              hoverColor: Colors.transparent,
              icon: Icon(
                widget.saveIcon,
                color: widget.saveIconColor,
                size: widget.saveIconSize,
              ),
              onPressed: () {
                final rowIndex =
                    editedRows.indexWhere((element) => element['row'] == index);
                if (rowIndex != -1) {
                  widget.onRowSaved!(editedRows[rowIndex]);
                } else {
                  widget.onRowSaved!('no edit');
                }
              },
            ),
          ),
        ],
      );
    }

    /// Generates table columns
    List<Widget> _tableHeaders(double screenWidth) {
      return List<Widget>.generate(columnCount! + 1, (index) {
        return columnCount! + 1 == (index + 1)
            ? iconColumn(widget.showSaveIcon, widget.thPaddingTop,
                widget.thPaddingBottom)
            : THeader(
                screenWidth: screenWidth,
                widthRatio:
                    widget.columns[index].widthFactor ?? widget.columnRatio,
                thAlignment: widget.thAlignment,
                thStyle: widget.thStyle,
                thPaddingLeft: widget.thPaddingLeft,
                thPaddingTop: widget.thPaddingTop,
                thPaddingBottom: widget.thPaddingBottom,
                thPaddingRight: widget.thPaddingRight,
                headers: _columns,
                thWeight: widget.thWeight,
                thSize: widget.thSize,
                index: index);
      });
    }

    Widget createButton() {
      return Visibility(
        visible: widget.showCreateButton,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 4),
          child: InkWell(
            onTap: () {
              _rows = addOneRow(_columns, _rows);
              rowCount = rowCount! + 1;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: widget.createButtonColor ?? Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.grey.shade400)
                ],
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: widget.createButtonIcon ?? const Icon(Icons.add),
            ),
          ),
        ),
      );
    }

    Widget _tableRow(int index, double screenWidth) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(columnCount! + 1, (rowIndex) {
          final list = _rows[index];
          return columnCount! + 1 == (rowIndex + 1)
              ? _removeSaveIcons(index)
              //ignore:non_type_as_type_argument
              : RowBuilder(
                  index: index,
                  col: ckeys[rowIndex].toString(),
                  trHeight: widget.trHeight,
                  borderColor: widget.borderColor,
                  borderWidth: widget.borderWidth,
                  cellData: list[ckeys[rowIndex]].toString(),
                  tdPaddingLeft: widget.tdPaddingLeft,
                  tdPaddingTop: widget.tdPaddingTop,
                  tdPaddingBottom: widget.tdPaddingBottom,
                  tdPaddingRight: widget.tdPaddingRight,
                  tdAlignment: widget.tdAlignment,
                  tdStyle: widget.tdStyle,
                  tdEditableMaxLines: widget.tdEditableMaxLines,
                  onSubmitted: widget.onSubmitted,
                  widthRatio: cwidths[rowIndex].toDouble(),
                  isEditable: ceditable[rowIndex],
                  zebraStripe: widget.zebraStripe,
                  focusedBorder: widget.focusedBorder,
                  stripeColor1: widget.stripeColor1,
                  stripeColor2: widget.stripeColor2,
                  useOnlyNumbers: cNumOnly[rowIndex],
                  screenWidth: screenWidth,
                  //ignore:implicit_dynamic_parameter
                  onChanged: (value) {
                    ///checks if row has been edited previously
                    final result = editedRows.indexWhere((element) {
                      return element['row'] != index;
                    });

                    ///adds a new edited data to a temporary holder
                    if (result != -1) {
                      editedRows[result][ckeys[rowIndex]] = value;
                    } else {
                      final temp = <String, dynamic>{};
                      temp['row'] = index;
                      temp[ckeys[rowIndex]] = value;
                      editedRows.add(temp);
                    }

                    widget.onCellValueChanged?.call(editedRows);
                  },
                );
        }),
      );
    }

    /// Generates table rows
    Widget _tableRows(double screenWidth) {
      return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: rowCount!,
          itemBuilder: (context, index) {
            return _tableRow(index, screenWidth);
          });
    }

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scrollbar(
          isAlwaysShown: widget.scrollbarAlwaysVisible,
          controller: _scrollController,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: SizedBox(
              width: 10000,
              height: MediaQuery.of(context).size.height - 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: widget.createButtonAlign,
                children: [
                  //Table Header
                  createButton(),
                  Container(
                    padding: EdgeInsets.only(bottom: widget.thPaddingBottom),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: widget.borderColor,
                                width: widget.borderWidth))),
                    child: Row(
                        crossAxisAlignment: widget.thVertAlignment,
                        mainAxisSize: MainAxisSize.min,
                        children: _tableHeaders(10000)),
                  ),

                  _tableRows(10000),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Button for creating a new empty row

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
