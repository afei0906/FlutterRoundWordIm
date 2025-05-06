part of '../../index.dart';

class FriendInfoLogic extends GetxController {
  final FriendInfoState state = FriendInfoState();

  @override
  void onInit() {
    super.onInit();
    featData();
  }

  ///聊天
  void toText() {
    Get.offNamedUntil(
        Routes.chatPage, (route) => route.settings.name == Routes.main,
        arguments: {
          "formType": ChatFormType.userInfo,
          "chatRequest": ChatRequest(
              channelType: 1,
              channelId: state.userInfo.value.id,
              mid: 0,
              title: state.userInfo.value.getNick(),
              avatar: Utils.toEmpty(state.userInfo.value.avatar) ?? '')
        });
  }

  ///视频
  void toVideo() {}

  ///语音
  void toPhone() {}

  ///邀请进群
  void clearData() {}

  ///清空聊天记录
  void inviteGroup() {}

  ///推荐联系人给好友
  void shareCard() {}

  ///备注
  void remark(){

  }

  ///删除好友
  Future<void> deleteUser() async {
    SmartDialog.show(builder: (_) {
      return CustomUtils.customAlert(
          title: LocaleKeys.text_0238.tr,
          msg: LocaleKeys.text_0239.tr,
          cancel: LocaleKeys.text_0011.tr,
          confirm: LocaleKeys.text_0212.tr,
          onCancel: SmartDialog.dismiss,
          onConfirm: () async {
            SmartDialog.dismiss();
            final bool isSuss = await FriendApi.deleteFriend(state.userInfo.value.id);
            ContactStore.to.reMoveFriendById(state.userInfo.value.id);
            if (isSuss) {
              Get.back();
            }
          });
    });
  }

  Future<void> featData() async {
    state.userInfo.value =
        await UserApi.getOtherUserInfo(state.userInfo.value.id) ??
            state.userInfo.value;
    state.userInfo.refresh();
  }
}
