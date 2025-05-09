part of 'index.dart';

class ContactStore extends GetxController {
  static ContactStore get to => Get.find<ContactStore>();

  FriendListState friendListState = FriendListState();

  RxList<GroupInfo> groupList = RxList();
  final throttle = Throttle(const Duration(milliseconds: 800));

  @override
  Future<void> onInit() async {
    super.onInit();
    await featLocalFriendData();
    await featLocalGroupData();
    // await _initContact();
  }

  Future<void> _initContact() async {
    if (UserStore.to.isLogin.isTrue) {
      featServerFriendData();
    }
  }

  void featFriendData(Function callBack) {
    featLocalFriendData().then((onValue) {
      callBack.call();
    });
    throttle.run(() {
      featServerFriendData().then((onValue) {
        callBack.call();
      });
    });
  }

  Future<void> reMoveFriendById(dynamic id) async {
    friendListState.friendList.removeWhere((test) {
      return test.friendId == id;
    });
    friendListState.friendList.refresh();
    ChatListLogic.to.dataList.removeWhere((test) {
      return test.friendId == id;
    });
    ChatListLogic.to.dataList.refresh();
  }

  Future<void> featServerFriendData({String? keyword}) async {
    friendListState.friendList.value =
        await FriendApi.myFriendList(keyword: keyword);
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(friendListState.friendList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(friendListState.friendList);
    friendListState.friendList.refresh();
    // ContactListLogic.to.upload();
  }

  Future<void> featLocalFriendData() async {
    final String listStr = StorageService.to
        .getString("${kLocalFriendList}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(listStr)) {
      final List? list = json.decode(listStr) as List?;
      final List<FriendInfo> clientList = list
              ?.map((e) => FriendInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      if (clientList.isNotEmpty) {
        friendListState.friendList.value = clientList;
        // A-Z sort.
        SuspensionUtil.sortListBySuspensionTag(friendListState.friendList);
        // show sus tag.
        SuspensionUtil.setShowSuspensionStatus(friendListState.friendList);
        friendListState.friendList.refresh();
        // ContactListLogic.to.upload();
      }
    }
  }

  Future<void> saveFriendData(dynamic data) async {
    StorageService.to.setString(
        "${kLocalFriendList}_${UserStore.to.userInfo.value.id}",
        jsonEncode(data));
  }

  void featGroupData(Function callBack) {
    featLocalGroupData().then((onValue) {
      callBack.call();
    });
    featServerGroupData().then((onValue) {
      callBack.call();
    });
    ;
  }

  Future<void> addGroupInfo(GroupInfo groupInfo) async {
    GroupInfo? temp =
        groupList.firstWhereOrNull((test) => test.id == groupInfo.id);
    if (temp != null) {
      groupList.remove(temp);
    }
    groupList.add(groupInfo);
    groupList.refresh();
  }

  List<GroupInfo> replaceGroupInfoById(
    List<GroupInfo> originalList,
    GroupInfo replacementUser,
  ) {
    return originalList.map((user) {
      return user.id == replacementUser.id ? replacementUser : user;
    }).toList();
  }

  Future<void> featServerGroupData({String? keyword}) async {
    groupList.value = await GroupApi.myGroupList(keyword: keyword);
    // // A-Z sort.
    // SuspensionUtil.sortListBySuspensionTag(friendList);
    //
    // // show sus tag.
    // SuspensionUtil.setShowSuspensionStatus(friendList);
    groupList.refresh();
    ContactListLogic.to.update();
  }

  Future<void> featLocalGroupData() async {
    final String listStr = StorageService.to
        .getString("${kLocalGroupList}_${UserStore.to.userInfo.value.id}");
    if (!Utils.isEmpty(listStr)) {
      final List? list = json.decode(listStr) as List?;
      final List<GroupInfo> clientList = list
              ?.map((e) => GroupInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
      if (clientList.isNotEmpty) {
        groupList.value = clientList;
        groupList.refresh();
        ContactListLogic.to.update();
      }
    }
  }

  Future<void> saveGroupData(dynamic data) async {
    StorageService.to.setString(
        "${kLocalGroupList}_${UserStore.to.userInfo.value.id}",
        jsonEncode(data));
  }

  void clearData() {
    friendListState = FriendListState();
    groupList.clear();
  }
}
