part of 'index.dart';

class PasswordProtectConfig {
  static List<Widget> showSetPassProtectView(Function callBack) {
    List<Widget> list = [];
    if (ConfigStore.to.isOpenUserIssues()) {
      list.add(Text(
        LocaleKeys.text_0045.tr,
        style: AppTheme().appTextStyle.textStyleTitleText,
      ));
      list.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Text(
          LocaleKeys.text_0046.tr,
          textAlign: TextAlign.center,
          style: AppTheme().appTextStyle.textStyleTernary,
        ),
      ));
      list.add(const Spacer());
      list.add(AppButton.fillPrimaryButton(
        LocaleKeys.text_0044.tr,
        () {
          callBack.call(0);
        },
      ).marginSymmetric(horizontal: 16.w));
      list.add(20.verticalSpace);
    } else {
      list.add(Text(
        LocaleKeys.text_0045.tr,
        style: AppTheme().appTextStyle.textStyleTitleText,
      ));
      list.add(const Spacer());
      list.add(AppButton.fillPrimaryButton(
        LocaleKeys.text_0056.tr,
        () {
          callBack.call(1);
        },
      ).marginSymmetric(horizontal: 16.w, vertical: 12.h));
      list.add(AppButton.fillPrimaryButton(LocaleKeys.text_0057.tr, () {
        callBack.call(2);
      }, isPress: false)
          .marginSymmetric(horizontal: 16.w));
      list.add(20.verticalSpace);
    }
    return list;
  }

  static void showForgetPas(int formType) {
    FocusScope.of(Get.context!).unfocus();
    SmartDialog.show(
      builder: (_) {
        return FindPasswordType(formType);
      },
      alignment: Alignment.bottomCenter,
    );
  }

  static List<Widget> forgetPassword(Function() callBack) {
    List<Widget> list = [];
    if (ConfigStore.to.isOpenUserIssues()) {
      list = [
        12.verticalSpace,
        AppButton.fillPrimaryButton(LocaleKeys.text_0061.tr, () {
          callBack.call();
        }).marginSymmetric(horizontal: 16.w)
      ];
    }
    return list;
  }

  static void selectLoginType(int formType) {
    if (ConfigStore.to.isOpenPhone() && ConfigStore.to.isOpenEmail()) {
      SmartDialog.show(
        builder: (_) {
          return SelectLoginType(
            type: formType,
          );
        },
        alignment: Alignment.bottomCenter,
      );
    }
  }
}
