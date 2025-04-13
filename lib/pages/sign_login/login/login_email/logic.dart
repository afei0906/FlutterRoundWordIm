part of '../index.dart';

class LoginEmailLogic extends GetxController {
  final LoginEmailState state = LoginEmailState();

  @override
  void onInit() {
    state.emailLastController.text = emailList.first;
    if (Get.arguments != null) {
      state.emailFirstController.text = Get.arguments["emailFirst"] as String;
      state.emailLastController.text = Get.arguments["emailLast"] as String;
      update();
    }

    super.onInit();
  }

  void shufflePassword() {
    state.obscureText = !state.obscureText;
    update();
  }

  void onChanged() {
    state.isLogin = state.emailFirstController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty;
    update();
  }

  void toLoginPhone() {
    Get.offNamed(Routes.loginPhone);
  }

  void toLoginEmail() {
    if (!state.isLogin) {
      return;
    }
    final LoginRequest loginRequest = LoginRequest(
        loginName:
            "${state.emailFirstController.text}@${Utils.toEmpty(state.emailLastController.text) ?? emailList.first}",
        password: state.passwordController.text);
    VerifyCodeConfig.showCode(0, (v) async {
      loginRequest.captchaVerification = v;
      bool isOk = await LoginSignApi.login(loginRequest);
      if (isOk) {
        UserStore.to.getUserInfo();
        Get.offNamed(Routes.main);
      }
    });
  }

  void forgetPassword() {
    PasswordProtectConfig.showForgetPas(2);


  }

  void createAccount() {
    InviteCodeConfig.showInviteConde(2);
  }

  void selectCommonEmail() {
    FocusScope.of(Get.context!).unfocus();
    SmartDialog.show(
        tag: "commonEmail",
        builder: (_) {
          return CommonEmail((String? str) {
            SmartDialog.dismiss(tag: "commonEmail");
            if (!Utils.isEmpty(str)) {
              state.emailLastController.text = str!;
            }
          });
        },
        alignment: Alignment.bottomCenter);
  }
}
