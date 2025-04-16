part of '../index.dart';

class SignSussLogic extends GetxController {
  final SignSussState state = SignSussState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.type = Get.arguments["type"] as int? ?? state.type;
      state.formType = Get.arguments["formType"] as int? ?? state.formType;
      if (state.type == 0) {
        state.captchaVerification = Get.arguments["captchaVerification"];
        state.loginName = Get.arguments["loginName"];
      } else if (state.type == 2) {
        ///忘记密码
        state.passWord = Get.arguments["pass"];
      }
    }
    super.onInit();
  }

  void setPasswordProtect() {
    Get.offNamedUntil(
        Routes.passWordProtect, (route) => route.settings.name == Routes.splash,
        arguments: {"formType": 0});
  }

  void copyPas() {
    copy(state.passWord.toString());
  }

  void toLogin() {
    if (state.formType == 0) {
      Get.offNamedUntil(
          Routes.loginPhone, (route) => route.settings.name == Routes.splash);
    } else if (state.formType == 1) {
      Get.offNamedUntil(
          Routes.loginEmail, (route) => route.settings.name == Routes.splash);
    }
  }

  void toHome() {
    Get.offNamed(Routes.splash);
  }
}
