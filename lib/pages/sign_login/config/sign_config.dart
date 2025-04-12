part of 'index.dart';

class SignConfig {
  static List<Widget> signUser(Function callBack) {
    List<Widget> list = [];
    if (ConfigStore.to.isOpenRegister()) {
      list = [
        Expanded(
            child: AppButton.fillPrimaryButton(
          LocaleKeys.text_0014.tr,
          () {
            callBack.call();
          },
        )),
        16.horizontalSpace,
      ];
    }
    return list;
  }

  static Widget loginCreateUser(Function callBack) {
    if (ConfigStore.to.isOpenRegister()) {
      return RichTextWidget(
        model: RichTextModel(
          text: LocaleKeys.text_0021.trParams({
            'text_0022': LocaleKeys.text_0022.tr,
          }),
          style: AppTheme().appTextStyle.textExtraLightStyleBlack,
          items: [
            RichTextItemModel(
              text: LocaleKeys.text_0022.tr,
              onTap: () {
                callBack.call();
              },
              style: AppTheme().appTextStyle.textExtraLightStylePrimary,
            ),
          ],
        ),
      );
    }
    return 1.verticalSpace;
  }
}
