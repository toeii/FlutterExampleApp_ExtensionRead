import 'package:flutter/material.dart';
import 'package:flutter_extension_read/service/ERAppConfig.dart';
import 'package:flutter_extension_read/service/redux/ERAppState.dart';
import 'package:flutter_extension_read/view/page/MainPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final store = new Store<ERAppState>(
    appReducer,
    ///init store
    initialState: new ERAppState(
        themeData: new ThemeData(
          primarySwatch: ERAppConfig.primarySwatch,
        ),
      ),
  );


  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<ERAppState>(builder: (context, store) {
        return new MaterialApp(
            title: '拓意阅读',
            debugShowCheckedModeBanner: true,
            home: new MainPage(),
            theme: store.state.themeData,
          );
      }),
    );

  }
}
