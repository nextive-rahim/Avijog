import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/features/products/product_details/presentation/riverpod/verify_customer_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CustomerSignUpWebviewPage extends ConsumerStatefulWidget {
  const CustomerSignUpWebviewPage({
    super.key,
    required this.webviewLink,
    required this.closingLink,
  });
  final String? webviewLink;
  final String? closingLink;

  @override
  ConsumerState<CustomerSignUpWebviewPage> createState() =>
      _CustomerSignUpWebviewPageState();
}

class _CustomerSignUpWebviewPageState
    extends ConsumerState<CustomerSignUpWebviewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.webviewLink == null) {
      return;
    }

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onProgress: (int progress) {
            const CircularProgressIndicator();
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (UrlChange change) async {
            if (widget.closingLink != null && change.url != null) {
              if (change.url?.trim() == widget.closingLink?.trim()) {
                ref.read(verifyCustomerProvider.notifier).reVerify();
                Navigator.of(context).pop();
              }
            }
          },
          onPageFinished: (String url) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message.message),
            ),
          );
        },
      )
      ..loadRequest(
        Uri.parse(widget.webviewLink!),
      );

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Create Account'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });
              }
            },
          ),
        ),
        body: SafeArea(
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }

  _onWillPop(bool canGoBack) async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    } else {
      return true;
    }
  }
}
