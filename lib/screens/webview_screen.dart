// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  WebViewScreenState createState() => WebViewScreenState();
}

WebViewController? controllerGlobal;

Future<bool> _exitApp(BuildContext context) async {
  if (await controllerGlobal!.canGoBack()) {
    controllerGlobal!.goBack();
  } else {
    return Future.value(false);
  }
  return Future.value(false);
}

class WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
