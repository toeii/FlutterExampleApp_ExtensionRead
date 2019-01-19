import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebLoadPage extends StatefulWidget {

  @override
  _WebLoadPageState createState() => _WebLoadPageState();

}

class _WebLoadPageState extends State<WebLoadPage> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.baidu.com";
  var title = "百度";

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
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
      url: urlString,
      withZoom: false,
    );
  }
}