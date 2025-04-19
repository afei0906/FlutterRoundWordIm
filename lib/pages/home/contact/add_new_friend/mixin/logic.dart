part of '../../../index.dart';

mixin AddFriendLogic {
  TextEditingController searchFriendController = TextEditingController();
  RxString searchStr = RxString("");
  Rx<FriendInfo> userInfo = FriendInfo().obs;
  RxBool isSearch = false.obs;

  RxList<FriendInfo> applyList = RxList();

  void toAdd() {
    searchStr.value = "";
    searchFriendController.text = searchStr.value;
    userInfo = FriendInfo().obs;
    SmartDialog.show(
      clickMaskDismiss: false,
      builder: (_) {
        return AddFriendWidget(
          searchFriendController,
          this,
          () {
            searchStr.value = searchFriendController.text;
            isSearch.value = false;
            searchStr.refresh();
          },
          () {
            // 点击空白区域关闭键盘
            // 关闭键盘
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            userSearch();
          },
        );
      },
      alignment: Alignment.bottomCenter,
    );
  }

  Future<void> userSearch() async {
    if (!Utils.isEmpty(searchFriendController.text)) {
      final List<FriendInfo> list =
          await FriendApi.userSearch(searchFriendController.text);
      isSearch.value = true;
      if (list.isNotEmpty) {
        userInfo.value = list.first;
      }
    }
  }

  Future<void> apply() async {
    final bool isApply = await FriendApi.apply(userInfo.value.friendId);
    if (isApply) {
      SmartDialog.dismiss(status: SmartStatus.allDialog);
    }
  }

  Future<void> getApplyList() async {
    FriendApi.applyList().then((onValue) {
      applyList.value = onValue;
    });
  }
}
