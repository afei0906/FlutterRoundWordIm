part of 'index.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashLogic>(
        init: SplashLogic(),
        builder: (controller) => SizedBox.expand(
          child: _splashWidget(controller),
        ),
      ),
    );
  }

  Widget _splashWidget(SplashLogic controller) {
    return Column(
      children: [
        210.verticalSpace,
        ThemeImageWidget(
          path: Resource.assetsSvgDefaultLogoSvg,
          width: 160.w,
          height: 160.w,
        ),
        Text(
          LocaleKeys.text_0001.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
          textAlign: TextAlign.center,
        ),
        10.verticalSpace,
        Text(
          LocaleKeys.text_0002.tr,
          style: AppTheme().appTextStyle.textStyleTernary,
          textAlign: TextAlign.center,
        ).marginSymmetric(horizontal: 70.w),
        const Spacer(),
        if (!UserStore.to.isLogin)
          Row(
            children: [
              16.horizontalSpace,
              Expanded(
                child: AppButton.brandPrimaryButton(
                    LocaleKeys.text_0013.tr, controller.toLogin),
              ),
              16.horizontalSpace,
              Expanded(
                child: AppButton.fillPrimaryButton(
                    LocaleKeys.text_0014.tr, controller.toSign),
              ),
              16.horizontalSpace,
            ],
          ),
        30.verticalSpace,
      ],
    );
  }
}
