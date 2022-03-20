import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubView extends StatelessWidget {
  final String url;
  const GitHubView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
