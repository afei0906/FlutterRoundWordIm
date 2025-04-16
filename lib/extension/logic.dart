part of 'index.dart';

extension PrivacyLogic on GetxController {
  void userAgreement() {
    Get.toNamed(Routes.webView, arguments: {
      "title": LocaleKeys.text_0003.tr,
      "url": "https://www.baidu.com/"
    });
  }

  void privacyPolicy() {
    Get.toNamed(Routes.webView, arguments: {
      "title": LocaleKeys.text_0004.tr,
      "url": "https://www.baidu.com/"
    });
  }

  void contactService() {
    SmartDialog.showToast(LocaleKeys.text_0060.tr, alignment: Alignment.center);
  }

  void copy(String str) {
    Clipboard.setData(ClipboardData(text: str),);
    SmartDialog.showToast(LocaleKeys.text_0125.trParams({"word": str}),alignment: Alignment.center);
  }
}
