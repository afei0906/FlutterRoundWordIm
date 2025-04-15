part of '../../index.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({Key? key}) : super(key: key);

  final ChatListLogic logic = Get.put(ChatListLogic());
  final ChatListState state = Get.find<ChatListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.bgColor,
            appBar: appBar(),
            body: ListView(
              children: [],
            ));
      },
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        automaticallyImplyLeading: false,
        leadingWidth: 80.w,
        leftWidget: Text(
          LocaleKeys.text_0095.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
        ).marginOnly(left: 16.w),
        actions: [
          InkWell(
            onTap: logic.toScan,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultScanSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
          InkWell(
            onTap: logic.toAdd,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultAddSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
        ],
        appBarColor: AppTheme.bgColor2,
        bottom: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppTheme.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r)),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: AppTheme.fourthText,
                      size: 24.w,
                    ).marginOnly(left: 12.h),
                    Expanded(
                      child: InputAccount(
                        decoration: const BoxDecoration(),
                        controller: state.searchController,
                        hintText: LocaleKeys.text_0127.tr,
                        autofocus: false,
                        onChanged: logic.onChanged,
                        onSubmitted: logic.onSubmitted,
                      ),
                    ),
                  ],
                ),
              ),
            ).marginSymmetric(horizontal: 16.w),
            Row(
              children: [
                ThemeImageWidget(
                  path: Resource.assetsSvgDefaultNoticeSvg,
                  width: 20.h,
                  height: 20.h,
                ),
                5.horizontalSpace,
                Expanded(
                    child: TextScroll(
                  '这是一条公告官方通知重要消息，恭喜你中大奖中大奖恭喜你中大奖中大奖,这是一条公告官方通知重要消息，恭喜你中大奖中大奖恭喜你中大奖中大奖 ',
                  intervalSpaces: 10,
                  velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                  style: AppTheme().appTextStyle.textStyleSecondaryNor,
                ))
              ],
            ).marginSymmetric(horizontal: 16.w, vertical: 5.h),
            Row(
              children: [
                _mune(LocaleKeys.text_0098.tr, true),
                _mune(LocaleKeys.text_0099.tr, false),
                _mune(LocaleKeys.text_0100.tr, false)
              ],
            ).marginSymmetric(horizontal: 16.w, vertical: 5.h),
          ],
        ),
        bottomBarHeight: 120.h);
  }

  Widget _mune(String str, bool isSelect) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: isSelect ? AppTheme.bgColor : AppTheme.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25.r)),
      child: Text(
        str,
        style: isSelect
            ? AppTheme().appTextStyle.textExtraLightStylePrimary.copyWith(
                  fontSize: 14.sp,
                )
            : AppTheme()
                .appTextStyle
                .textExtraLightStylePrimary
                .copyWith(fontSize: 14.sp, color: AppTheme.fourthText),
      ),
    ).marginOnly(right: 12.w);
  }
}
