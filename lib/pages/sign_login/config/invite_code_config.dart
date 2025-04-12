part of 'index.dart';

class InviteCodeConfig {
  ///type 0splash页 1 登录phone 2 登录email
  static void showInviteConde(int type) {
    if (!ConfigStore.to.isOpenEmail() && !ConfigStore.to.isOpenPhone()) {
      SmartDialog.showToast(LocaleKeys.text_0084.tr,
          alignment: Alignment.center);
      return;
    }
    if (ConfigStore.to.isOpenInviteCode()) {
      SmartDialog.show(
        clickMaskDismiss: false,
        tag: "inviteCode",
        builder: (_) {
          return InviteCodeWidget(
            callBack: (int status, String inviteCode) async {
              if (Utils.isEmpty(inviteCode)) {
                SmartDialog.showToast(LocaleKeys.text_0031.tr);
                return;
              }
              bool isOk =
                  await LoginSignApi.registerCheck(inviteCode: inviteCode);
              // log(">>>>>$isOk");
              if (!isOk) {
                return;
              }
              SmartDialog.dismiss(tag: "inviteCode");
              if (type == 1 || type == 2) {
                Get.back();
              }
              if (status == 0) {
                Get.toNamed(Routes.signPhone,
                    arguments: {"inviteCode": inviteCode});
              } else {
                Get.toNamed(Routes.signEmail,
                    arguments: {"inviteCode": inviteCode});
              }
            },
          );
        },
        alignment: Alignment.bottomCenter,
      );
    } else {
      if (type == 1) {
        Get.toNamed(Routes.signPhone);
      } else if (type == 2) {
        Get.toNamed(Routes.signEmail);
      } else if (ConfigStore.to.isOpenPhone()) {
        Get.toNamed(Routes.signPhone);
      } else if (ConfigStore.to.isOpenEmail()) {
        Get.toNamed(Routes.signEmail);
      } else {
        SmartDialog.showToast(LocaleKeys.text_0084.tr,
            alignment: Alignment.center);
      }
    }
  }
}
