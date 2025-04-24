part of '../../index.dart';

class AddNewFriendLogic extends GetxController with AddFriendLogic {
  final AddNewFriendState state = AddNewFriendState();

  @override
  void onInit() {
    super.onInit();
    state.applyList = Get.arguments as RxList<ApplyFriendInfo>;
  }

  Future<void> refuseFriend(ApplyFriendInfo userInfo) async {
    bool ok = await FriendApi.friendDeleteApply(userInfo.id);
    if (ok) {
      SmartDialog.showToast(LocaleKeys.text_0198.tr,
          alignment: Alignment.center);
      ContactListLogic.to.getApplyList(false);

    }
  }

  void lookFriend(ApplyFriendInfo userInfo) {
    SmartDialog.show(
        builder: (_) {
          return LookNewFriendInfoWidget(userInfo, () {
            SmartDialog.dismiss();
            applyFriend(userInfo);
          }, () {
            SmartDialog.dismiss();
            refuseFriend(userInfo);
          });
        },
        alignment: Alignment.center);
  }

  Future<void> applyFriend(ApplyFriendInfo userInfo) async {
    bool ok = await FriendApi.friendSure(userInfo.id);
    if (ok) {
      SmartDialog.showToast(
          LocaleKeys.text_0199
              .trParams({"name": Utils.toEmpty(userInfo.nick) ?? ''}),
          alignment: Alignment.center);
      ContactListLogic.to.getApplyList(false);
      MessageStore.to.getConversationServerData();
    }
  }
}
