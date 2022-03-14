import 'package:editable/commons/column.dart';
import 'package:flutter/material.dart';

class THeader extends StatelessWidget {
  ///Builds elements for the table headers
  const THeader(
      {Key? key,
      required this.thPaddingLeft,
      required this.thPaddingTop,
      required this.thPaddingBottom,
      required this.thPaddingRight,
      required List<EditableColumn>? headers,
      required this.thAlignment,
      required this.thStyle,
      required FontWeight thWeight,
      required double thSize,
      required double? widthRatio,
      required this.screenWidth,
      required int index})
      : _headers = headers,
        _thWeight = thWeight,
        _thSize = thSize,
        _index = index,
        _widthRatio = widthRatio,
        super(key: key);

  final double thPaddingLeft;
  final double screenWidth;
  final double thPaddingTop;
  final double thPaddingBottom;
  final double thPaddingRight;
  final List<EditableColumn>? _headers;
  final TextAlign? thAlignment;
  final TextStyle? thStyle;
  final FontWeight _thWeight;
  final double _thSize;
  final int _index;
  final double? _widthRatio;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: SizedBox(
        width: screenWidth * _widthRatio!,
        child: Padding(
          padding: EdgeInsets.only(
              left: thPaddingLeft,
              top: thPaddingTop,
              bottom: thPaddingBottom,
              right: thPaddingRight),
          child: Text(
            _headers != null || _headers!.isNotEmpty
                ? _headers![_index].title
                : '',
            style:
                thStyle ?? TextStyle(fontWeight: _thWeight, fontSize: _thSize),
            textAlign: thAlignment ?? TextAlign.start,
          ),
        ),
      ),
    );
  }
}
