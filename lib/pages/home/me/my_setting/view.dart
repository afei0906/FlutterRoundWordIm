part of '../../index.dart';

class MySettingPage extends StatelessWidget {
  MySettingPage({Key? key}) : super(key: key);

  final MySettingLogic logic = Get.put(MySettingLogic());
  final MySettingState state = Get.find<MySettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        image: AssetImage(Resource.assetsImagesMeBgPng),
      )),
      child: Scaffold(
          appBar: appBar(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ..._itemWidget(),
                50.verticalSpace,
                GestureDetector(
                  onTap: logic.loginOut,
                  child: Container(
                    height: 48.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.r),
                            bottom: Radius.circular(12.r)),
                        color: AppTheme.bgColor),
                    child: Text(
                      LocaleKeys.text_0189.tr,
                      style: AppTheme().appTextStyle.textErrorStyleBlack.copyWith(
                            fontSize: 16.sp,
                          ),
                    ),
                  ).marginSymmetric(horizontal: 16.w),
                ),
              ],
            ).marginOnly(bottom: 12.w),
          )),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(
      Get.context!,
      automaticallyImplyLeading: true,
      appBarColor: Colors.transparent,
      leadingWidth: 80.w,
      title: LocaleKeys.text_0174.tr,
    );
  }

  List<Widget> _itemWidget() {
    List<Widget> list = [];
    state.itemList.forEach((action) {
      list.add(GestureDetector(
        onTap: () {
          action.callBack?.call();
        },
        child: Column(
          children: [
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: action.isTopRoudis
                        ? Radius.circular(12.r)
                        : Radius.zero,
                    bottom: action.isBotRoudis
                        ? Radius.circular(12.r)
                        : Radius.zero,
                  ),
                  color: AppTheme.bgColor),
              child: Row(
                children: [
                  Text(
                    (action.title ?? '').tr,
                    style: AppTheme()
                        .appTextStyle
                        .textExtraLightStyleBlack
                        .copyWith(
                          fontSize: 16.sp,
                          fontWeight: ThemeFontWeight.regular.weight,
                        ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_outlined,
                    size: 24.w,
                    color: AppTheme.secondaryText,
                  )
                ],
              ),
            ).marginOnly(
              left: 16.w,
              right: 16.w,
              top: action.isTopRoudis ? 12.h : 0,
            ),
            if (!action.isBotRoudis)
              const Divider(
                color: AppTheme.lineColor,
                height: 1,
              ).marginOnly(
                left: 25.w,
                right: 25.w,
              )
          ],
        ),
      ));
    });
    return list;
  }
}
