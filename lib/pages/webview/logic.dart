part of 'index.dart';

class WebViewLogic extends GetxController {
  late final String url;
  late final String title;
  InAppWebViewController? webViewController;
  bool isLoading = true;

  void onBack() {
    Get.back();
  }

  void onLoadStop() {
    isLoading = false;
    update();
  }

  final InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),

    /// android 支持HybridComposition
    android: AndroidInAppWebViewOptions(
      
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  Future<String?> getUrl() {
    if (webViewController == null) {
      return Future.sync(() => null);
    }
    return webViewController!.getUrl().then((uri) => uri.toString());
  }

  Future<void> loadUrl(String url) {
    if (webViewController == null) {
      return Future.sync(() => null);
    }
    return webViewController!
        .loadUrl(urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))));
  }

  // void onWebTitleChanged(String newTitle) {
  //   if (newTitle.isEmpty || newTitle == title) return;
  //   title = newTitle;
  //   upload();
  // }

  @override
  void onInit() {
    url = Get.arguments['url'] as String;
    title = Get.arguments['title'] as String;
    super.onInit();
  }

  void initWebViewController(InAppWebViewController webViewController) {
    // 添加 JavaScript 调用处理器
    this.webViewController = webViewController;
    // webViewController.addJavaScriptHandler(
    //     handlerName: 'jsCallBack',
    //     callback: (args) {
    //       // args 是 JavaScript 调用传递的参数
    //       log("args$args");
    //       return 'Response from Flutter';
    //     });
    // Future<bool> canGoBack = webViewController.canGoBack();
  }
}
