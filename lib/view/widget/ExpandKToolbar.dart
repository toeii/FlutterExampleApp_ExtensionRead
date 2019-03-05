import 'package:flutter/material.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///
class ExpandKToolbar extends AppBar implements PreferredSizeWidget {
  ExpandKToolbar({
    Key key,
    leading,
    automaticallyImplyLeading = true,
    title,
    actions,
    flexibleSpace,
    bottom,
    elevation = 4.0,
    backgroundColor,
    brightness,
    iconTheme,
    textTheme,
    primary = true,
    centerTitle,
    titleSpacing = NavigationToolbar.kMiddleSpacing,
    toolbarOpacity = 1.0,
    bottomOpacity = 1.0,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation != null),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight((bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  Size preferredSize;
}