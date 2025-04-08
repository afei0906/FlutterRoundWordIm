part of '../index.dart';

class InviteCodeWidget extends StatelessWidget {
  const InviteCodeWidget({super.key});

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
                16.horizontalSpace,
                Expanded(
                  child: AppButton.brandPrimaryButton(
                      LocaleKeys.text_0033.tr, logic.signByEmail),
                ),
                16.horizontalSpace,
                Expanded(
                  child: AppButton.fillPrimaryButton(
                      LocaleKeys.text_0032.tr, logic.signByPhone),
                ),
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
