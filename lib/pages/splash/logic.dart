part of 'index.dart';

class SplashLogic extends GetxController {
  SplashState state = SplashState();
  String type = "";

  @override
  void onInit() {
    super.onInit();
    appVerify();
  }

  Future<bool> initClientConf() async {
    await ConfigStore.to.featData();
    // await UserStore.to.getUserInfo();
    return UserStore.to.getUserInfo();
  }

  Future<void> appVerify() async {
    SmartDialog.showLoading(msg: LocaleKeys.text_0082.tr);
    bool isVerify = await LoginSignApi.postAppVerify();
    if (isVerify) {
      bool isLogin = await initClientConf();
      state.isLoading.value = false;
      if (isLogin) {
        Get.offNamed(Routes.main);
      } else {
        update();
      }
    } else {
      await SmartDialog.showToast(LocaleKeys.text_0081.tr,
          alignment: Alignment.center);
      exit(0);
    }
    SmartDialog.dismiss();
  }

  void toLogin() {
    // Get.offNamedUntil(
    //     Routes.signSuss, (route) => route.settings.name == Routes.splash,
    //     arguments: {"type": 0, "formType": 0});

    if (ConfigStore.to.isOpenPhone()) {
      Get.toNamed(Routes.loginPhone);
    } else if (ConfigStore.to.isOpenEmail()) {
      Get.toNamed(Routes.loginEmail);
    } else {
      SmartDialog.showToast(LocaleKeys.text_0083.tr,
          alignment: Alignment.center);
    }
  }

  void toSign() {
    InviteCodeConfig.showInviteConde(0);
  }

// bool signByEmail() {
//   // if (state.inviteCodeController.text.isEmpty) {
//   //   SmartDialog.showToast(LocaleKeys.text_0031.tr);
//   //   return false;
//   // }
//   SmartDialog.dismiss();
//   Get.toNamed(Routes.signEmail,
//       arguments: {"inviteCode": state.inviteCodeController.text});
//   return true;
// }
//
// bool signByPhone() {
//   // if (state.inviteCodeController.text.isEmpty) {
//   //   SmartDialog.showToast(LocaleKeys.text_0031.tr);
//   //   return false;
//   // }
//
//   SmartDialog.dismiss();
//   Get.toNamed(Routes.signPhone,
//       arguments: {"inviteCode": state.inviteCodeController.text});
//   return true;
// }
}
