/**
 * Created by toeii
 * Date: 2019-01-16
 */
import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/redux/ThemeRedux.dart';

///全局Redux
class ERAppState {

  ///主题数据
  ThemeData themeData;

  ERAppState({this.themeData});

}

///创建 Reducer
ERAppState appReducer(ERAppState state, action) {
  return ERAppState(
    themeData: ThemeDataReducer(state.themeData, action),
  );
}
