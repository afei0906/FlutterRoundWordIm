part of '../../index.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({Key? key}) : super(key: key);

  final ChatListLogic logic = ChatListLogic.to;
  final ChatListState chatListState = Get.find<ChatListLogic>().chatListState;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListLogic>(
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppTheme.colorTextDarkPrimary,
            appBar: appBar(),
            body: Obx(() {
              return ListView(
                children: List.generate(
                    chatListState
                        .getCurrentList(logic.selectIndex.value)
                        .length, (index) {
                  final ConversationList conversationList = chatListState
                      .getCurrentList(logic.selectIndex.value)[index];
                  return ChatSlidableWidget(index, conversationList, logic);
                }),
              );
            }));
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
            onTap: logic.toAddNewChat,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultAddSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
        ],
        appBarColor: AppTheme.bgColor2, bottom: Obx(() {
      return Column(
        children: [
          CustomUtils.onSearchView(
                  logic.searchController, LocaleKeys.text_0127.tr,
                  onChanged: logic.onChanged, onSubmitted: logic.onSubmitted)
              .marginSymmetric(horizontal: 16.w),
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
              GestureDetector(
                  onTap: () {
                    logic.changeIndex(0);
                  },
                  child: _mune(
                      LocaleKeys.text_0098.tr, logic.selectIndex.value == 0)),
              GestureDetector(
                  onTap: () {
                    logic.changeIndex(1);
                  },
                  child: _mune(
                      LocaleKeys.text_0099.tr, logic.selectIndex.value == 1)),
              GestureDetector(
                  onTap: () {
                    logic.changeIndex(2);
                  },
                  child: _mune(
                      LocaleKeys.text_0100.tr, logic.selectIndex.value == 2))
            ],
          ).marginSymmetric(horizontal: 16.w, vertical: 5.h),
        ],
      );
    }), bottomBarHeight: 120.h);
  }

  Widget _mune(String str, bool isSelect) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: isSelect
              ? AppTheme.colorTextDarkPrimary
              : AppTheme.black.withOpacity(0.05),
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
                .copyWith(fontSize: 14.sp, color: AppTheme.colorBorderDark),
      ),
    ).marginOnly(right: 12.w);
  }
}
