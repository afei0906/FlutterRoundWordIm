part of '../../../index.dart';

mixin FriendListLogic {
  FriendListState state = ContactStore.to.friendListState;
  TextEditingController searchController = TextEditingController();
  RxList<FriendInfo> dataList = RxList();

  late ItemScrollController scroll = ItemScrollController();

  FriendInfo? hasUser(FriendInfo u, RxList<FriendInfo> selectList) {
    final FriendInfo userInfo = selectList.firstWhere((test) {
      return test.friendId == u.friendId;
    }, orElse: () => FriendInfo());
    if (Utils.isEmpty(userInfo.friendId)) {
      return null;
    }
    return userInfo;
  }

  void toFriendsInfo(FriendInfo u) {
    Get.toNamed(Routes.friendInfo, arguments: {
      "userInfo": UserInfo(
          id: u.friendId, nick: u.nick, avatar: u.avatar, showId: u.showId,status: u.status,)
    });
  }

  Future<void> featFriendData() async {
    ContactStore.to.featFriendData(() {
      dataList.clear();
      dataList.addAll(ContactStore.to.friendListState.friendList);
      dataList.refresh();
    });
  }

  // void onChanged() {}

  Future<void> onSubmitted() async {
    bool has = dataList.contains(state.d);
    if (Utils.isEmpty(searchController.text)) {
      dataList.clear();
      dataList.addAll(ContactStore.to.friendListState.friendList);
      if (has) {
        dataList.insert(0, state.d);
      }
      dataList.refresh();
      return;
    }
    dataList.clear();
    final List<FriendInfo> list =
        ContactStore.to.friendListState.friendList.where((test) {
      return test.nick
          .toString()
          .toLowerCase()
          .contains(searchController.text.toLowerCase());
    }).toList();
    // await FriendApi.myFriendList(keyword: state.searchController.text);
    dataList.addAll(list);
    if (has) {
      dataList.insert(0, state.d);
    }
    // if (list.isEmpty) {
    //   SmartDialog.showToast(LocaleKeys.text_0178.tr,
    //       alignment: Alignment.center);
    // }
    dataList.refresh();
  }
}
