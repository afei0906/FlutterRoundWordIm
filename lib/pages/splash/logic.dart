part of 'index.dart';

class SplashLogic extends GetxController {
  String type = "";

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {}

  void toLogin() {
    Get.toNamed(Routes.login);
  }

  void toSign() {
    Get.toNamed(Routes.sign);
  }
}
