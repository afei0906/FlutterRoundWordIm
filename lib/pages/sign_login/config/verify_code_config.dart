part of 'index.dart';

class VerifyCodeConfig {
  ///type 0 登录 1 注册
  static void showCode(
      int type, Function(String? captchaVerification) callBack) {
    if (!ConfigStore.to.isOpenVerifyCode()) {
      callBack.call(null);
      return;
    }
    SmartDialog.show(
      clickMaskDismiss: false,
      tag: "inviteCode",
      builder: (_) {
        return BlockPuzzleCaptchaPage(
          onSuccess: (v) {
            SmartDialog.dismiss();
            callBack.call(v);
          },
          onFail: () {},
          callBack: () {
            SmartDialog.dismiss();
          },
        );
      },
      alignment: Alignment.bottomCenter,
    );
  }
}
