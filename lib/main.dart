import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const SafeRideApp());
}

class SafeRideApp extends StatelessWidget {
  const SafeRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Ride',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeRideWebView(),
    );
  }
}

class SafeRideWebView extends StatefulWidget {
  const SafeRideWebView({super.key});

  @override
  State<SafeRideWebView> createState() => _SafeRideWebViewState();
}

class _SafeRideWebViewState extends State<SafeRideWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://safe-ride-58f05.web.app/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safe Ride')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
