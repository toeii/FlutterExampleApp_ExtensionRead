import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

/**
 * Created by toeii
 * Date: 2019-01-16
 */
///主题Redux
final ThemeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class RefreshThemeDataAction {
  final ThemeData themeData;
  RefreshThemeDataAction(this.themeData);
}
