part of 'index.dart';

class ViewUtils {
  static Widget topView(
      {String title = '',
      VoidCallback? onBack,
      Widget? right,
      bool isShowRight = true}) {
    return Row(
      children: [
        SizedBox(
          width: 24.w,
        ),
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTheme()
              .appTextStyle
              .textStyleTitleText
              .copyWith(fontWeight: ThemeFontWeight.medium.weight),
        )),
        if (isShowRight)
          UnconstrainedBox(
            child: InkWell(
              onTap: onBack ?? () => Get.back(),
              child: ThemeImageWidget(
                path: Resource.assetsSvgDefaultCloseSvg,
                width: 24.w,
                height: 24.w,
              ),
            ),
          )
        else
          SizedBox(
            width: 24.w,
          ),
      ],
    ).marginSymmetric(horizontal: 16.w, vertical: 12.h);
  }

  static Widget groupTopView({
    String title = '',
    String msg = "",
    VoidCallback? onBack,
  }) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: SmartDialog.dismiss,
              child: Text(
                LocaleKeys.text_0011.tr,
                style: AppTheme().appTextStyle.textStyleHintText.copyWith(
                      fontSize: 15.sp,
                      fontWeight: ThemeFontWeight.regular.weight,
                    ),
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTheme().appTextStyle.textStyleTitleText.copyWith(
                        fontWeight: ThemeFontWeight.medium.weight,
                        fontSize: 14.sp),
                  ),
                  4.verticalSpace,
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: AppTheme().appTextStyle.textStyleTitleText.copyWith(
                        fontWeight: ThemeFontWeight.medium.weight,
                        fontSize: 12.sp),
                  ),
                ],
              )),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: onBack,
              child: Text(
                LocaleKeys.text_0065.tr,
                style: AppTheme().appTextStyle.textStylePrimary.copyWith(
                      fontSize: 15.sp,
                      fontWeight: ThemeFontWeight.medium.weight,
                    ),
              ),
            ),
          ),
        ],
      ).marginSymmetric(horizontal: 16.w, vertical: 12.h),
    );
  }
}
