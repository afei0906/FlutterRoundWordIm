part of '../index.dart';

class EmailRestLogic extends GetxController {
  final EmailRestState state = EmailRestState();

  /// 倒计时的计时器。
  Timer timer = Timer(const Duration(seconds: 1), () {});

  @override
  void onInit() {
    state.emailLastController.text = emailList.first;
    super.onInit();
  }

  void onBack() {
    if (state.backIndex > 0) {
      state.backIndex--;
      update();
    } else {
      Get.back();
    }
  }

  String getEmail() {
    return "${state.emailFirstController.text}@${Utils.toEmpty(state.emailLastController.text) ?? emailList.first}";
  }

  @override
  void onClose() {
    timer.cancel(); //销毁计时器
    super.onClose();
  }
}

extension RestEmailRestLogicX on EmailRestLogic {
  void onChanged() {
    // state.isLogin.value = state.emailFirstController.text.isNotEmpty;
    update();
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

  Future<void> toNext() async {
    bool isClick = false;
    if (state.backIndex == 0) {
      isClick = state.emailFirstController.text.isNotEmpty;
    } else if (state.backIndex == 1) {
      isClick = state.codeController.text.isNotEmpty;
    }
    if (!isClick) {
      return;
    }
    if (state.backIndex == 0) {
      getCode();
      state.backIndex++;
    } else if (state.backIndex == 1) {
      String? pass = await LoginSignApi.resetPasswordByEmailVerifyCode(
          getEmail(), state.codeController.text);
      if (pass != null) {
        Get.toNamed(Routes.signSuss,
            arguments: {"formType": 1, "type": 2, "pass": pass});
      }
    }

    update();
  }
}

extension NextEmailRestLogicx on EmailRestLogic {
  void _initTimer() {
    state.codeController.text = '';
    state.buttonText.value = '${state.count}s '; //更新文本内容
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      state.count--;
      if (state.count == 0) {
        timer.cancel(); //倒计时结束取消定时器
        state.isButtonEnable = true; //按钮可点击
        state.buttonText.value = LocaleKeys.text_0042.tr; //更新文本内容
        state.count = 60; //重置时间
      } else {
        state.isButtonEnable = false;
        state.buttonText.value = '${state.count}s '; //更新文本内容
      }
    });
  }

  Future<void> getCode() async {
    if (state.emailFirstController.text.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0024.tr,
          alignment: Alignment.center);
      return;
    }
    String? email = getEmail();
    // log(">>>>email$email");
    if (!Utils.checkEmail(email)) {
      SmartDialog.showToast(LocaleKeys.text_0028.tr,
          alignment: Alignment.center);
      return;
    }

    if (state.isButtonEnable) {
      LoginSignApi.emailCodeSend(email: email, useType: 2);
      _initTimer();
    }
  }
}
