part of '../../../index.dart';

mixin AddFriendLogic {
  TextEditingController searchFriendController = TextEditingController();
  RxString searchStr = RxString("");
  Rx<UserInfo> userInfo = UserInfo().obs;
  RxBool isSearch = false.obs;

  RxList<ApplyFriendInfo> applyList = RxList();

  void toAdd() {
    searchStr.value = "";
    isSearch = false.obs;
    searchFriendController.text = searchStr.value;
    userInfo = UserInfo().obs;
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
      final List<UserInfo> list =
          await FriendApi.userSearch(searchFriendController.text);
      isSearch.value = true;
      if (list.isNotEmpty) {
        userInfo.value = list.first;
      }
    }
  }

  Future<void> apply() async {
    final bool isApply = await FriendApi.apply(userInfo.value.id);
    if (isApply) {
      SmartDialog.dismiss(status: SmartStatus.allDialog);
    }
  }

  Future<void> getApplyList(bool showLoading) async {
    HttpThrottle.to.getThrottleByUrl(Urls.applyList).run(() {
      FriendApi.applyList(showLoading).then((onValue) {
        applyList.value = onValue;
        applyList.refresh();
      });
    });
  }
}
