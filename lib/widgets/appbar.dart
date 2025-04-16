part of 'index.dart';

class CusAppBar {
  static PreferredSizeWidget floatLeading(BuildContext context, {
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
    Widget? bottom,
    bool automaticallyImplyLeading = true,
    bool absorbing = false,
    bool isCustom = true,
    double? bottomBarHeight,
    SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle.dark,
  }) {
    return ThemeNavigationBar(
        appBarColor: appBarColor,
        toolbarHeight: toolbarHeight,
        elevation: 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leadingWidth: leadingWidth,
        leftWidget: automaticallyImplyLeading
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
            : leftWidget,
        titleStr: title,
        titleTextStyle:
        titleTextStyle ?? AppTheme().appTextStyle.textStyleTitleText,
        actions: actions,
        statusBarStyle: statusBarStyle,
        absorbing: absorbing,
        isCustom: isCustom,
        bottom: bottom,
        bottomBarHeight: bottomBarHeight);
  }

  static PreferredSizeWidget leading(BuildContext context, {
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
    bool absorbing = false,
    bool isCustom = true,
    SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle.dark,
  }) {
    return ThemeNavigationBar(
      appBarColor: appBarColor,
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
      leadingWidth: leadingWidth,
      titleWidget: titleWidget ?? Text(title),
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
      statusBarStyle: statusBarStyle,
      absorbing: absorbing,
      isCustom: isCustom,
    );
  }

  static PreferredSizeWidget black(BuildContext context, {
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
    bool absorbing = false,
    bool isCustom = true,
    SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle.dark,
  }) {
    return ThemeNavigationBar(
      appBarColor: appBarColor ?? AppTheme.bgColor,
      toolbarHeight: toolbarHeight,
      elevation: 0,
      leftWidget: automaticallyImplyLeading
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
      titleWidget: titleWidget ?? Text(title),
      titleTextStyle: TextStyle(
        color: AppTheme.bgColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      statusBarStyle: statusBarStyle,
      absorbing: absorbing,
      isCustom: isCustom,
    );
  }
}

class CustomBoxDecoration {
  static BoxDecoration topDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        color: AppTheme.bgColor);
  }

  static BoxDecoration customDecoration({double? radius, Color? color }) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12.r),
        color: color ?? AppTheme.bgColor);
  }
}
