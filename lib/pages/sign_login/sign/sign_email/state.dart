part of '../index.dart';

class SignEmailState {
  TextEditingController emailFirstController = TextEditingController();
  TextEditingController emailLastController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController prePasswordController = TextEditingController();

  TextEditingController nickController = TextEditingController();

  bool passwordObscureText = true;
  bool prePasswordObscureText = true;

  bool isLogin = false;

  RxBool isChecked = true.obs;
  String? inviteCode;

  bool isButtonEnable = true; //按钮状态  是否可点击
  RxString buttonText =LocaleKeys.text_0034.tr.obs; //初始文本
  int count = 60; //初始倒计时时间
}
