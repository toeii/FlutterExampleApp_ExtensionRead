import 'package:flutter_extension_read/model/Home.dart';
import 'package:flutter_extension_read/service/AppHttpClient.dart';

class AppApi {

  static final String BaseUrl = "http://baobab.kaiyanapp.com/api/v4/";

  Future<Home> getHomeList(String date,String num,String page) async {
    String requestUrl = AppApi.BaseUrl + "tabs/selected?date="+date+"&num="+num+"&page="+page;
    AppHttpClient.get(requestUrl, (data) {
        return Home.fromJSON(data);
      },
      errorCallBack: (errorMsg) {
        print("error:" + errorMsg);
      }
    );
    return null;
  }


}