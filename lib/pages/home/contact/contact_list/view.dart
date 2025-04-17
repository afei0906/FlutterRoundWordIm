part of '../../index.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key? key}) : super(key: key);

  final ContactListLogic logic = ContactListLogic.to;
  final ContactListState state = Get.find<ContactListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.bgColor2,
        appBar: appBar(),
        body: Obx(() {
          return AzListView(
            data: state.dataList,
            itemCount: state.dataList.length,
            itemScrollController: state.scroll,
            itemBuilder: (BuildContext itemContext, int index) {
              return _itemWidget(context, index);
            },
            indexBarWidth: 16.w,
            indexBarOptions: IndexBarOptions(
                textStyle: AppTheme()
                    .appTextStyle
                    .textExtraLightStylePrimary
                    .copyWith(fontWeight: ThemeFontWeight.semiBold.weight)),
            padding: EdgeInsets.zero,
            indexBarData: SuspensionUtil.getTagIndexList(state.dataList),
            susItemBuilder: (BuildContext context, int index) {
              return susItem(state.dataList[index].getSuspensionTag())
                  .marginOnly(top: 10, left: 10);
            },
            isShowSus: false,
          );
        }));
  }

  Widget _itemWidget(BuildContext itemContext, int index) {
    bool isTopRoudis = false;
    bool isBotRoudis = false;
    final UserInfo userInfo = state.dataList[index];
    if (index == 0) {
      isTopRoudis = true;
    } else if (userInfo.getSuspensionTag() !=
        state.dataList[index - 1].getSuspensionTag()) {
      isTopRoudis = true;
    }
    if (index == state.dataList.length - 1) {
      isBotRoudis = true;
    } else if (userInfo.getSuspensionTag() !=
        state.dataList[index + 1].getSuspensionTag()) {
      isBotRoudis = true;
    }

    return GestureDetector(
      onTap: () {
        logic.toFriendsInfo(state.dataList[index]);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: isTopRoudis ? Radius.circular(12.r) : Radius.zero,
                  bottom: isBotRoudis ? Radius.circular(12.r) : Radius.zero,
                ),
                color: AppTheme.bgColor),
            child: Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42.r),
                      color: AppTheme.sliderColor.withOpacity(0.3)),
                  child: ThemeImageWidget(
                    url: userInfo.avatar.toString() ?? '',
                    error: Resource.assetsImagesUserAvatarDefualtPng,
                    width: 40.w,
                    height: 40.w,
                    radius: 40.r,
                  ),
                ),
                12.horizontalSpace,
                Text(
                  Utils.toEmpty(userInfo.nick) ?? '',
                  style:
                      AppTheme().appTextStyle.textExtraLightStyleBlack.copyWith(
                            fontSize: 14.sp,
                            fontWeight: ThemeFontWeight.medium.weight,
                          ),
                ),
              ],
            ),
          ).marginOnly(
            left: 16.w,
            right: 16.w,
            top: isTopRoudis ? 12.h : 0,
          ),
          if (!isBotRoudis)
            Container(
              color: AppTheme.bgColor.withOpacity(0),
              width: double.infinity,
              child: Container(
                color: AppTheme.lineColor,
                height: 1,
                width: double.infinity,
              ).marginOnly(
                left: 48.w,
                right: 16.w,
              ),
            ),
        ],
      ),
    ).marginOnly(bottom: index == state.dataList.length - 1 ? 20.h : 0);
  }

  Widget susItem(String tag) {
    return Container(
      width: Get.width - 32.w,
      height: 24.h,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      // decoration: const BoxDecoration(
      //   color: AppTheme.cFFFFFFFF,
      //   border: Border(bottom: BorderSide(color: AppTheme.cFFF2EFEF)),
      // ),
      child: Text(
        tag,
        textAlign: TextAlign.left,
        style: AppTheme().appTextStyle.textStyleTernary.copyWith(
              fontSize: 12.sp,
              fontWeight: ThemeFontWeight.medium.weight,
            ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return CusAppBar.floatLeading(Get.context!,
        automaticallyImplyLeading: false,
        leadingWidth: 80.w,
        leftWidget: Text(
          LocaleKeys.text_0006.tr,
          style: AppTheme().appTextStyle.textStyleSecondary,
        ).marginOnly(left: 16.w),
        actions: [
          InkWell(
            onTap: logic.toAdd,
            child: ThemeImageWidget(
              path: Resource.assetsSvgDefaultContactUserAddSvg,
              width: 24.w,
              height: 24.w,
            ),
          ),
          16.horizontalSpace,
        ],
        appBarColor: AppTheme.bgColor2,
        bottom: Column(
          children: [
            CustomUtils.onSearchView(
                    state.searchController, LocaleKeys.text_0133.tr,
                    onChanged: logic.onChanged, onSubmitted: logic.onSubmitted)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            _topMune(
                    LocaleKeys.text_0131.tr,
                    Resource.assetsSvgDefaultChatUserAddSvg,
                    (logic.applyList.isNotEmpty
                        ? logic.applyList.length.toString()
                        : null),
                    logic.toNewFriends)
                .marginSymmetric(horizontal: 16.w),
            12.verticalSpace,
            _topMune(
                    LocaleKeys.text_0132.tr,
                    Resource.assetsSvgDefaultChatGroupAddSvg,
                    null,
                    logic.toMyGroup)
                .marginSymmetric(horizontal: 16.w),
          ],
        ),
        bottomBarHeight: 185.h);
  }

  Widget _topMune(String name, String png, String? count, Function? callBack) {
    return GestureDetector(
      onTap: () {
        callBack?.call();
      },
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: CustomBoxDecoration.customDecoration(),
        child: Row(
          children: [
            ThemeImageWidget(
              path: png,
              width: 24.w,
              height: 24.w,
              color: AppTheme.primary,
            ),
            12.horizontalSpace,
            Text(
              name,
              style: AppTheme().appTextStyle.textExtraLightStyleBlack,
            ),
            const Spacer(),
            if (!Utils.isEmpty(count))
              Container(
                width: 20.w,
                height: 20.w,
                alignment: Alignment.center,
                decoration: CustomBoxDecoration.customDecoration(
                  color: AppTheme.error,
                  radius: 30.r,
                ),
                child: Text(
                  count ?? '',
                  style: AppTheme()
                      .appTextStyle
                      .textStyleBgColor
                      .copyWith(fontSize: 13.sp),
                ),
              )
          ],
        ),
      ),
    );
  }
}
