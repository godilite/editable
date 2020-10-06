import 'package:flutter/material.dart';

class RowBuilder extends StatefulWidget {
  ///Builds row elements for the table
  /// its properties are not nullable
  const RowBuilder({
    Key key,
    @required this.tdAlignment,
    @required this.tdStyle,
    @required double trHeight,
    @required Color borderColor,
    @required double borderWidth,
    @required this.cellData,
    @required this.index,
    @required this.col,
    @required this.tdPaddingLeft,
    @required this.tdPaddingTop,
    @required this.tdPaddingBottom,
    @required this.tdPaddingRight,
    @required this.onSubmitted,
    @required this.onChanged,
  })  : _trHeight = trHeight,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        super(key: key);

  /// Table row height
  final double _trHeight;
  final Color _borderColor;
  final double _borderWidth;
  final String cellData;
  final TextAlign tdAlignment;
  final TextStyle tdStyle;
  final int index;
  final col;
  final double tdPaddingLeft;
  final double tdPaddingTop;
  final double tdPaddingBottom;
  final double tdPaddingRight;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;

  @override
  _RowBuilderState createState() => _RowBuilderState();
}

class _RowBuilderState extends State<RowBuilder> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 5,
      child: Container(
          height: widget._trHeight < 40 ? 40 : widget._trHeight,
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget._borderColor, width: widget._borderWidth)),
          child: TextFormField(
            textAlign: widget.tdAlignment,
            style: widget.tdStyle,
            initialValue: widget.cellData,
            onFieldSubmitted: widget.onSubmitted,
            onChanged: widget.onChanged,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: widget.tdPaddingLeft,
                    right: widget.tdPaddingRight,
                    top: widget.tdPaddingTop,
                    bottom: widget.tdPaddingBottom),
                border: InputBorder.none),
          )),
    );
  }
}
