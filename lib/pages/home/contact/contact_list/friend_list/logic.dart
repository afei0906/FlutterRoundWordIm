part of '../../../index.dart';

mixin FriendListLogic {
  FriendListState state = FriendListState();

  void toFriendsInfo(UserInfo u) {}

  Future<void> featData() async {
    ContactStore.to.featFriendData(() {
      state.dataList.clear();
      state.dataList.addAll(ContactStore.to.friendList);
      state.dataList.refresh();
    });
  }

  // void onChanged() {}

  Future<void> onSubmitted() async {
    bool has = state.dataList.contains(state.d);

    if (Utils.isEmpty(state.searchController.text)) {
      state.dataList.clear();
      state.dataList.addAll(ContactStore.to.friendList);
      if (has) {
        state.dataList.insert(0, state.d);
      }
      state.dataList.refresh();
      return;
    }
    state.dataList.clear();
    final List<UserInfo> list = ContactStore.to.friendList.where((test) {
      return test.nick
          .toString()
          .toLowerCase()
          .contains(state.searchController.text.toLowerCase());
    }).toList();
    // await FriendApi.myFriendList(keyword: state.searchController.text);
    state.dataList.addAll(list);
    if (has) {
      state.dataList.insert(0, state.d);
    }
    // if (list.isEmpty) {
    //   SmartDialog.showToast(LocaleKeys.text_0178.tr,
    //       alignment: Alignment.center);
    // }
    state.dataList.refresh();
  }
}
