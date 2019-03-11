import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/redux/ThemeRedux.dart';
import 'package:flutter_extension_read/view/widget/FullButton.dart';
import 'package:redux/redux.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///全局配置类
class ERAppConfig {

  static final String BASE_URL = "http://baobab.kaiyanapp.com/api/v4/";
  static final String BASE_URL_V5 = "http://baobab.kaiyanapp.com/api/v5/";
  static final String BASE_URL_V6 = "http://baobab.kaiyanapp.com/api/v6/";
  static final String DEF_IMAGE_URL = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3916306502,1143475951&fm=26&gp=0.jpg";

  static const String PLATFORM_VERSION = "1.0";

  static const THEME_COLOR = "theme-color";

  ///===============Theme==============

  static const int primaryValue = 0xFF2196F3;
  static const int primaryLightValue = 0xFFBBDEFB;
  static const int primaryDarkValue = 0xFF1976D2;

  static List<Color> getThemeListColor() {
    return [
      primarySwatch,
      Colors.brown,
      Colors.deepPurple,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = new ThemeData(primarySwatch: colors[index], platform: TargetPlatform.iOS);
    store.dispatch(new RefreshThemeDataAction(themeData));
  }

  static Future<Null> showCommitOptionDialog(
      BuildContext context,
      List<String> commitMaps,
      ValueChanged<int> onTap, {
        width = 250.0,
        height = 400.0,
        List<Color> colorList,
      }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: new Container(
              width: width,
              height: height,
              padding: new EdgeInsets.all(4.0),
              margin: new EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: new ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return FullButton(
                      maxLines: 2,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      color: colorList != null ? colorList[index] : Theme.of(context).primaryColor,
                      text: commitMaps[index],
                      textColor: Color(0xFFFFFFFF),
                      onPress: () {
                        Navigator.pop(context);
                        onTap(index);
                      },
                    );
                  }),
            ),
          );
        });
  }


}