part of 'index.dart';

class ContactStore extends GetxController {
  static ContactStore get to => Get.find<ContactStore>();

  RxList<FriendInfo> friendList = RxList();

  RxList<GroupInfo> groupList = RxList();
  final throttle = Throttle(const Duration(milliseconds: 800));

  @override
  Future<void> onInit() async {
    super.onInit();
    await featLocalFriendData();
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

  Future<void> featServerFriendData({String? keyword}) async {
    friendList.value = await FriendApi.myFriendList(keyword: keyword);
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(friendList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(friendList);
    friendList.refresh();
    // ContactListLogic.to.update();
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
        friendList.value = clientList;
        // A-Z sort.
        SuspensionUtil.sortListBySuspensionTag(friendList);
        // show sus tag.
        SuspensionUtil.setShowSuspensionStatus(friendList);
        friendList.refresh();
        // ContactListLogic.to.update();
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
        // A-Z sort.

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
    friendList.clear();
    groupList.clear();
  }
}
