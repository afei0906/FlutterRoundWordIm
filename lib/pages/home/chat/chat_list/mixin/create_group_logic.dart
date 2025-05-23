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
    featFriendData();
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
    update();
  }

  Future<void> toNext() async {
    if (selectList.isEmpty) {
      SmartDialog.showToast(LocaleKeys.text_0179.tr,
          alignment: Alignment.center);
      return;
    }
    log("${isNext.value}");
    if (isNext.isFalse) {
      isNext.value = true;
      return;
    }

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
      groupInfo.joinNum = members.length + 1;
      groupInfo.createTime = Date.fromTime(DateTime.now(), 'yyyy-MM-dd HH:mm');
      ContactStore.to.addGroupInfo(groupInfo);
      await SmartDialog.dismiss(
        status: SmartStatus.allDialog,
      );
      MessageStore.to.initData();
      createGroupController.clear();
      Get.offNamedUntil(
          Routes.chatPage, (route) => route.settings.name == Routes.main,
          arguments: {
            "formType": ChatFormType.createGroup,
            "chatRequest": ChatRequest(
                channelType: 2,
                channelId: groupInfo.id,
                mid: 0,
                title: Utils.toEmpty(groupInfo.name) ?? '',
                avatar: Utils.toEmpty(groupInfo.avatar) ?? ''),
          });
    }
  }
}
