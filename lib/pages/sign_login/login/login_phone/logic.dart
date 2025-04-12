part of '../index.dart';

class LoginPhoneLogic extends GetxController {
  final LoginPhoneState state = LoginPhoneState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.phoneController.text = Get.arguments["phone"] as String;
      state.countryCodeModel = Get.arguments["phoneArea"] as CountryCodeModel;
      update();
    }
    super.onInit();
  }

  void shufflePassword() {
    state.obscureText = !state.obscureText;
    update();
  }

  void onChanged() {
    state.isLogin = state.phoneController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty;
    update();
  }

  Future<void> toLoginPhone() async {
    if (!state.isLogin) {
      return;
    }
    final LoginRequest loginRequest = LoginRequest(
        loginName:
            "${state.countryCodeModel.code}${state.phoneController.text}",
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

  void toLoginEmail() {
    Get.offNamed(Routes.loginEmail);
  }

  void selectPhoneCountry() {
    Get.toNamed(Routes.selectPhoneCountry, arguments: state.countryCodeModel)?.then((onValue){
      if(onValue !=null){
        state.countryCodeModel=onValue as CountryCodeModel;
        update();
      }
    });
  }

  void forgetPassword() {
    Get.toNamed(Routes.forgetPassword);
  }

  void createAccount() {
    InviteCodeConfig.showInviteConde(1);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
