part of '../index.dart';

class SignSussLogic extends GetxController {
  final SignSussState state = SignSussState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      ///0 注册成功 1，设置密保成功,2.忘记密码
      state.type = Get.arguments["type"] as int? ?? state.type;

      ///0 phone，1、email
      state.formType = Get.arguments["formType"] as int? ?? state.formType;

      state.loginName = Get.arguments["loginName"];
      state.phoneArea = Get.arguments["phoneArea"];

      if (state.type == 0) {
        state.captchaVerification = Get.arguments["captchaVerification"];
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
        arguments: {
          "formType": state.formType,
          "loginName": state.loginName,
          'phoneArea': state.phoneArea
        });
  }

  void copyPas() {
    copy(state.passWord.toString());
  }

  void toLogin() {
    if (state.formType == 0) {
      dynamic arg;
      try {
        arg = {"phone": state.loginName, "phoneArea": state.phoneArea};
      } catch (e) {}
      Get.offNamedUntil(
          Routes.loginPhone, (route) => route.settings.name == Routes.splash,
          arguments: arg);
    } else if (state.formType == 1) {
      dynamic arg;
      try {
        final List<String> a = state.loginName.toString().split("@");
        arg = {"emailFirst": a[0], "emailLast": a[1]};
      } catch (e) {}
      Get.offNamedUntil(
          Routes.loginEmail, (route) => route.settings.name == Routes.splash,
          arguments: arg);
    }
  }

  void toHome() {
    Get.offNamed(Routes.splash);
  }
}
