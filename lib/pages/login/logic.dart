part of 'index.dart';

class LoginLogic extends GetxController {
  LoginState state = LoginState();

  void shufflePassword() {
    state.obscureText = !state.obscureText;
    update();
  }

  void onChanged() {
    state.isLogin = state.phoneController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty;
    update();
  }

  void toLogin() {}

  void forgetPassword() {}

  void createAccount() {}

  @override
  void onClose() {
    super.onClose();
  }
}
