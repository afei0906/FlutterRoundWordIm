part of '../index.dart';

List<String> emailList = [
  'gmail.com',
  "qq.com",
  "163.com",
  "126.com",
  "yahoo.com",
  "outlook.com"
];

class SignEmailLogic extends GetxController {
  final SignEmailState state = SignEmailState();

  /// 倒计时的计时器。
  Timer timer = Timer(const Duration(seconds: 1), () {});

  void _initTimer() {
    state.buttonText.value = '${state.count}s '; //更新文本内容
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      state.count--;
      if (state.count == 0) {
        timer.cancel(); //倒计时结束取消定时器
        state.isButtonEnable = true; //按钮可点击
        state.buttonText.value = LocaleKeys.text_0034.tr; //更新文本内容
        state.count = 60; //重置时间
      } else {
        state.isButtonEnable = false;
        state.buttonText.value = '${state.count}s '; //更新文本内容
      }
    });
  }

  @override
  void onInit() {
    state.emailLastController.text = emailList.first;
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

  void onChanged() {
    state.isLogin = state.emailFirstController.text.isNotEmpty &&
        state.codeController.text.isNotEmpty &&
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

  void getCode() {
    if (state.emailFirstController.text.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0024.tr,
          alignment: Alignment.center);
      return;
    }
    String? email =
        '${state.emailFirstController.text}@${state.emailLastController.text.isEmpty ? emailList.first : state.emailLastController.text}';
    // log(">>>>email$email");
    if (!Utils.checkEmail(email)) {
      SmartDialog.showToast(LocaleKeys.text_0028.tr,
          alignment: Alignment.center);
      return;
    }

    if (state.isButtonEnable) {
      state.codeController.text='';
      LoginSignApi.emailCodeSend(email: email);
      _initTimer();
    }
  }

  Future<void> toSign() async {
    if (!state.isLogin) {
      return;
    }
    String? email =
        '${state.emailFirstController.text}@${state.emailLastController.text.isEmpty ? emailList.first : state.emailLastController.text}';

    // SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    bool isOk = await LoginSignApi.emailCodeCheck(
        email: email, verifyCode: state.codeController.text);
    if (isOk) {
      final RegisterRequest registerRequest = RegisterRequest(
          regType: 1,
          loginName: email,
          password: state.passwordController.text,
          nick: state.nickController.text,
          inviteCode: Utils.toEmpty(state.inviteCode));
      VerifyCodeConfig.showCode(1, (String? captchaVerification) async {
        registerRequest.captchaVerification = captchaVerification;
        final bool isOk = await LoginSignApi.register(registerRequest);
        if (isOk) {
          Get.offNamedUntil(
              Routes.signSuss, (route) => route.settings.name == Routes.splash,
              arguments: {
                "type": 0,
                "formType": 0,
                "captchaVerification": registerRequest.captchaVerification,
                "loginName":email,
                "phoneArea": null
              });
        }

        // SmartDialog.dismiss();
      });
    }
    // SmartDialog.dismiss();
  }

  @override
  void onClose() {
    timer.cancel(); //销毁计时器
    super.onClose();
  }

  void toLogin() {
    Get.offNamed(Routes.loginEmail, arguments: {
      "emailFirst": state.emailFirstController.text,
      "emailLast": state.emailLastController.text
    });
  }

  void toSingPhone() {
    Get.offNamed(Routes.signPhone, arguments: {"inviteCode": state.inviteCode});
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
