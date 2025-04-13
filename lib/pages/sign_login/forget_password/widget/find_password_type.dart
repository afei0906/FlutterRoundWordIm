part of '../index.dart';

class FindPasswordType extends StatelessWidget {
  final int type;

  FindPasswordType(
    this.type, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(builder: (logic) {
      return Container(
        decoration: CustomBoxDecoration.topDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            appBar(),
            RichTextWidget(
              textAlign: TextAlign.center,
              model: RichTextModel(
                text:
                    "${LocaleKeys.text_0058.tr}\n${LocaleKeys.text_0059.trParams({
                      'text_0060': LocaleKeys.text_0060.tr,
                    })}",
                style: AppTheme().appTextStyle.textExtraLightStyleBlack,
                items: [
                  RichTextItemModel(
                    text: LocaleKeys.text_0060.tr,
                    onTap: () {
                      logic.contactService();
                    },
                    style: AppTheme().appTextStyle.textExtraLightStylePrimary,
                  ),
                ],
              ),
            ).marginSymmetric(vertical: 12.h, horizontal: 20.w),
            ...PasswordProtectConfig.forgetPassword(() {
              SmartDialog.dismiss();
              PasswordProtectConfig.selectLoginType(type);
            }),
            ...EmailConfig.forgetPassword(() {
              SmartDialog.dismiss();
              Get.toNamed(Routes.emailRest);
            }),
            // ...PhoneConfig.forgetPassword(() {
            //   SmartDialog.dismiss();
            //   Get.toNamed(Routes.phoneRest);
            // }),
            30.verticalSpace,
          ],
        ),
      );
    });
  }

  Widget appBar() {
    return ViewUtils.topView(
        title: LocaleKeys.text_0019.tr, onBack: SmartDialog.dismiss);
  }
}
