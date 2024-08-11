import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/url_launcher.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/features/products/product_payment/presentation/riverpod/payment_callback_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({
    super.key,
    required this.url,
    required this.title,
  });
  final String url;
  final String title;
  @override
  ConsumerState<WebViewPage> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends ConsumerState<WebViewPage>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController _controller;
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  @override
  void dispose() {
    _isLoading.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void initWebView() async {
    Future(() {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              if (progress == 100) {
                _isLoading.value = false;
              }
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onNavigationRequest: (NavigationRequest request) {
              log('request.url: ${request.url}');
              if (request.url.contains('download')) {
                urlLauncher(link: request.url);
              }

              if (request.url.contains('bkash') &&
                  request.url.contains('success')) {
                ref.read(paymentCallbackProvider.notifier).state = request.url;

                (context)
                  ..pop()
                  ..pop();
              }
              return NavigationDecision.prevent;
            },
            onUrlChange: (change) {
              log('change.url: ${change.url}');
            },
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        shape: const OutlineInputBorder(borderRadius: BorderRadius.zero),
      ),
      body: ValueListenableBuilder(
        valueListenable: _isLoading,
        builder: (BuildContext context, bool value, Widget? child) {
          return _isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : WebViewWidget(controller: _controller);
        },
      ),
    );
  }
}
