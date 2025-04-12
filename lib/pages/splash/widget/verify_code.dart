part of '../index.dart';

class VerifyCodeWidget extends StatelessWidget {
  final Function? callBack;

  VerifyCodeWidget({super.key, this.callBack}) {
    try {
      Get.find<SplashLogic>().state.inviteCodeController.text = "";
    } catch (e) {
      e.printError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(builder: (logic) {
      return Container(
        decoration: CustomBoxDecoration.topDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appBar(),
            InputAccount(
              controller: logic.state.inviteCodeController,
              hintText: LocaleKeys.text_0031.tr,
              textAlign: TextAlign.center,
              autofocus: true,
            ).marginSymmetric(horizontal: 24.w, vertical: 12.h),
            Row(
              children: [
                ...EmailConfig.signInviteCode((int type, String text) {
                  callBack?.call(type, text);
                }, 1, logic.state.inviteCodeController),
                ...PhoneConfig.signInviteCode((int type, String text) {
                  callBack?.call(type, text);
                }, 0, logic.state.inviteCodeController),
                16.horizontalSpace,
              ],
            ),
            30.verticalSpace,
            MediaQuery.of(context).viewInsets.bottom.verticalSpace,
          ],
        ),
      );
    });
  }

  Widget appBar() {
    return ViewUtils.topView(
        title: LocaleKeys.text_0030.tr, onBack: SmartDialog.dismiss);
  }
}
