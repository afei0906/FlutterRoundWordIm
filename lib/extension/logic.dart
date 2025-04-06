part of 'index.dart';

extension PrivacyLogic on GetxController {
  void userAgreement() {
    Get.toNamed(Routes.webView, arguments: {
      "title": LocaleKeys.text_0003.tr,
      "url":
          "https://app.splitgo.io/user-and-service-agreement-${LanguageStore.to.getAppLanguageCode()}/"
    });
  }

  void privacyPolicy() {
    Get.toNamed(Routes.webView, arguments: {
      "title": LocaleKeys.text_0004.tr,
      "url":
          "https://app.splitgo.io/privacy-policy-${LanguageStore.to.getAppLanguageCode()}/"
    });
  }
}
