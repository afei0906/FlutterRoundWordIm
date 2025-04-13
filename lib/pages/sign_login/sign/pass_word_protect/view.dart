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
                Obx(() {
                  return Expanded(
                      child: state.dictItemList.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.count.value,
                              itemBuilder: (context, index) {
                                return itemWidget(index);
                              },
                              padding: EdgeInsets.zero,
                            )
                          : SizedBox());
                }),
                25.verticalSpace,
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

  Widget itemWidget(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Text(
              LocaleKeys.text_0049
                  .trParams({"number": Utils.numberToChinese(index + 1)}),
              textAlign: TextAlign.left,
              style: AppTheme()
                  .appTextStyle
                  .textStyleTitleText
                  .copyWith(fontSize: 15.sp),
            )),
        InkWell(
          onTap: () {
            logic.selectQuest(index);
          },
          child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                  color: AppTheme.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r)),
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Row(
                children: [
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      "${state.dictItemMap[index]?.dictLabel ?? LocaleKeys.text_0051.tr}",
                      // state.dictItemList[index].dictLabel.toString(),
                      textAlign: TextAlign.left,
                      style: AppTheme()
                          .appTextStyle
                          .textStyleTitleText
                          .copyWith(fontSize: 15.sp),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_outlined,
                    size: 24.w,
                    color: AppTheme.secondaryText,
                  ),
                  12.horizontalSpace,
                ],
              )),
        ),
        InputAccount(
          controller: state.controllerMap[index] ?? TextEditingController(),
          hintText: LocaleKeys.text_0050.tr,
          onChanged: logic.onChanged,
        ).marginSymmetric(
          horizontal: 24.w,
        ),
        16.verticalSpace
      ],
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!, title: LocaleKeys.text_0047.tr);
  }
}
