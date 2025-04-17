part of '../../../index.dart';

mixin AddFriendLogic {
  TextEditingController searchFriendController = TextEditingController();
  RxString searchStr = RxString("");
  Rx<UserInfo> userInfo = UserInfo().obs;
  RxBool isSearch = false.obs;

  RxList<UserInfo> applyList = RxList();

  void toAdd() {
    searchStr.value = "";
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
    bool isApply = await FriendApi.apply(userInfo.value.id);
    if (isApply) {
      SmartDialog.dismiss();
    }
  }

  Future<void> getApplyList() async {
    FriendApi.applyList().then((onValue) {
      applyList.value = onValue;
    });
  }
}
