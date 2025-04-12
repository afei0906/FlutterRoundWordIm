part of '../index.dart';

class PassWordProtectPage extends StatelessWidget {
  PassWordProtectPage({Key? key}) : super(key: key);

  final PassWordProtectLogic logic = Get.put(PassWordProtectLogic());
  final PassWordProtectState state = Get.find<PassWordProtectLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassWordProtectLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Text(
                      LocaleKeys.text_0048.tr,
                      textAlign: TextAlign.center,
                      style: AppTheme().appTextStyle.textStyleTernary,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Text(
                      "1.你的小学学校是?",
                      textAlign: TextAlign.left,
                      style: AppTheme()
                          .appTextStyle
                          .textStyleTitleText
                          .copyWith(fontSize: 15.sp),
                    )),
                InputAccount(
                  controller: state.ans1Controller,
                  hintText: LocaleKeys.text_0050.tr,
                  autofocus: true,
                  onChanged: logic.onChanged,
                ).marginSymmetric(
                  horizontal: 24.w,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Text(
                      "2.你的小学学校是?",
                      textAlign: TextAlign.left,
                      style: AppTheme()
                          .appTextStyle
                          .textStyleTitleText
                          .copyWith(fontSize: 15.sp),
                    )),
                InputAccount(
                  controller: state.ans2Controller,
                  hintText: LocaleKeys.text_0050.tr,
                  onChanged: logic.onChanged,
                ).marginSymmetric(
                  horizontal: 24.w,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Text(
                      "3.你的小学学校是?",
                      textAlign: TextAlign.left,
                      style: AppTheme()
                          .appTextStyle
                          .textStyleTitleText
                          .copyWith(fontSize: 15.sp),
                    )),
                InputAccount(
                  controller: state.ans3Controller,
                  hintText: LocaleKeys.text_0050.tr,
                  onChanged: logic.onChanged,
                  onSubmitted: logic.submit,
                ).marginSymmetric(
                  horizontal: 24.w,
                ),
                const Spacer(),
                Obx(() {
                  return AppButton.fillPrimaryButton(
                      LocaleKeys.text_0053.tr, logic.submit,
                      isPress: state.isSubmit.value);
                }).marginSymmetric(horizontal: 24.w),
                25.verticalSpace,
              ],
            ));
      },
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!, title: LocaleKeys.text_0047.tr);
  }
}
