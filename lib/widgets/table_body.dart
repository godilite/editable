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
  })  : _trHeight = trHeight,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        super(key: key);

  /// Table row height
  final double _trHeight;
  final Color _borderColor;
  final double _borderWidth;
  final String cellData;
  final double? widthRatio;
  final bool isEditable;
  final TextAlign tdAlignment;
  final TextStyle? tdStyle;
  final int index;
  final col;
  final double tdPaddingLeft;
  final double tdPaddingTop;
  final double tdPaddingBottom;
  final double tdPaddingRight;
  final int tdEditableMaxLines;
  final Color stripeColor1;
  final Color stripeColor2;
  final bool zebraStripe;
  final InputBorder? focusedBorder;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged onChanged;
  final bool useOnlyNumbers;

  @override
  _RowBuilderState createState() => _RowBuilderState();
}

class _RowBuilderState extends State<RowBuilder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      fit: FlexFit.loose,
      flex: 6,
      child: Container(
        height: widget._trHeight < 40 ? 40 : widget._trHeight,
        width: width * widget.widthRatio!,
        decoration: BoxDecoration(
            color: !widget.zebraStripe
                ? null
                : (widget.index % 2 == 1.0
                    ? widget.stripeColor2
                    : widget.stripeColor1),
            border: Border.all(
                color: widget._borderColor, width: widget._borderWidth)),
        child: widget.isEditable
            ? TextFormField(
                textAlign: widget.tdAlignment,
                style: widget.tdStyle,
                initialValue: widget.cellData.toString(),
                onFieldSubmitted: widget.onSubmitted,
                //TODO: make it generic
                onChanged: (value) {
                  if (widget.useOnlyNumbers) {
                    widget.onChanged(int.parse(value));
                  } else {
                    widget.onChanged(value);
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                maxLines: widget.tdEditableMaxLines,
                inputFormatters: [
                  if (widget.useOnlyNumbers)
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  filled: widget.zebraStripe,
                  fillColor: widget.index % 2 == 1.0
                      ? widget.stripeColor2
                      : widget.stripeColor1,
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
                  color: !widget.zebraStripe
                      ? null
                      : (widget.index % 2 == 1.0
                          ? widget.stripeColor2
                          : widget.stripeColor1),
                ),
                child: Text(
                  widget.cellData.toString(),
                  textAlign: widget.tdAlignment,
                  style: widget.tdStyle ??
                      TextStyle(
                          // fontSize: Theme.of(context).textTheme.bodyText1.fontSize), // returns 14?
                          fontSize: 16),
                ),
              ),
      ),
    );
  }
}
