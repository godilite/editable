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
    required this.tableWidth,
    required this.tableHeight,
    required this.editedRowBackgroundColor,
    required this.selectedRowBackgroundColor,
    required this.actionsBuilder,
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

  /// Width of the table.
  final double tableWidth;

  /// Height of the table.
  final double tableHeight;

  /// Background color of row that is edited.
  final Color editedRowBackgroundColor;

  /// Background color of selected row.
  final Color selectedRowBackgroundColor;

  final Widget Function(
    Map<String, dynamic> rowData,
    void Function(bool) onEditMode,
  ) actionsBuilder;

  @override
  EditableState createState() => EditableState();
}

class EditableState extends State<Editable> {
  int? columnCount;
  int? rowCount;
  late List<EditableColumn> _columns;
  late List<Map<String, dynamic>> _rows;

  ///Get all edited rows
  List<Map<String, dynamic>> get editedRows => _editedRows;

  ///Create a row after the last row
  List<Map<String, dynamic>> createRow() =>
      addOneRow(widget.columns, widget.rows);

  /// Temporarily holds all edited rows
  final List<Map<String, dynamic>> _editedRows = [];

  /// Controller for the scrollbar
  final ScrollController _scrollController = ScrollController();

  /// initial Setup of columns and row, sets count of column and row

  @override
  void initState() {
    rowCount = widget.rows.isEmpty ? widget.rowCount : widget.rows.length;
    columnCount = widget.columns.isEmpty ? columnCount : widget.columns.length;
    _columns = widget.columns;
    _rows = widget.rows;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 40 for the checkbox + 80 for the action buttons
    const widthOfEditButton = 80.0 + 40.0;

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

    /// Generates table columns
    List<Widget> _tableHeaders() {
      return [
        const SizedBox(
          width: widthOfEditButton,
        ),
        ...List<Widget>.generate(columnCount! + 1, (index) {
          return columnCount! + 1 == (index + 1)
              ? iconColumn(widget.showSaveIcon, widget.thPaddingTop,
                  widget.thPaddingBottom)
              : THeader(
                  screenWidth: widget.tableWidth,
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
        })
      ];
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

    /// Generates table rows
    Widget _tableRows() {
      return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: rowCount!,
          itemBuilder: (context, index) {
            return _RowBuilder(
              onSelectedChanged: (value) {
                _rows[index]['selected'] = value;
              },
              actionsBuilder: (row, onEditMode) => widget.actionsBuilder(
                row,
                (editMode) {
                  if (!editMode) {
                    /// checks if row has been edited previously
                    final result = editedRows.indexWhere((element) {
                      return element['row'] == index;
                    });

                    /// Removes edited values if edit mode was dismissed.
                    if (result != -1) {
                      editedRows.removeAt(result);
                    }
                  }
                  onEditMode(editMode);
                },
              ),
              cellKeys: ckeys,
              columnCount: columnCount!,
              rows: _rows,
              columnIndex: index,
              selected: _rows[index]['selected'] as bool? ?? false,
              cellBuilder: (context, rowIndex, cellData, editMode) {
                return RowBuilder(
                  index: index,
                  col: ckeys[rowIndex].toString(),
                  trHeight: widget.trHeight,
                  borderColor: widget.borderColor,
                  borderWidth: widget.borderWidth,
                  cellData: cellData,
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
                  screenWidth: widget.tableWidth,
                  editMode: editMode,
                  onEditBackgroundColor: widget.editedRowBackgroundColor,
                  rowSelected: _rows[index]['selected'] as bool? ?? false,
                  selectedBackgroundColor: widget.selectedRowBackgroundColor,
                  //ignore:implicit_dynamic_parameter
                  onChanged: (value) {
                    ///checks if row has been edited previously
                    final result = editedRows.indexWhere((element) {
                      return element['row'] == index;
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
              },
            );
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
              width: widget.tableWidth + widthOfEditButton,
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
                        children: _tableHeaders()),
                  ),

                  SizedBox(
                    height: widget.tableHeight,
                    child: _tableRows(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _RowBuilder extends StatefulWidget {
  const _RowBuilder({
    Key? key,
    required this.columnCount,
    required this.rows,
    required this.columnIndex,
    required this.cellBuilder,
    required this.cellKeys,
    required this.onSelectedChanged,
    required this.selected,
    required this.actionsBuilder,
  }) : super(key: key);

  final int columnCount;
  final List<Map<String, dynamic>> rows;
  final int columnIndex;
  final List<String> cellKeys;
  final Widget Function(BuildContext, int, String, bool) cellBuilder;
  final Function(bool) onSelectedChanged;
  final bool selected;
  final Widget Function(Map<String, dynamic>, Function(bool)) actionsBuilder;

  @override
  State<_RowBuilder> createState() => _RowBuilderState();
}

class _RowBuilderState extends State<_RowBuilder> {
  bool editMode = false;
  late bool selected = widget.selected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
          ),
          child: SizedBox(
            width: 40,
            height: 100,
            child: Checkbox(
              value: selected,
              // TODO enable selection when we can do something with it
              onChanged: true
                  ? null
                  : (value) {
                      setState(() {
                        selected = value ?? false;
                        widget.onSelectedChanged(value ?? false);
                      });
                    },
            ),
          ),
        ),
        widget.actionsBuilder(
          widget.rows[widget.columnIndex],
          (isEditing) => setState(
            () {
              editMode = isEditing;
            },
          ),
        ),
        ...List.generate(widget.columnCount, (rowIndex) {
          final list = widget.rows[widget.columnIndex];
          return widget.cellBuilder(
            context,
            rowIndex,
            list[widget.cellKeys[rowIndex]].toString(),
            editMode,
          );
        })
      ],
    );
  }
}
