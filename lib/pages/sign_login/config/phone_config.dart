part of 'index.dart';

class PhoneConfig {
  static Widget login(Function callBack) {
    if (ConfigStore.to.isOpenPhone()) {
      return AppButton.brandPrimaryButton(
        LocaleKeys.text_0025.tr,
        () {
          callBack.call();
        },
      ).marginSymmetric(horizontal: 24.w, vertical: 12.h);
    }
    return 1.verticalSpace;
  }

  static Widget sign(Function callBack) {
    if (ConfigStore.to.isOpenPhone()) {
      return AppButton.brandPrimaryButton(
        LocaleKeys.text_0032.tr,
        () {
          callBack.call();
        },
      ).marginSymmetric(horizontal: 24.w, vertical: 12.h);
    }
    return 1.verticalSpace;
  }

  static List<Widget> signInviteCode(
      Function(int type, String text) callBack, int type, TextEditingController inviteCodeController ) {
    List<Widget> list = [];
    if (ConfigStore.to.isOpenPhone()) {
      list = [
        16.horizontalSpace,
        Expanded(
          child: AppButton.fillPrimaryButton(LocaleKeys.text_0032.tr, () {
            // if (logic.signByEmail()) {
            callBack.call(type, inviteCodeController.text);
            // }
          }),
        ),
      ];
    }
    return list;
  }

  static List<Widget> forgetPassword(Function() callBack) {
    List<Widget> list = [];
    if (ConfigStore.to.isOpenPhone()) {
      list = [
        12.verticalSpace,
        AppButton.brandPrimaryButton(LocaleKeys.text_0062.tr, () {
          callBack.call();
        }).marginSymmetric(horizontal: 16.w)
      ];
    }
    return list;
  }
}
