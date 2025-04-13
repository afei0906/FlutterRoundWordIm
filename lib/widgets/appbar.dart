part of 'index.dart';

class CusAppBar {
  static AppBar floatLeading(
    BuildContext context, {
    Widget? leftWidget,
    Color? chevronLeftColor,
    String title = '',
    VoidCallback? onBack,
    List<Widget>? actions,
    Color? appBarColor,
    double? leadingWidth,
    Widget? titleWidget,
    TextStyle? titleTextStyle,
    double toolbarHeight = kToolbarHeight,
    double? elevation,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true,
  }) {
    return AppBar(
      backgroundColor: appBarColor,
      toolbarHeight: toolbarHeight,
      elevation: 0,
      leading: automaticallyImplyLeading
          ? UnconstrainedBox(
              child: InkWell(
                onTap: onBack ?? () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.w,
                  color: AppTheme.ternaryText,
                ),
              ),
            )
          : null,
      leadingWidth: leadingWidth ?? 49.w,
      title: titleWidget ?? Text(title),
      titleTextStyle:
          titleTextStyle ?? AppTheme().appTextStyle.textStyleTitleText,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  static AppBar leading(
    BuildContext context, {
    Widget? leftWidget,
    Color? chevronLeftColor,
    String title = '',
    VoidCallback? onBack,
    List<Widget>? actions,
    Color? appBarColor,
    double? leadingWidth,
    Widget? titleWidget,
    TextStyle? titleTextStyle,
    double toolbarHeight = kToolbarHeight,
    double? elevation,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = false,
  }) {
    return AppBar(
      backgroundColor: appBarColor,
      toolbarHeight: toolbarHeight,
      elevation: 0,
      // leading: automaticallyImplyLeading
      //     ? UnconstrainedBox(
      //         child: InkWell(
      //           onTap: onBack ?? () => Get.back(),
      //           child: Icon(
      //             Icons.arrow_back_ios_new,
      //             size: 20.w,
      //           ),
      //         ),
      //       )
      //     : null,
      leadingWidth: leadingWidth ?? 49.w,
      title: titleWidget ?? Text(title),
      titleTextStyle: titleTextStyle ??
          AppTheme()
              .appTextStyle
              .textStyleTitleText
              .copyWith(fontWeight: ThemeFontWeight.medium.weight),
      actions: [
        UnconstrainedBox(
          child: InkWell(
            onTap: onBack ?? () => Get.back(),
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultCloseSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ),
        8.horizontalSpace
      ],
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  static AppBar black(
    BuildContext context, {
    Widget? leftWidget,
    String title = '',
    VoidCallback? onBack,
    List<Widget>? actions,
    Color? appBarColor,
    Widget? titleWidget,
    double toolbarHeight = kToolbarHeight,
    double? elevation,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true,
  }) {
    return AppBar(
      backgroundColor: appBarColor ?? AppTheme.bgColor,
      toolbarHeight: toolbarHeight,
      elevation: 0,
      leading: automaticallyImplyLeading
          ? UnconstrainedBox(
              child: InkWell(
                onTap: onBack ?? () => Get.back(),
                child: leftWidget ??
                    Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r),
                        // border: Border.all(color: AppTheme.outline, width: 1.w),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.w,
                      ),
                    ),
              ),
            )
          : null,
      leadingWidth: 80.w,
      title: titleWidget ?? Text(title),
      titleTextStyle: TextStyle(
        color: AppTheme.bgColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}

class CustomBoxDecoration {
  static BoxDecoration topDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        color: AppTheme.bgColor);
  }
}
