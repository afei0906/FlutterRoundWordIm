part of '../index.dart';

class SelectLoginType extends StatelessWidget {
  final int? type;

  SelectLoginType({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomBoxDecoration.topDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          appBar(),
          30.verticalSpace,
          AppButton.fillPrimaryButton(LocaleKeys.text_0117.tr, () {
            SmartDialog.dismiss();
            Get.toNamed(Routes.userIssues, arguments: {"formType": 1});
          }).marginSymmetric(horizontal: 16.w),
          12.verticalSpace,
          AppButton.brandPrimaryButton(
            LocaleKeys.text_0118.tr,
            () {
              SmartDialog.dismiss();
              Get.toNamed(Routes.userIssues, arguments: {"formType": 2});
            },
          ).marginSymmetric(horizontal: 16.w),
          30.verticalSpace,
        ],
      ),
    );
  }

  Widget appBar() {
    return ViewUtils.topView(
        title: LocaleKeys.text_0116.tr, onBack: SmartDialog.dismiss);
  }
}
