part of '../../index.dart';

class ScanQrCodeLogic extends GetxController {
  final ScanQrCodeState state = ScanQrCodeState();

  void openQrCode(dynamic data) {
    if(GetUtils.isURL("$data")) {
      Get.offNamed(Routes.webView, arguments: {"title": "", "url": data});
    }else{
      SmartDialog.showToast(LocaleKeys.text_0175.tr);
    }
  }

  void callGallery() {
    toGallery((dynamic url) {
      if(GetUtils.isURL("$url")) {
        Get.offNamed(
            Routes.webView, arguments: {"title": "", "url": url.toString()});
      }else{
        SmartDialog.showToast(LocaleKeys.text_0175.tr);
      }
    });
  }
}
