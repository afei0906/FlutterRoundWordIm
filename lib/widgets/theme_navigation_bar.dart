part of 'index.dart';

typedef OnNavigationTitleBuilder = Widget Function()?;

class ThemeNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  Widget? leftWidget;
  Color? chevronLeftColor;
  String titleStr;
  VoidCallback? onBack;
  List<Widget>? actions;
  Color? appBarColor;
  double? leadingWidth;
  Widget? titleWidget;
  TextStyle? titleTextStyle;
  double toolbarHeight = kToolbarHeight;
  double? elevation;
  Widget? bottom;
  bool automaticallyImplyLeading = false;
  SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle.dark;
  bool absorbing = false; // 自定义导航栏中是否透传事件到下一层
  bool isCustom;
  double? bottomBarHeight;

  ThemeNavigationBar(
      {super.key,
      this.statusBarStyle = SystemUiOverlayStyle.dark,
      this.absorbing = false,
      this.isCustom = true,
      this.leftWidget,
      this.chevronLeftColor,
      this.titleStr = '',
      this.onBack,
      this.actions,
      this.appBarColor,
      this.leadingWidth,
      this.titleWidget,
      this.titleTextStyle,
      this.toolbarHeight = kToolbarHeight,
      this.elevation,
      this.bottom,
      this.automaticallyImplyLeading = false,
      this.bottomBarHeight});

  @override
  Widget build(BuildContext context) {
    if (isCustom) {
      double statusBarHeight =
          View.of(context).padding.top / View.of(context).devicePixelRatio;
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBarStyle,
        child: AbsorbPointer(
          absorbing: absorbing,
          child: Material(
              color: appBarColor ?? AppTheme.colorTextDarkPrimary.withAlpha(0),
              child: Container(
                constraints: BoxConstraints.expand(
                  height: toolbarHeight +
                      (bottomBarHeight ?? 0.0) +
                      statusBarHeight,
                ),
                child: _buildNavWidget(context),
              )),
        ),
      );
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyle,
      child: Material(
        color: appBarColor ?? AppTheme.colorTextDarkPrimary,
        child: _buildNavWidget(context),
      ),
    );
  }

  Widget _buildNavWidget(BuildContext context) {
    return SafeArea(
      bottom: !isCustom,
      child: Column(
        children: [
          AppBar(
            backgroundColor: appBarColor ?? AppTheme.colorTextDarkPrimary,
            toolbarHeight: toolbarHeight,
            elevation: 0,
            leading: automaticallyImplyLeading
                ? UnconstrainedBox(
                    child: InkWell(
                      onTap: onBack ?? () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.w,
                        color: AppTheme.colorTextTertiary,
                      ),
                    ),
                  )
                : Container(alignment: Alignment.centerLeft, child: leftWidget),
            leadingWidth: leadingWidth,
            title: titleWidget ?? Text(titleStr),
            titleTextStyle: titleTextStyle ??
                AppTheme()
                    .appTextStyle
                    .textStyleTitleText
                    .copyWith(fontWeight: ThemeFontWeight.medium.weight),
            actions: actions,
            automaticallyImplyLeading: automaticallyImplyLeading,
          ),
          Offstage(
            offstage: bottom == null,
            child: SizedBox(
              height: bottomBarHeight,
              child: bottom,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottomBarHeight ?? 0.0));
}
