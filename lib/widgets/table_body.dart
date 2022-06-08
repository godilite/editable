import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RowBuilder extends StatefulWidget {
  ///Builds row elements for the table
  /// its properties are not nullable
  const RowBuilder({
    Key? key,
    required this.tdAlignment,
    required this.tdStyle,
    required double trHeight,
    required Color borderColor,
    required double borderWidth,
    required this.cellData,
    required this.index,
    required this.col,
    required this.tdPaddingLeft,
    required this.tdPaddingTop,
    required this.tdPaddingBottom,
    required this.tdPaddingRight,
    required this.tdEditableMaxLines,
    required this.onSubmitted,
    required this.onChanged,
    required this.widthRatio,
    required this.isEditable,
    required this.stripeColor1,
    required this.stripeColor2,
    required this.zebraStripe,
    required this.focusedBorder,
    required this.useOnlyNumbers,
    required this.screenWidth,
    required this.editMode,
    required this.onEditBackgroundColor,
    required this.rowSelected,
    required this.selectedBackgroundColor,
  })  : _trHeight = trHeight,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        super(key: key);

  /// Table row height
  final double _trHeight;
  final Color _borderColor;
  final double _borderWidth;
  final String? cellData;
  final double? widthRatio;
  final bool isEditable;
  final TextAlign tdAlignment;
  final TextStyle? tdStyle;
  final int index;
  final String col;
  final double tdPaddingLeft;
  final double tdPaddingTop;
  final double tdPaddingBottom;
  final double tdPaddingRight;
  final int tdEditableMaxLines;
  final Color stripeColor1;
  final Color stripeColor2;
  final bool zebraStripe;
  final InputBorder? focusedBorder;
  final ValueChanged? onSubmitted;
  final ValueChanged onChanged;
  final bool useOnlyNumbers;
  final double screenWidth;
  final bool editMode;
  final Color onEditBackgroundColor;
  final bool rowSelected;
  final Color selectedBackgroundColor;
  @override
  _RowBuilderState createState() => _RowBuilderState();
}

class _RowBuilderState extends State<RowBuilder> {
  bool error = false;
  Color? _bgColor() {
    if (widget.editMode && !error) {
      return widget.onEditBackgroundColor;
    } else if (widget.rowSelected) {
      return widget.selectedBackgroundColor;
    }
    return error
        ? Colors.red.withOpacity(0.12)
        : widget.index % 2 == 1.0
            ? widget.stripeColor2
            : widget.stripeColor1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._trHeight < 40 ? 40 : widget._trHeight,
      width: widget.screenWidth * widget.widthRatio!,
      decoration: BoxDecoration(
        color: widget.rowSelected
            ? widget.selectedBackgroundColor
            : (!widget.zebraStripe
                ? null
                : (widget.index % 2 == 1.0
                    ? widget.stripeColor2
                    : widget.stripeColor1)),
        border: Border.all(
          color: error ? Colors.red : widget._borderColor,
          width: error ? 2 : widget._borderWidth,
        ),
      ),
      child: widget.editMode && widget.isEditable
          ? TextFormField(
              textAlign: widget.tdAlignment,
              style: widget.tdStyle,
              initialValue: widget.cellData.toString(),
              onFieldSubmitted: (value) {
                if (widget.onSubmitted != null) {
                  if (widget.useOnlyNumbers) {
                    widget.onSubmitted!(int.parse(value));
                  } else {
                    widget.onSubmitted!(value);
                  }
                }
              },
              onChanged: (value) {
                if (widget.useOnlyNumbers) {
                  final _num = int.tryParse(value);
                  if (_num == null) {
                    setState(() {
                      error = true;
                      widget.onChanged(_num);
                    });
                  } else {
                    error = false;
                    widget.onChanged(_num);
                  }
                } else {
                  if (value.isEmpty) {
                    setState(() {
                      error = true;
                      widget.onChanged(value);
                    });
                  } else {
                    setState(() {
                      error = false;
                    });
                    widget.onChanged(value);
                  }
                }
              },
              textAlignVertical: TextAlignVertical.center,
              maxLines: widget.tdEditableMaxLines,
              inputFormatters: [
                if (widget.useOnlyNumbers)
                  FilteringTextInputFormatter.allow(RegExp(r'-?[0-9]{0,10}')),
              ],
              decoration: InputDecoration(
                filled: widget.zebraStripe,
                fillColor: _bgColor(),
                contentPadding: EdgeInsets.only(
                    left: widget.tdPaddingLeft,
                    right: widget.tdPaddingRight,
                    top: widget.tdPaddingTop,
                    bottom: widget.tdPaddingBottom),
                border: InputBorder.none,
                focusedBorder: widget.focusedBorder,
              ),
            )
          : Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: widget.tdPaddingLeft,
                right: widget.tdPaddingRight,
                // top: widget.tdPaddingTop,
                // bottom: widget.tdPaddingBottom,
              ),
              decoration: BoxDecoration(
                color: widget.rowSelected
                    ? widget.selectedBackgroundColor
                    : (!widget.zebraStripe
                        ? null
                        : (widget.index % 2 == 1.0
                            ? widget.stripeColor2
                            : widget.stripeColor1)),
              ),
              child: Text(
                widget.cellData ?? '',
                textAlign: widget.tdAlignment,
                style: widget.tdStyle ??
                    const TextStyle(
                        // fontSize: Theme.of(context).textTheme.bodyText1.fontSize), // returns 14?
                        fontSize: 16),
              ),
            ),
    );
  }
}
