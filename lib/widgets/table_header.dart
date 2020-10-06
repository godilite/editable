import 'package:flutter/material.dart';

class THeader extends StatelessWidget {
  ///Builds elements for the table headers
  const THeader(
      {Key key,
      @required this.thPaddingLeft,
      @required this.thPaddingTop,
      @required this.thPaddingBottom,
      @required this.thPaddingRight,
      @required List headers,
      @required FontWeight thWeight,
      @required double thSize,
      @required int index})
      : _headers = headers,
        _thWeight = thWeight,
        _thSize = thSize,
        _index = index,
        super(key: key);

  final double thPaddingLeft;
  final double thPaddingTop;
  final double thPaddingBottom;
  final double thPaddingRight;
  final List _headers;
  final FontWeight _thWeight;
  final double _thSize;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 6,
      child: Padding(
        padding: EdgeInsets.only(
            left: thPaddingLeft,
            top: thPaddingTop,
            bottom: thPaddingBottom,
            right: thPaddingRight),
        child: Text(
          _headers != null || _headers.isNotEmpty
              ? _headers[_index]['title']
              : '',
          style: TextStyle(fontWeight: _thWeight, fontSize: _thSize),
        ),
      ),
    );
  }
}
