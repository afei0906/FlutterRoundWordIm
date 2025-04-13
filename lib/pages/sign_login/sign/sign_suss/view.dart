part of '../index.dart';

class SignSussPage extends StatelessWidget {
  SignSussPage({Key? key}) : super(key: key);

  final SignSussLogic logic = Get.put(SignSussLogic());
  final SignSussState state = Get.find<SignSussLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignSussLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: Column(
              children: [
                Center(
                  child: ThemeImageWidget(
                    path: Resource.assetsSvgDefaultSignSussSvg,
                    width: 120.w,
                    height: 120.w,
                  ).marginSymmetric(vertical: 12.h),
                ),
                if (state.type == 0)
                  ...PasswordProtectConfig.showSetPassProtectView((int type) {
                    if (type == 0) {
                      logic.setPasswordProtect();
                    } else if (type == 1) {
                      logic.toLogin();
                    } else if (type == 2) {
                      logic.toHome();
                    }
                  }),
                if (state.type == 1) ...setProtectPassSuss(),
                if (state.type == 2) ...resetPassSuss()
              ],
            ));
      },
    );
  }

  List<Widget> setProtectPassSuss() {
    List<Widget> list = [];
    list.add(Text(
      LocaleKeys.text_0054.tr,
      style: AppTheme().appTextStyle.textStyleTitleText,
    ));
    list.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Text(
        LocaleKeys.text_0055.tr,
        textAlign: TextAlign.center,
        style: AppTheme().appTextStyle.textStyleTernary,
      ),
    ));
    list.add(const Spacer());
    list.add(AppButton.fillPrimaryButton(
      LocaleKeys.text_0056.tr,
      logic.toLogin,
    ).marginSymmetric(horizontal: 16.w, vertical: 12.h));
    list.add(AppButton.fillPrimaryButton(LocaleKeys.text_0057.tr, logic.toHome,
            isPress: false)
        .marginSymmetric(horizontal: 16.w));
    list.add(20.verticalSpace);
    return list;
  }

  List<Widget> resetPassSuss() {
    List<Widget> list = [];
    list.add(Text(
      LocaleKeys.text_0124.tr,
      style: AppTheme().appTextStyle.textStyleTitleText,
    ));
    list.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Text(
        LocaleKeys.text_0122.tr,
        textAlign: TextAlign.center,
        style: AppTheme().appTextStyle.textStyleTernary,
      ),
    ));
    list.add(Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            state.passWord.toString(),
            textAlign: TextAlign.center,
            style: AppTheme()
                .appTextStyle
                .textStyleTitleText
                .copyWith(fontSize: 30.sp),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: logic.copyPas,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultCopySvg,
              width: 24.w,
              height: 24.w,
            ),
          )
        ],
      ),
    ));
    list.add(Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: Text(
        LocaleKeys.text_0121.tr,
        style: AppTheme().appTextStyle.textStyleTernary,
      ),
    ));
    list.add(const Spacer());
    list.add(AppButton.fillPrimaryButton(
      LocaleKeys.text_0056.tr,
      logic.toLogin,
    ).marginSymmetric(horizontal: 16.w, vertical: 12.h));
    list.add(AppButton.fillPrimaryButton(LocaleKeys.text_0057.tr, logic.toHome,
            isPress: false)
        .marginSymmetric(horizontal: 16.w));
    list.add(20.verticalSpace);
    return list;
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      Get.context!,
    );
  }
}
