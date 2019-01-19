import 'package:flutter/material.dart';

class BarBottomDivider extends Divider implements PreferredSizeWidget {
  BarBottomDivider({
    Key key,
    height = 1.0,
    indent = 0.0,
    color,
  })  : assert(height >= 0.0),
        super(
        key: key,
        height: height,
        indent: indent,
        color: color,
      ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}