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
        if (isShowRight) UnconstrainedBox(
                child: InkWell(
                  onTap: onBack ?? () => Get.back(),
                  child: ThemeImageWidget(
                    path: Resource.assetsSvgDefaultCloseSvg,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ) else SizedBox(
                width: 24.w,
              ),
      ],
    ).marginSymmetric(horizontal: 16.w, vertical: 12.h);
  }
}
