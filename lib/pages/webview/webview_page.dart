/*
 * @Author: Rongj
 * @Date: 2019-07-08 16:05:27
 * @LastEditTime: 2019-07-17 11:40:15
 */

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:app/components/loading.dart';

class WebviewPage extends StatefulWidget {
  WebviewPage({
    Key key,
    this.title,
    this.url,
  }) : super(key: key);
  final String title;
  final String url;
  
  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    _flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.url);
    });
    _flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(url);
      // if(url.contains("whatsapp://")) {
      //   _flutterWebviewPlugin.goBack();
      //   _launchURL(url);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0.3,
      ),
      withZoom: true,
      withLocalStorage: true,
      // hidden: true,
      initialChild: Center(
        child: Loading(),
      ),
    );
  }
}