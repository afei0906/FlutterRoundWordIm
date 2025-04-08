part of 'index.dart';

class SplashLogic extends GetxController {
  SplashState state = SplashState();
  String type = "";

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {}

  void toLogin() {
    Get.toNamed(Routes.loginPhone);
  }

  void toSign() {
    SmartDialog.show(
      clickMaskDismiss: false,
      builder: (_) {
        return const InviteCodeWidget();
      },
      alignment: Alignment.bottomCenter,
    );
  }

  void signByEmail() {
    if (state.inviteCodeController.text.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0031.tr);
      return;
    }
    Get.toNamed(Routes.signEmail,
        arguments: {"inviteCode": state.inviteCodeController.text});
  }

  void signByPhone() {
    if (state.inviteCodeController.text.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0031.tr);
      return;
    }

    SmartDialog.dismiss();
    Get.toNamed(Routes.signPhone,
        arguments: {"inviteCode": state.inviteCodeController.text});
  }
}
