part of '../../index.dart';

class ContactListLogic extends GetxController
    with AddFriendLogic, FriendListLogic {
  static ContactListLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<ContactListLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(ContactListLogic());
    }
  }

  // final ContactListState state = ContactListState();

  @override
  void onInit() {
    super.onInit();
    featFriendData();
    getApplyList(false);
  }

  void toNewFriends() {
    Get.toNamed(Routes.addNewFriendPage, arguments: applyList);
  }

  void toMyGroup() {
    Get.toNamed(Routes.groupListPage);
  }
}

extension ContactListLogicX on ContactListLogic {}
