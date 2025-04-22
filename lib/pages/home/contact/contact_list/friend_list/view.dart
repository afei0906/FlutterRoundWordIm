part of '../../../index.dart';

class FriendListPage extends StatelessWidget {
  //
  FriendListPage(this.logic, this.state,
      {Key? key, this.formType = 'UserList', this.selectList, this.callBack})
      : super(key: key);
  final FriendListLogic logic;
  final FriendListState state;

  ///formType  UserList 联系人，新建对话   CreteGroup 创建群聊列表
  String formType;
  RxList<FriendInfo>? selectList;
  Function? callBack;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return PageStorage(
        bucket: bucket,
        child: Obx(() {
          return AzListView(
            key: const PageStorageKey('my-list-key'),
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

  Widget _itemWidget(BuildContext itemContext, int index) {
    final FriendInfo userInfo = state.dataList[index];
    if (userInfo.friendId == -1) {
      return Container(
        height: 174.h,
      );
    }
    bool isTopRoudis = false;
    bool isBotRoudis = false;
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
        if (formType == "CreteGroup") {
          callBack?.call(state.dataList[index]);
        } else {
          logic.toFriendsInfo(state.dataList[index]);
        }
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
                color: AppTheme.colorTextDarkPrimary),
            child: Row(
              children: [
                CustomUtils.avator(userInfo.avatar.toString() ?? ''),

                12.horizontalSpace,
                Text(
                  userInfo.getNick(),
                  style:
                      AppTheme().appTextStyle.textExtraLightStyleBlack.copyWith(
                            fontSize: 14.sp,
                            fontWeight: ThemeFontWeight.medium.weight,
                          ),
                ),
                const Spacer(),
                if (formType == 'CreteGroup')
                  ThemeImageWidget(
                    path:
                        logic.hasUser(userInfo, selectList ?? RxList()) != null
                            ? Resource.assetsSvgDefaultBoxSelectSvg
                            : Resource.assetsSvgDefaultBoxNoSelectSvg,
                    width: 24.w,
                    height: 24.w,
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
              color: AppTheme.colorTextDarkPrimary.withOpacity(0),
              width: double.infinity,
              child: Container(
                color: AppTheme.colorBorderLight,
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
}
