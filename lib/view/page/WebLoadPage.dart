import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebLoadPage extends StatefulWidget {
  var title = "百度";
  var url = "https://www.baidu.com";

  @override
  _WebLoadPageState createState() => _WebLoadPageState(title,url);

  WebLoadPage({Key key,@required this.title,@required this.url}):super(key:key);

}

class _WebLoadPageState extends State<WebLoadPage> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  var title;
  var url;

  _WebLoadPageState(String title,String url){
    this.title = title;
    this.url = url;
  }

  launchUrl() {
    setState(() {
      url = controller.text;
      flutterWebviewPlugin.reloadUrl(url);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      if(wvs.type.toString() == 'WebViewState.finishLoad'){
        //web page finishLoad
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      url: url,
      withZoom: false,
    );
  }
}