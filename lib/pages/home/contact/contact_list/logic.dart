part of '../../index.dart';

class ContactListLogic extends GetxController with AddFriendLogic {
  static ContactListLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<ContactListLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(ContactListLogic());
    }
  }

  final ContactListState state = ContactListState();

  @override
  void onInit() {
    super.onInit();
    featData();
    getApplyList();
  }

  Future<void> featData() async {
    ContactStore.to.featFriendData(() {
      state.dataList.clear();
      state.dataList.addAll(ContactStore.to.friendList);
      state.dataList.refresh();
    });
  }

  void toNewFriends() {
    Get.toNamed(Routes.addNewFriendPage);
  }

  void toMyGroup() {
    Get.toNamed(Routes.groupListPage);
  }

  void toFriendsInfo(UserInfo u) {}
}

extension ContactListLogicX on ContactListLogic {
  void onChanged() {
    update();
  }

  Future<void> onSubmitted() async {
    if (Utils.isEmpty(state.searchController.text)) {
      state.dataList.clear();
      state.dataList.addAll(ContactStore.to.friendList);
      state.dataList.refresh();
      return;
    }
    state.dataList.clear();
    state.dataList.addAll(
        await FriendApi.myFriendList(keyword: state.searchController.text));
    state.dataList.refresh();
  }
}
