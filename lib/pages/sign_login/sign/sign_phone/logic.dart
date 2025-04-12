part of '../index.dart';

class SignPhoneLogic extends GetxController {
  final SignPhoneState state = SignPhoneState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.inviteCode = Get.arguments['inviteCode'] as String?;
    }
    super.onInit();
  }

  void shufflePassword() {
    state.passwordObscureText = !state.passwordObscureText;
    update();
  }

  void shufflePrePassword() {
    state.prePasswordObscureText = !state.prePasswordObscureText;
    update();
  }

  void selectPhoneCountry() {
    Get.toNamed(Routes.selectPhoneCountry, arguments: state.countryCodeModel)?.then((onValue){
      if(onValue !=null){
        state.countryCodeModel=onValue as CountryCodeModel;
        update();
      }
    });
  }

  void onChanged() {
    state.isLogin = state.phoneController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty &&
        state.prePasswordController.text.isNotEmpty &&
        state.nickController.text.isNotEmpty &&
        state.isChecked.isTrue;
    update();
  }

  void checkBox() {
    state.isChecked.value = !state.isChecked.value;
    update();
  }

  void getCode() {}

  void toSign() async {
    if (!state.isLogin) {
      return;
    }
    // SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    final RegisterRequest registerRequest = RegisterRequest(
        regType: 2,
        loginName:
            "${state.countryCodeModel.code}${state.phoneController.text}",
        password: state.passwordController.text,
        nick: state.nickController.text,
        inviteCode: Utils.toEmpty(state.inviteCode));
    VerifyCodeConfig.showCode(1, (String? captchaVerification) async {
      registerRequest.captchaVerification = captchaVerification;
      final bool isOk = await LoginSignApi.register(registerRequest);
      if (isOk) {
        Get.offNamedUntil(
            Routes.signSuss, (route) => route.settings.name == Routes.splash,
            arguments: {"type": 0, "formType": 0});
      }
      // SmartDialog.dismiss();
    });
  }

  void toLogin() {
    Get.offNamed(Routes.loginPhone, arguments: {
      "phone": state.phoneController.text,
      "phoneArea": state.countryCodeModel
    });
  }

  void toSingEmail() {
    Get.offNamed(Routes.signEmail, arguments: {"inviteCode": state.inviteCode});
  }
}
