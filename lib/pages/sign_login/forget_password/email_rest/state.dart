part of '../index.dart';

class EmailRestState {
  TextEditingController emailFirstController = TextEditingController();
  TextEditingController emailLastController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  // RxBool isLogin = false.obs;
  int backIndex = 0;

  bool isButtonEnable = true; //按钮状态  是否可点击
  RxString buttonText =LocaleKeys.text_0034.tr.obs; //初始文本
  int count = 60; //初始倒计时时间
}
