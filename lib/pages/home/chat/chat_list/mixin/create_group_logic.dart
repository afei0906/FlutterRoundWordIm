part of '../../../index.dart';

class CreateGroupLogic extends GetxController with FriendListLogic {
  static CreateGroupLogic get to {
    final bool isControllerRegistered =
        GetInstance().isRegistered<CreateGroupLogic>();
    if (isControllerRegistered) {
      return Get.find();
    } else {
      return Get.put(CreateGroupLogic());
    }
  }

  TextEditingController createGroupController = TextEditingController();

  RxList<FriendInfo> selectList = RxList();

  RxBool isNext = false.obs;

  @override
  void onInit() {
    featData();
    super.onInit();
  }

  void selectUser(FriendInfo u) {
    final FriendInfo? userInfo = hasUser(u, selectList);
    if (userInfo != null) {
      selectList.remove(userInfo);
    } else {
      selectList.add(u);
    }
  }

  void reMove(FriendInfo u) {
    final FriendInfo? userInfo = hasUser(u, selectList);
    if (userInfo != null) {
      selectList.remove(userInfo);
    }
  }

  void toPre() {
    isNext.value = false;
  }

  void toNext() async {
    if (selectList.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0179.tr,
          alignment: Alignment.center);
      return;
    }
    isNext.value = true;
    if (Utils.isEmpty(createGroupController.text)) {
      SmartDialog.showToast(LocaleKeys.text_0182.tr,
          alignment: Alignment.center);
      return;
    }
    List members = [];
    selectList.forEach((action) {
      members.add(action.friendId);
    });

    final GroupInfo? groupInfo =
        await GroupApi.groupCreate(createGroupController.text, members);
    if (groupInfo != null) {
      SmartDialog.showToast("创建群组成功", alignment: Alignment.center);
      Get.offNamedUntil(
          Routes.chatPage, (route) => route.settings.name == Routes.splash,
          arguments: {"groupInfo": groupInfo});
      SmartDialog.dismiss(status: SmartStatus.allDialog);
    }
  }
}
