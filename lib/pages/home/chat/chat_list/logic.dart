part of '../../index.dart';

class ChatListLogic extends GetxController
    with FriendListLogic, AddFriendLogic {
  static ChatListLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<ChatListLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(ChatListLogic());
    }
  }

  @override
  void onInit() {
    featData();
    super.onInit();
  }

  final ChatListState chatListState = ChatListState();

  void toAddNewChat() {
    if (!state.dataList.contains(state.d)) {
      state.dataList.insert(0, state.d);
    }
    SmartDialog.show(
        clickMaskDismiss: false,
        builder: (_) {
          return CreateNewChat(this);
        },
        alignment: Alignment.bottomCenter);
    // SmartDialog.show(
    //     clickMaskDismiss: false,
    //     builder: (_) {
    //       return ColoredBox(
    //           color: Colors.white,
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               CusAppBar.leading(Get.context!,
    //                   title: '',
    //                   appBarColor: Colors.transparent,
    //                   onBack: SmartDialog.dismiss),
    //               Row(
    //                 children: [
    //                   Expanded(
    //                       child: GestureDetector(
    //                     onTap: toAddGroup,
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: [
    //                         ThemeImageWidget(
    //                           path: Resource.assetsSvgDefaultChatGroupAddSvg,
    //                           width: 24.w,
    //                           height: 24.w,
    //                         ),
    //                         8.verticalSpace,
    //                         Text(
    //                           LocaleKeys.text_0101.tr,
    //                           style: AppTheme()
    //                               .appTextStyle
    //                               .textExtraLightStyleBlack,
    //                         )
    //                       ],
    //                     ),
    //                   )),
    //                   Expanded(
    //                       child: GestureDetector(
    //                     onTap: toAddUser,
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: [
    //                         ThemeImageWidget(
    //                           path: Resource.assetsSvgDefaultChatUserAddSvg,
    //                           width: 24.w,
    //                           height: 24.w,
    //                         ),
    //                         8.verticalSpace,
    //                         Text(
    //                           LocaleKeys.text_0102.tr,
    //                           style: AppTheme()
    //                               .appTextStyle
    //                               .textExtraLightStyleBlack,
    //                         )
    //                       ],
    //                     ),
    //                   )),
    //                 ],
    //               ),
    //               22.verticalSpace
    //             ],
    //           ));
    //     },
    //     alignment: Alignment.topCenter);
  }

  void toScan() {
    Get.toNamed(Routes.scanQrCodePage);
  }

  Future<void> toCreateGroup() async {
    SmartDialog.show(
        clickMaskDismiss: false,
        builder: (_) {
          return CreateGroupWidget();
        },
        alignment: Alignment.bottomCenter);
  }

  ///新建频道 todo
  void toNewChannel() {}
}

extension SearchChatLogicX on ChatListLogic {
  void onChanged() {
    update();
  }
}
