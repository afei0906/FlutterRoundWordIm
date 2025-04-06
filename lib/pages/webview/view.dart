part of 'index.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final logic = Get.put(WebViewLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GetBuilder<WebViewLogic>(
        builder: (logic) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppTheme.lineColor)),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 30,
                  ),
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri.uri(Uri.parse(logic.url)),
                    ),
                    onWebViewCreated: (mWebViewController) {
                      logic.initWebViewController(mWebViewController);
                    },
                    androidShouldInterceptRequest: // <--
                        (controller, request) async {
                      return null;
                    },
                    initialOptions: logic.options,
                    onProgressChanged: (_, progress) {
                      if (progress / 100 > 0.999) {
                        logic.onLoadStop();
                      }
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      return NavigationActionPolicy.ALLOW;
                    },
                    // onTitleChanged: (_, title) {
                    //   controller.onWebTitleChanged(title ?? '');
                    // },
                  ),
                ),
                if (logic.isLoading)
                  const ColoredBox(
                    color: Colors.white,
                    child: Center(child: CupertinoActivityIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      context,
      title: logic.title,
    );
  }

  @override
  void dispose() {
    Get.delete<WebViewLogic>();
    super.dispose();
  }
}
