import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///加载网页
class WebLoadPage extends StatefulWidget {
  var title = "toeii";
  var url = "https://github.com/toeii";
  var foregroundWidget;

  @override
  _WebLoadPageState createState() => _WebLoadPageState();

  WebLoadPage({Key key,@required this.title,@required this.url}):super(key:key);

}

class _WebLoadPageState extends State<WebLoadPage> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  launchUrl() {
    setState(() {
      widget.foregroundWidget = new Container( alignment: AlignmentDirectional.center, child: CircularProgressIndicator());
      widget.url = controller.text;
      flutterWebviewPlugin.reloadUrl(widget.url);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      if(wvs.type.toString() == 'WebViewState.finishLoad'){
        //web page finishLoad
        widget.foregroundWidget = null;
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
            hintText: widget.title,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      url: widget.url,
      withZoom: false,
    );
  }
}