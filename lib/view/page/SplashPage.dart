import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_extension_read/view/page/MainPage.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///开屏页(没业务处理暂时搁置)
class SplashPage extends StatefulWidget{

  SplashPage({Key key}):super(key:key);
  @override
  _SplashPage createState()=> new _SplashPage();

}

class _SplashPage extends State<SplashPage>{

  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child:Image.asset("images/splash_extension_read.png",fit: BoxFit.fill,),
      );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  void countDown() {
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, goToHomePage);
  }

  void goToHomePage(){
    if(!isStartHomePage){
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) =>
            new MainPage()), (Route<dynamic> rout)=>false
      );
      isStartHomePage=true;
    }
  }
}
